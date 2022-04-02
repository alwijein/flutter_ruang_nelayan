import 'package:flutter_ruang_nelayan/boostrap.dart';

class ProfilePembeli extends StatelessWidget {
  const ProfilePembeli({
    Key? key,
    required this.image,
    required this.name,
    required this.tgl,
    required this.id,
  }) : super(key: key);

  final image, name, tgl, id;

  @override
  Widget build(BuildContext context) {
    return CollapseCard(
      content: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Diantar Ke',
              style: subtitleTextStyle,
            ),
            SizedBox(
              height: getPropertionateScreenHeight(10),
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                    image,
                  ),
                  radius: getPropertionateScreenWidht(25),
                ),
                SizedBox(
                  width: getPropertionateScreenWidht(10),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: primaryLightTextStyle.copyWith(
                          fontWeight: bold,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'tgl, pesanan: ',
                          style: primaryTextStyle,
                          children: [
                            TextSpan(
                              text: tgl,
                              style: primaryTextStyle.copyWith(
                                fontWeight: bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'ID Pembeli: ',
                          style: primaryTextStyle,
                          children: [
                            TextSpan(
                              text: id,
                              style: primaryTextStyle.copyWith(
                                fontWeight: bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
