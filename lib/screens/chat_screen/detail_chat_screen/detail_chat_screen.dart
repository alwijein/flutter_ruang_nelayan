import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/models/message_model.dart';
import 'package:flutter_ruang_nelayan/models/user_model.dart';
import 'package:flutter_ruang_nelayan/providers/auth_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:cross_connectivity/cross_connectivity.dart';

class DetailChatScreen extends StatefulWidget {
  @override
  _DetailChatScreenState createState() => _DetailChatScreenState();
}

class _DetailChatScreenState extends State<DetailChatScreen> {
  final loginState = GetStorage();

  // void update() async {
  //   AuthProvider authProvider =
  //       Provider.of<AuthProvider>(context, listen: false);
  //   await MessageService().updateData(
  //     int.parse(authProvider.user.id.toString()),
  //     int.parse(
  //       nelayan.id.toString(),
  //     ),
  //   );
  // }

  TextEditingController messageController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    UserModel nelayan = Get.arguments['nelayan'];
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleAddMessage() async {
      await MessageService().updateData(
        userId: int.parse(
          authProvider.user.id.toString(),
        ),
        reciverId: int.parse(
          nelayan.id.toString(),
        ),
      );
      await MessageService().addMessage(
        user: authProvider.user,
        isFromUser: true,
        message: messageController.text,
        reciverId: int.parse(nelayan.id.toString()),
      );

      setState(() {
        messageController.text = '';
      });
    }

    PreferredSize header() {
      return PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: kBackgroundColor1,
          centerTitle: false,
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(nelayan.avatar.toString()),
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nelayan.name.toString(),
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    nelayan.alamat.toString(),
                    style: secondaryTextStyle.copyWith(
                      fontWeight: light,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget chatInput() {
      return Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: kBackgroundColor2,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: TextFormField(
                        controller: messageController,
                        style: primaryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Tulis Pesan...',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: handleAddMessage,
                  child: const Icon(Icons.send, color: kPrimaryColor),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget content() {
      return StreamBuilder<List<MessageModel>>(
          stream: MessageService().getMessagesByUserId(
            reciverId: int.parse(nelayan.id.toString()),
            userId: int.parse(authProvider.user.id.toString()),
          ),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                children: snapshot.data!
                    .map((MessageModel message) => ChatBubble(
                          isSender: message.userName == authProvider.user.name,
                          text: message.message ?? '',
                        ))
                    .toList(),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          });
    }

    return Scaffold(
      appBar: header(),
      body: Column(
        children: [
          Expanded(
            child: ConnectivityBuilder(builder: (context, isConnected, status) {
              return isConnected == false
                  ? Center(
                      child: Icon(
                        Icons.signal_wifi_off,
                        color: kAlertColor,
                        size: getPropertionateScreenWidht(100),
                      ),
                    )
                  : content();
            }),
          ),
          chatInput()
        ],
      ),
    );
  }
}
