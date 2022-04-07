part of 'components.dart';

class ChatTile extends StatelessWidget {
  ChatTile({
    required this.listUser,
  });

  final UserModel listUser;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          '/chat/detail',
          arguments: {'nelayan': listUser},
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: getPropertionateScreenHeight(10)),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/ikan_01.png',
                  width: 54,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        listUser.name.toString(),
                        style: primaryTextStyle.copyWith(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        listUser.alamat.toString(),
                        style: secondaryTextStyle.copyWith(
                          fontWeight: light,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Text(
                  'Now',
                  style: secondaryTextStyle.copyWith(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Divider(
              thickness: 1,
              color: Color(0xff2B2939),
            ),
          ],
        ),
      ),
    );
  }
}
