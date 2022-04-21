import 'dart:io';

import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/controllers/state_controller.dart';
import 'package:flutter_ruang_nelayan/providers/auth_provider.dart';
import 'package:get/get.dart';

class EditDataForm extends StatelessWidget {
  const EditDataForm({Key? key, required this.file}) : super(key: key);

  final File file;
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    const bool isLoading = false;
    final List<String> errors = [];
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    StateController stateController = Get.find<StateController>();

    TextEditingController name =
        TextEditingController(text: authProvider.user.name);
    TextEditingController nomorTelp =
        TextEditingController(text: authProvider.user.noTelp);
    TextEditingController alamat =
        TextEditingController(text: authProvider.user.alamat);

    return Container(
      margin: EdgeInsets.only(
        top: getPropertionateScreenHeight(20),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama Lengkap',
              style: primaryTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 16,
              ),
            ),
            buildFieldInput(
              'name',
              'Masukkan Nama Lengkap Anda',
              name,
              Icons.person,
            ),
            Text(
              'Nomor Telpon',
              style: primaryTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 16,
              ),
            ),
            buildFieldInput(
              'nomorTelp',
              'Masukkan Nomor Telepon Anda',
              nomorTelp,
              Icons.phone,
            ),
            Text(
              'Alamat',
              style: primaryTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 16,
              ),
            ),
            buildFieldInput(
              'alamat',
              'Masukkan Alamat Anda',
              alamat,
              Icons.place,
            ),
            SizedBox(
              height: getPropertionateScreenHeight(20),
            ),
            Obx(() {
              return stateController.loading.value
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
                        'Terapkan',
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      press: () async {
                        stateController.isLoading();
                        if (errors.isEmpty) {
                          await authProvider.updateProfile(
                            name: name.text,
                            noTelp: nomorTelp.text,
                            alamat: alamat.text,
                            avatar: file,
                          );
                          stateController.isNotLoading();
                          stateController.editProfile();
                        } else {
                          stateController.isNotLoading();

                          Get.snackbar(
                            'Error',
                            'message',
                            messageText: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(
                                errors.length,
                                (index) => Text(
                                  errors[index],
                                  style: whiteTextStyle,
                                ),
                              ),
                            ),
                            backgroundColor: Colors.red,
                            colorText: kWhiteTextColor,
                            margin: EdgeInsets.symmetric(
                              vertical: getPropertionateScreenHeight(10),
                              horizontal: getPropertionateScreenHeight(24),
                            ),
                          );
                        }
                      });
            })
          ],
        ),
      ),
    );
  }
}

TextFieldContainer buildFieldInput(String type, String hintText,
    TextEditingController inputController, IconData icon) {
  return TextFieldContainer(
    isWrapSize: false,
    child: TextFormField(
        style: primaryTextStyle,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryLightColor,
          ),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: subtitleTextStyle.copyWith(
            fontSize: 14,
          ),
        ),
        keyboardType: TextInputType.text,
        controller: inputController,
        onChanged: (value) {},
        validator: (value) {
          return null;
        }),
  );
}
