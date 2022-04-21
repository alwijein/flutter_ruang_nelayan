import 'dart:io';

import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/controllers/state_controller.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/data_nelayan_screen/components/edit_data_form.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AvatarProfile extends StatelessWidget {
  const AvatarProfile({
    Key? key,
    required this.name,
    required this.noTelp,
    required this.alamat,
    required this.isEdit,
    required this.avatar,
  }) : super(key: key);

  final String avatar, name, noTelp, alamat;
  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    File? file;
    StateController stateController = Get.find();
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getPropertionateScreenHeight(24),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    // backgroundImage: NetworkImage(
                    //   avatar,
                    // ),
                    radius: getPropertionateScreenWidht(30),
                  ),
                  isEdit
                      ? DefaultButtonGradient(
                          text: Text(
                            'Upload',
                            style: whiteTextStyle.copyWith(
                              fontWeight: bold,
                              fontSize: 11,
                            ),
                          ),
                          press: () async {
                            print("sebelum " + file.toString());
                            file = await getImage();
                            print("sesudah" + file.toString());
                          },
                          isInfinity: false,
                          color1: kColorLightkGreen,
                          color2: kColorDarkGreen,
                        )
                      : const SizedBox(),
                ],
              ),
              SizedBox(
                width: getPropertionateScreenWidht(20),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/face_icon.svg'),
                      SizedBox(
                        width: getPropertionateScreenWidht(14),
                      ),
                      Text(
                        name,
                        style: subtitleTextStyle,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/phone_icon.svg',
                      ),
                      SizedBox(
                        width: getPropertionateScreenWidht(14),
                      ),
                      Text(
                        noTelp,
                        style: subtitleTextStyle,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/location_icon.svg',
                      ),
                      SizedBox(
                        width: getPropertionateScreenWidht(22),
                      ),
                      Text(
                        alamat,
                        style: subtitleTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          isEdit
              ? EditDataForm(
                  file: file ?? File(avatar),
                )
              : SizedBox(),
        ],
      ),
    );
  }

  Future<File?> getImage() async {
    ImagePicker _picker = ImagePicker();
    XFile? selectImage =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 30);
    return File(selectImage!.path);
  }
}
