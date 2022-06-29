import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:get/get.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController noKtp = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rePassword = TextEditingController();
  TextEditingController noTelp = TextEditingController();

  bool isLoading = false;
  bool showPass = true;
  String checkPass = '';
  String verificationId = '';

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final List<String> errors = ["Register Failed"];

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'NIK KTP',
            style: primaryTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 16,
            ),
          ),
          buildFieldInput(
              type: 'noKtp',
              hintText: 'Masukkan NIK Anda',
              inputController: noKtp,
              icon: 'assets/icons/identity_icon.svg'),
          Text(
            'Nama Lengkap',
            style: primaryTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 16,
            ),
          ),
          buildFieldInput(
              type: 'name',
              hintText: 'Masukkan Nama Lengkap Anda',
              inputController: nama,
              icon: 'assets/icons/person_icon.svg'),
          Text(
            'Nomor Telepon / HP',
            style: primaryTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 16,
            ),
          ),
          buildFieldInput(
              type: 'noTelp',
              hintText: 'Masukkan Nomor Telpon Anda',
              inputController: noTelp,
              icon: 'assets/icons/62_icon.svg'),
          Text(
            'Kata Sandi',
            style: primaryTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 16,
            ),
          ),
          buildFieldPass(
            type: 'pass',
            controller: password,
          ),
          Text(
            'Konfirmasi Kata Sandi',
            style: primaryTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 16,
            ),
          ),
          buildFieldPass(
            type: 'rePass',
            controller: rePassword,
          ),
          SizedBox(
            height: getPropertionateScreenHeight(20),
          ),
          isLoading
              ? DefaultButton(
                  text: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getPropertionateScreenWidht(30),
                    ),
                    child: const CircularProgressIndicator(
                      strokeWidth: 3,
                      valueColor: AlwaysStoppedAnimation(
                        kBackgroundColor1,
                      ),
                    ),
                  ),
                  press: () {})
              : DefaultButton(
                  text: Text(
                    'Daftar',
                    style: whiteTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  press: () async {
                    setState(() {
                      isLoading = true;
                    });
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        _formKey.currentState!.save();
                      });
                    }
                    String numberPhone = noTelp.text;
                    if (password.text == rePassword.text) {
                      if (errors.length == 1) {
                        String combine = "+62" + numberPhone;
                        await _auth.verifyPhoneNumber(
                          phoneNumber: combine,
                          verificationCompleted: (phoneAuthCredential) async {
                            setState(() {
                              print("Berhasilllllll");
                            });
                          },
                          verificationFailed: (verificationFailed) async {
                            setState(() {
                              print(combine);
                              print("salahhhhhhhhhhhhhhhhh");
                            });
                          },
                          codeSent: (verificationId, resendingToken) async {
                            setState(() {
                              this.verificationId = verificationId;
                              Get.toNamed(
                                '/otp',
                                arguments: [
                                  {'no_ktp': noKtp.text},
                                  {'nama': nama.text},
                                  {'no_telp': noTelp.text},
                                  {'password': password.text},
                                  {'verificationId': verificationId},
                                ],
                              );
                            });
                          },
                          codeAutoRetrievalTimeout: (verificationId) async {},
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(
                                errors.length,
                                (index) => Text(errors[index]),
                              ),
                            ),
                          ),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            'Password Tidak Sesuai',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }
                    setState(() {
                      isLoading = false;
                    });
                  }),
          SizedBox(
            height: getPropertionateScreenHeight(20),
          ),
        ],
      ),
    );
  }

  TextFieldContainer buildFieldPass({
    required TextEditingController controller,
    required String type,
  }) {
    return TextFieldContainer(
      isWrapSize: false,
      child: TextFormField(
        obscureText: showPass,
        style: primaryTextStyle,
        decoration: InputDecoration(
          icon: const Icon(
            Icons.lock,
            color: kPrimaryLightColor,
          ),
          suffix: GestureDetector(
            onTap: () {
              setState(() {
                if (showPass == true) {
                  showPass = false;
                } else {
                  showPass = true;
                }
              });
            },
            child: Icon(
              showPass ? Icons.visibility_off : Icons.visibility,
              color: kPrimaryColor,
            ),
          ),
          hintText: "Masukkan 8 Digit Kata Sandi",
          hintStyle: subtitleTextStyle.copyWith(
            fontSize: 14,
          ),
          border: InputBorder.none,
        ),
        onChanged: (value) {
          if (type == 'pass') {
            if (value.isEmpty && errors.contains(kPassNullError)) {
              setState(() {
                errors.remove(kPassNullError);
              });
            } else if (value.length < 8 && errors.contains(kShortPassError)) {
              setState(() {
                errors.remove(kShortPassError);
              });
            }
          } else if (type == 'rePass') {
            if (value.isEmpty && errors.contains(kPassNullError)) {
              setState(() {
                errors.remove(kPassNullError);
              });
            }
          }
        },
        keyboardType: TextInputType.visiblePassword,
        validator: (value) {
          if (type == 'pass') {
            if (value!.isEmpty && !errors.contains(kPassNullError)) {
              setState(() {
                errors.add(kPassNullError);
              });
            } else if (value.length < 8 && !errors.contains(kShortPassError)) {
              setState(() {
                errors.add(kShortPassError);
              });
            }
          } else if (type == 'rePass') {
            if (value!.isEmpty && !errors.contains(kPassNullError)) {
              setState(() {
                errors.add(kPassNullError);
              });
            }
          }
          return null;
        },
        controller: controller,
      ),
    );
  }

  TextFieldContainer buildFieldInput({
    required String type,
    required String hintText,
    required TextEditingController inputController,
    required String icon,
  }) {
    return TextFieldContainer(
      isWrapSize: false,
      child: TextFormField(
          style: primaryTextStyle,
          decoration: InputDecoration(
            icon: SvgPicture.asset(
              icon,
              color: kPrimaryLightColor,
              width: getPropertionateScreenWidht(30),
            ),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: subtitleTextStyle.copyWith(
              fontSize: 14,
            ),
          ),
          keyboardType: TextInputType.name,
          controller: inputController,
          onChanged: (value) {
            if (type == 'noKtp') {
              if (value.isNotEmpty && errors.contains(kNoKtpNullError)) {
                setState(() {
                  errors.remove(kNoKtpNullError);
                });
              }
            } else if (type == 'name') {
              if (value.isNotEmpty && errors.contains(kNamelNullError)) {
                setState(() {
                  errors.remove(kNamelNullError);
                });
              }
            } else if (type == 'noTelp') {
              if (value.isNotEmpty && errors.contains(kNoTelpNullError)) {
                setState(() {
                  errors.remove(kNoTelpNullError);
                });
              } else if (value[0] != '0' &&
                  errors.contains(kInvalidNoTelpError)) {
                setState(() {
                  errors.remove(kInvalidNoTelpError);
                });
              }
            }
          },
          validator: (value) {
            if (type == 'noKtp') {
              if (value!.isEmpty && !errors.contains(kNoKtpNullError)) {
                setState(() {
                  errors.add(kNoKtpNullError);
                });
              }
            } else if (type == 'name') {
              if (value!.isEmpty && !errors.contains(kNamelNullError)) {
                setState(() {
                  errors.add(kNamelNullError);
                });
              }
            } else if (type == 'noTelp') {
              if (value!.isEmpty && !errors.contains(kNoTelpNullError)) {
                setState(() {
                  errors.add(kNoTelpNullError);
                });
              } else if (value[0] == '0' &&
                  !errors.contains(kInvalidNoTelpError)) {
                setState(() {
                  errors.add(kInvalidNoTelpError);
                });
              }
            }

            return null;
          }),
    );
  }
}
