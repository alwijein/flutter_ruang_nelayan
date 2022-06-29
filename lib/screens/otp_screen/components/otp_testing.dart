import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:get/get.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class OtpTesting extends StatefulWidget {
  @override
  _OtpTestingState createState() => _OtpTestingState();
}

class _OtpTestingState extends State<OtpTesting> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  String verificationId = '';

  bool showLoading = false;

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false;
      });

      if (authCredential.user != null) {
        Get.toNamed('/home-nelayan');
      }
    } on FirebaseAuthException {
      setState(() {
        showLoading = false;
      });
    }
  }

  getMobileFormWidget(context) {
    return Column(
      children: [
        const Spacer(),
        TextField(
          controller: phoneController,
          decoration: const InputDecoration(
            hintText: "Phone Number",
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        TextButton(
          onPressed: () async {
            setState(() {
              showLoading = true;
            });

            await _auth.verifyPhoneNumber(
              phoneNumber: phoneController.text,
              verificationCompleted: (phoneAuthCredential) async {
                setState(() {
                  print("Berhasilllllll");

                  showLoading = false;
                });
                //signInWithPhoneAuthCredential(phoneAuthCredential);
              },
              verificationFailed: (verificationFailed) async {
                setState(() {
                  print("salahhhhhhhhhhhhhhhhh");
                  showLoading = false;
                });
              },
              codeSent: (verificationId, resendingToken) async {
                setState(() {
                  showLoading = false;
                  currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
                  this.verificationId = verificationId;
                });
              },
              codeAutoRetrievalTimeout: (verificationId) async {},
            );
          },
          child: const Text("SEND"),
        ),
        const Spacer(),
      ],
    );
  }

  getOtpFormWidget(context) {
    return Column(
      children: [
        const Spacer(),
        TextField(
          controller: otpController,
          decoration: const InputDecoration(
            hintText: "Enter OTP",
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        TextButton(
          onPressed: () async {
            PhoneAuthCredential phoneAuthCredential =
                PhoneAuthProvider.credential(
              verificationId: verificationId,
              smsCode: otpController.text,
            );

            signInWithPhoneAuthCredential(phoneAuthCredential);
          },
          child: const Text("VERIFY"),
        ),
        const Spacer(),
      ],
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Container(
          child: showLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                  ? getMobileFormWidget(context)
                  : getOtpFormWidget(context),
          padding: const EdgeInsets.all(16),
        ));
  }
}
