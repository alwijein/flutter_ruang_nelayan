part of 'components.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({
    required this.listUser,
  });
  final UserModel listUser;
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return GestureDetector(
      onTap: () async {
        await MessageService().updateData(
          userId: int.parse(
            authProvider.user.id.toString(),
          ),
          reciverId: int.parse(
            listUser.id.toString(),
          ),
        );
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
                CircleAvatar(
                  backgroundImage: NetworkImage(listUser.avatar.toString()),
                ),
                const SizedBox(
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
                    ],
                  ),
                ),
                StreamBuilder<List<MessageModel>>(
                    stream: MessageService().checkMassageOnce(
                      userId: int.parse(authProvider.user.id.toString()),
                      reciverId: int.parse(listUser.id.toString()),
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        bool isGet = false;
                        for (var data in snapshot.data!) {
                          if (data.isRead == false) {
                            isGet = true;
                          }
                        }
                        return isGet
                            ? const Icon(
                                Icons.circle_notifications,
                                color: Colors.red,
                              )
                            : const SizedBox();
                      } else {
                        return const SizedBox();
                      }
                    }),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            const Divider(
              thickness: 1,
              color: Color(0xff2B2939),
            ),
          ],
        ),
      ),
    );
  }
}
