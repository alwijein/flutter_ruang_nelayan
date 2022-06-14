part of 'components.dart';

class IconButtonRedDotNotificationWidget extends StatelessWidget {
  const IconButtonRedDotNotificationWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SvgPicture.asset('assets/icons/chat.svg'),
        _redDot(),
      ],
    );
  }

  Widget _redDot() {
    return Positioned(
      right: 1,
      bottom: 15,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(7),
        ),
        constraints: BoxConstraints(
          minWidth: 10,
          minHeight: 10,
        ),
        child: Container(
          width: 1,
          height: 1,
        ),
      ),
    );
  }
}
