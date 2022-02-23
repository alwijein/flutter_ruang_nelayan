import 'package:flutter_ruang_nelayan/boostrap.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({
    Key? key,
    // required this.email,
    // required this.password,
    // required this.nama,
    // required this.nomorUnik,
    // required this.status,
  }) : super(key: key);

  @override
  State<OtpForm> createState() => _OtpFormState();
  // final String email, password, nama, nomorUnik, status;
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

  bool verify = false;
  String otp = '';

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

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
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
          // Row(
          //   children: [
          //     Text(
          //       'Belum Masuk? ',
          //       style: primaryTextStyle,
          //     ),
          //     GestureDetector(
          //       child: Text(
          //         'Kirim Ulang  ',
          //         style: primaryTextStyle.copyWith(
          //           color: kPrimaryLightColor,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
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
                    'Lanjutkan',
                    style: whiteTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  press: () async {
                    setState(() {
                      isLoading = true;
                    });
                    if (verify == false) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Verifikasi Gagal'),
                        ),
                      );
                    } else if (verify == true) {
                      if (isLoading) {
                        Navigator.of(context).pop();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Login Gagal'),
                          ),
                        );
                      }
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
