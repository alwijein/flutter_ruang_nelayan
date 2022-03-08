import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:get/get.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController nik = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController nomorTelp = TextEditingController();

  bool isLoading = false;
  bool showPass = true;

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
          buildFieldInput('nik', 'Masukkan NIK Anda', nik, Icons.person),
          Text(
            'Nama Lengkap',
            style: primaryTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 16,
            ),
          ),
          buildFieldInput(
              'name', 'Masukkan Nama Lengkap Anda', nama, Icons.email),
          Text(
            'Nomor Telepon / HP',
            style: primaryTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 16,
            ),
          ),
          buildFieldInput('telp', 'Masukkan Nomor Telepon Anda', nomorTelp,
              Icons.format_indent_increase_outlined),
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
                      Get.toNamed(
                        '/otp-nelayan',
                        arguments: [
                          nomorTelp.text,
                          password.text,
                          nama.text,
                          nomorTelp.text,
                        ],
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

  TextFieldContainer buildFieldInput(String type, String hintText,
      TextEditingController inputController, IconData icon) {
    return TextFieldContainer(
      isWrapSize: false,
      child: TextFormField(
          style: primaryTextStyle,
          decoration: InputDecoration(
            icon: Icon(
              icon,
              color: kPrimaryLightColor,
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
            return 'Something Wrong';
          }),
    );
  }
}
