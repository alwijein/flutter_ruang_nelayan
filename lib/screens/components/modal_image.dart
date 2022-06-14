part of 'components.dart';

class ModalImage extends StatelessWidget {
  const ModalImage({
    Key? key,
    required this.img,
  }) : super(key: key);
  final String img;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(img), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
