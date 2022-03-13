import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/providers/auth_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController nomorTelp = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isLoading = false;
  bool showPass = true;

  final List<String> errors = [];

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
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
            'nomorTelp',
            'Masukkan Nomor Telepon Anda',
            nomorTelp,
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
                        kBackgroundColor1,
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
                    if (errors.isEmpty) {
                      if (await authProvider.login(
                          noTelp: nomorTelp.text, password: password.text)) {
                        Get.offAllNamed('/home-nelayan');
                      } else {
                        Get.snackbar(
                          'Error',
                          'Password Salah',
                          backgroundColor: Colors.red,
                          colorText: kWhiteTextColor,
                          margin: EdgeInsets.symmetric(
                            vertical: getPropertionateScreenHeight(10),
                            horizontal: getPropertionateScreenHeight(24),
                          ),
                        );
                      }
                    } else {
                      Get.snackbar(
                        'Error',
                        'message',
                        messageText: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(
                            errors.length,
                            (index) => Text(
                              errors[index],
                              style: whiteTextStyle,
                            ),
                          ),
                        ),
                        backgroundColor: Colors.red,
                        colorText: kWhiteTextColor,
                        margin: EdgeInsets.symmetric(
                          vertical: getPropertionateScreenHeight(10),
                          horizontal: getPropertionateScreenHeight(24),
                        ),
                      );
                    }
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
          keyboardType: TextInputType.number,
          controller: inputController,
          onChanged: (value) {
            if (type == 'noTelp') {
              if (value.isNotEmpty && errors.contains(kNoTelpNullError)) {
                setState(() {
                  errors.remove(kNoTelpNullError);
                });
              } else if (!errors.contains(kInvalidNoTelpError)) {
                setState(() {
                  errors.remove(kInvalidNoTelpError);
                });
              }
            }
          },
          validator: (value) {
            if (type == 'noTelp') {
              if (value!.isEmpty && !errors.contains(kNoTelpNullError)) {
                setState(() {
                  errors.add(kNoTelpNullError);
                });
              } else if (!errors.contains(kInvalidNoTelpError)) {
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
