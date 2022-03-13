import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/providers/auth_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode pin2FocusNode = FocusNode();
  FocusNode pin3FocusNode = FocusNode();
  FocusNode pin4FocusNode = FocusNode();
  FocusNode pin5FocusNode = FocusNode();
  FocusNode pin6FocusNode = FocusNode();

  TextEditingController input1 = TextEditingController();
  TextEditingController input2 = TextEditingController();
  TextEditingController input3 = TextEditingController();
  TextEditingController input4 = TextEditingController();
  TextEditingController input5 = TextEditingController();
  TextEditingController input6 = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
  }

  @override
  void dispose() {
    pin2FocusNode.dispose();
    super.dispose();
  }

  void nextField({required String value, required FocusNode focusNode}) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      isLoading = true;
    });

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        isLoading = false;
      });

      if (authCredential.user != null) {
        Get.offAllNamed('/home-nelayan');
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return Form(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kBackgroundColor2,
                ),
                width: getPropertionateScreenWidht(40),
                child: TextFormField(
                  autofocus: true,
                  style: primaryTextStyle.copyWith(
                    fontSize: getPropertionateScreenHeight(24),
                    fontWeight: medium,
                  ),
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value: value, focusNode: pin2FocusNode);
                  },
                  controller: input1,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: kBackgroundColor2,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: getPropertionateScreenWidht(40),
                child: TextFormField(
                  focusNode: pin2FocusNode,
                  style: primaryTextStyle.copyWith(
                    fontSize: getPropertionateScreenHeight(24),
                    fontWeight: medium,
                  ),
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value: value, focusNode: pin3FocusNode);
                  },
                  controller: input2,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: kBackgroundColor2,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: getPropertionateScreenWidht(40),
                child: TextFormField(
                  focusNode: pin3FocusNode,
                  style: primaryTextStyle.copyWith(
                    fontSize: getPropertionateScreenHeight(24),
                    fontWeight: medium,
                  ),
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value: value, focusNode: pin4FocusNode);
                  },
                  controller: input3,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: kBackgroundColor2,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: getPropertionateScreenWidht(40),
                child: TextFormField(
                  focusNode: pin4FocusNode,
                  style: primaryTextStyle.copyWith(
                    fontSize: getPropertionateScreenHeight(24),
                    fontWeight: medium,
                  ),
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value: value, focusNode: pin5FocusNode);
                  },
                  controller: input4,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: kBackgroundColor2,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: getPropertionateScreenWidht(40),
                child: TextFormField(
                  focusNode: pin5FocusNode,
                  style: primaryTextStyle.copyWith(
                    fontSize: getPropertionateScreenHeight(24),
                    fontWeight: medium,
                  ),
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value: value, focusNode: pin6FocusNode);
                  },
                  controller: input5,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: kBackgroundColor2,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: getPropertionateScreenWidht(40),
                child: TextFormField(
                  focusNode: pin6FocusNode,
                  style: primaryTextStyle.copyWith(
                    fontSize: getPropertionateScreenHeight(24),
                    fontWeight: medium,
                  ),
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    pin4FocusNode.unfocus();
                  },
                  controller: input6,
                ),
              ),
            ],
          ),
          SizedBox(
            height: getPropertionateScreenHeight(24),
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
                  press: () {},
                )
              : DefaultButton(
                  text: Text(
                    'Lanjutkan',
                    style: whiteTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  press: () async {
                    setState(() {
                      isLoading = true;
                    });

                    var noKtp = Get.arguments[0]['no_ktp'];
                    var nama = Get.arguments[1]['nama'];
                    var noTelp = Get.arguments[2]['no_telp'];
                    var password = Get.arguments[3]['password'];
                    var verificationId = Get.arguments[4]['verificationId'];

                    if (await authProvider.register(
                      noKtp: noKtp,
                      name: nama,
                      noTelp: "0$noTelp",
                      password: password,
                    )) {
                      PhoneAuthCredential phoneAuthCredential =
                          PhoneAuthProvider.credential(
                        verificationId: verificationId,
                        smsCode: input1.text +
                            input2.text +
                            input3.text +
                            input4.text +
                            input5.text +
                            input6.text,
                      );

                      signInWithPhoneAuthCredential(phoneAuthCredential);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Register Gagal'),
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
}
