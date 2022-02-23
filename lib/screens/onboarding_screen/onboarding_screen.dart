import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/screens/onboarding_screen/components/onboarding_body.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: OnboardingBody(),
    );
  }
}
