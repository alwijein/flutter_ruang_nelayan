import 'package:flutter_ruang_nelayan/boostrap.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController nama = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController nomorUnik = TextEditingController();
  TextEditingController status = TextEditingController();

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
            'Nomor Telepon',
            style: primaryTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 16,
            ),
          ),
          buildFieldInput(
            'telp',
            'Masukkan Nomor Telepon Anda',
            nomorUnik,
            Icons.phone,
          ),
          Text(
            'Kata Sandi',
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
                    'Masuk',
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
                    // if (errors.length == 1) {
                    //   Navigator.of(context)
                    //       .pushReplacement(MaterialPageRoute(builder: (_) {
                    //     return OtpScreen(
                    //         email: email.text,
                    //         password: password.text,
                    //         nama: nama.text,
                    //         nomorUnik: nomorUnik.text,
                    //         status: status.text);
                    //   }));
                    // } else {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(
                    //       backgroundColor: Colors.red,
                    //       content: Column(
                    //         mainAxisSize: MainAxisSize.min,
                    //         children: List.generate(
                    //           errors.length,
                    //           (index) => Text(errors[index]),
                    //         ),
                    //       ),
                    //     ),
                    //   );
                    // }
                    setState(() {
                      isLoading = false;
                    });
                  }),
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
