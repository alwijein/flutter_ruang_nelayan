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
  TextEditingController noTelp = TextEditingController();

  bool isLoading = false;
  bool showPass = true;
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
              type: 'nik',
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
          buildFieldPass(),
          Text(
            'Konfirmasi Kata Sandi',
            style: primaryTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 16,
            ),
          ),
          buildFieldPass(),
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
                        kPrimaryColor,
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
                    if (errors.length == 1) {
                      String numberPhone = noTelp.text;
                      String combine = "+62" + numberPhone;
                      await _auth.verifyPhoneNumber(
                        phoneNumber: combine,
                        verificationCompleted: (phoneAuthCredential) async {
                          setState(() {
                            print("Berhasilllllll");

                            isLoading = false;
                          });
                        },
                        verificationFailed: (verificationFailed) async {
                          setState(() {
                            print(combine);
                            print("salahhhhhhhhhhhhhhhhh");
                            isLoading = false;
                          });
                        },
                        codeSent: (verificationId, resendingToken) async {
                          setState(() {
                            isLoading = false;
                            this.verificationId = verificationId;
                            Get.toNamed(
                              '/otp-nelayan',
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

  TextFieldContainer buildFieldPass() {
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
          if (value.isNotEmpty && errors.contains(kPassNullError)) {
            setState(() {
              errors.remove(kPassNullError);
            });
          } else if (value.length >= 8 && errors.contains(kShortPassError)) {
            setState(() {
              errors.remove(kShortPassError);
            });
          }
        },
        keyboardType: TextInputType.visiblePassword,
        validator: (value) {
          if (value!.isEmpty && !errors.contains(kPassNullError)) {
            setState(() {
              errors.add(kPassNullError);
            });
          } else if (value.length < 8 && !errors.contains(kShortPassError)) {
            setState(() {
              errors.add(kShortPassError);
            });
          }
          return null;
        },
        controller: password,
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
            if (type == 'name') {
              if (value.isNotEmpty && errors.contains(kNimNullError)) {
                setState(() {
                  errors.remove(kNimNullError);
                });
              } else if (type == 'email') {
                if (value.isNotEmpty && errors.contains(kAddressNullError)) {
                  setState(() {
                    errors.remove(kAddressNullError);
                  });
                } else if (emailValidatorRegExp.hasMatch(value) &&
                    errors.contains(kInvalidEmailError)) {
                  setState(() {
                    errors.remove(kInvalidEmailError);
                  });
                }
              }
            }
          },
          validator: (value) {
            if (type == 'name') {
              if (value!.isEmpty && !errors.contains(kNimNullError)) {
                setState(() {
                  errors.add(kNimNullError);
                });
              }
            } else if (type == 'email') {
              if (value!.isEmpty && !errors.contains(kAddressNullError)) {
                setState(() {
                  errors.add(kAddressNullError);
                });
              } else if (!emailValidatorRegExp.hasMatch(value) &&
                  !errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.add(kInvalidEmailError);
                });
              }
            }
            return null;
          }),
    );
  }
}
