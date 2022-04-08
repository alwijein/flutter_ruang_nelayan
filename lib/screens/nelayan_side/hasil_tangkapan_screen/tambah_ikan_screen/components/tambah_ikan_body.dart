import 'dart:io';

import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/controllers/counter_controller.dart';
import 'package:flutter_ruang_nelayan/models/hasil_tangkapan_model.dart';
import 'package:flutter_ruang_nelayan/models/jasa_pengerjaan_model.dart';
import 'package:flutter_ruang_nelayan/models/jenis_ikan_model.dart';
import 'package:flutter_ruang_nelayan/providers/auth_provider.dart';
import 'package:flutter_ruang_nelayan/providers/jenis_ikan_provider.dart';
import 'package:flutter_ruang_nelayan/providers/jenis_pengerjaan_ikan.dart';
import 'package:flutter_ruang_nelayan/providers/laporan_harian_provider.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get_storage/get_storage.dart';

class TambahIkanBody extends StatefulWidget {
  TambahIkanBody({Key? key}) : super(key: key);

  @override
  _TambahIkanBodyState createState() => _TambahIkanBodyState();
}

class _TambahIkanBodyState extends State<TambahIkanBody> {
  bool isLoading = false;
  bool showPass = true;

  var isEdit = Get.arguments[0]['isEdit'];

  final List<String> errors = ["Register Failed"];

  File? file;

  final _formKey = GlobalKey<FormState>();

  final GetStorage loginState = GetStorage();

  int? idJenisIkan;
  int? idJenisPengerjaanIkan;
  late HasilTangkapanModel hasilTangkapanModel;

  @override
  Widget build(BuildContext context) {
    CounterController counterController = Get.put(CounterController());

    HasilTangkapanServices hasilTangkapanServices = HasilTangkapanServices();
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    String toDayDate = FormatDate.formatDate(DateTime.now()).toString();
    LaporanHarianProvider laporanHarianProvider =
        Provider.of<LaporanHarianProvider>(context);

    //Model for jenis ikan drop down
    JenisIkanProvider jenisIkanProvider =
        Provider.of<JenisIkanProvider>(context);
    List<JenisIkanModel> jenisIkanModel = jenisIkanProvider.jenisIkan;

    //Model for jenis pengerjaan ikan drop down
    JenisPengerjaanIkanProvider jenisPengerjaanIkanProvider =
        Provider.of<JenisPengerjaanIkanProvider>(context);
    List<JasaPengerjaanModel> jenisPengerjaanIkanModel =
        jenisPengerjaanIkanProvider.jenisPengerjaanIkan;

    TextEditingController namaIkan = TextEditingController();
    TextEditingController jenisIkan = TextEditingController();
    TextEditingController jenisPengerjaan = TextEditingController();
    TextEditingController harga = TextEditingController();

    if (isEdit) {
      hasilTangkapanModel = Get.arguments[1]['hasilTangkapan'];
      namaIkan = TextEditingController(text: hasilTangkapanModel.namaIkan);
      jenisIkan =
          TextEditingController(text: hasilTangkapanModel.jenisIkan.toString());
      jenisPengerjaan = TextEditingController(
          text: hasilTangkapanModel.jenisPengerjaanIkan.toString());
      harga = TextEditingController(text: hasilTangkapanModel.harga.toString());

      counterController.jumlah.value = hasilTangkapanModel.jumlah!;

      idJenisIkan = hasilTangkapanModel.idJenisIkan;
      idJenisPengerjaanIkan = hasilTangkapanModel.idJasaPengerjaanIkan;
    }

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(
          getPropertionateScreenWidht(24),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nama Ikan',
                style: primaryTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 16,
                ),
              ),
              buildFieldInput(
                'namaIkan',
                'Masukkan Nama Ikan',
                namaIkan,
                Icons.production_quantity_limits,
              ),
              Text(
                'Jenis Ikan',
                style: primaryTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 16,
                ),
              ),
              buildJenisIkan(
                icon: Icons.water,
                input: jenisIkan,
                jenisIkanModel: jenisIkanModel,
                hintText: isEdit
                    ? hasilTangkapanModel.jenisIkan!.jenisIkan.toString()
                    : 'Pilih Jenis Ikan',
                selected: idJenisIkan,
              ),
              SizedBox(
                height: getPropertionateScreenHeight(10),
              ),
              Row(
                children: [
                  Text(
                    'Jumlah',
                    style: subtitleTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: getPropertionateScreenWidht(10),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (counterController.jumlah.value != 0) {
                            counterController.decrementJumlah();
                          }
                        },
                        child: Icon(
                          Icons.remove_circle_outline,
                        ),
                      ),
                      SizedBox(
                        width: getPropertionateScreenWidht(10),
                      ),
                      Obx(() => Text(
                            counterController.jumlah.value.toString(),
                            style: subtitleTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          )),
                      SizedBox(
                        width: getPropertionateScreenWidht(10),
                      ),
                      GestureDetector(
                        onTap: () => counterController.incrementJumlah(),
                        child: Icon(
                          Icons.add_circle_outline,
                        ),
                      ),
                      SizedBox(
                        width: getPropertionateScreenWidht(10),
                      ),
                      Text(
                        'Kg',
                        style: subtitleTextStyle.copyWith(
                          fontWeight: bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: getPropertionateScreenHeight(24),
              ),
              Text(
                'Harga Satuan Ikan Perkilo',
                style: subtitleTextStyle,
              ),
              Row(
                children: [
                  Text(
                    'Rp    ',
                    style: primaryTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    width: getPropertionateScreenWidht(100),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: '35.000',
                      ),
                      controller: harga,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getPropertionateScreenHeight(50),
              ),
              GestureDetector(
                onTap: () async {
                  file = await getImage();
                },
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Upload Gambar Ikan',
                        style: subtitleTextStyle,
                      ),
                      SizedBox(
                        height: getPropertionateScreenHeight(10),
                      ),
                      SvgPicture.asset('assets/icons/add_form_icon.svg'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: getPropertionateScreenHeight(50),
              ),
              Text(
                'Jenis Pengerjaan Ikan',
                style: primaryTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 16,
                ),
              ),
              buildJasaPengerjaanIkan(
                icon: Icons.kitesurfing_sharp,
                input: jenisPengerjaan,
                jasaPengerjaanIkan: jenisPengerjaanIkanModel,
                hintText: isEdit
                    ? hasilTangkapanModel.jenisPengerjaanIkan!.jenisPengerjaan
                        .toString()
                    : 'Pilih Jenis Pengerjaan Ikan',
                selected: idJenisPengerjaanIkan,
              ),
              SizedBox(
                height: getPropertionateScreenHeight(50),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DefaultButtonOutlined(
                    width: 45,
                    isInfinity: false,
                    text: Text(
                      'Kembali',
                      style: primaryLightTextStyle,
                    ),
                    press: () {
                      Get.back();
                    },
                  ),
                  SizedBox(
                    width: getPropertionateScreenWidht(10),
                  ),
                  isLoading
                      ? DefaultButton(
                          width: 45,
                          isInfinity: false,
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
                          width: 45,
                          isInfinity: false,
                          text: Text(
                            'Daftar',
                            style: whiteTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                          press: () async {
                            setState(() {
                              isLoading = true;
                            });
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                _formKey.currentState!.save();
                              });
                            }
                            if (errors.length == 1) {
                              isEdit
                                  ? file = await getImageOld(
                                      hasilTangkapanModel.gambar.toString())
                                  : file = file;
                              await hasilTangkapanServices.tambahHasilTangkapan(
                                idUsers: authProvider.user.id!,
                                namaIkan: namaIkan.text,
                                idJenisIkan: idJenisIkan!,
                                jumlah: counterController.jumlah.value,
                                harga: double.parse(harga.text),
                                gambar: file!,
                                idJasaPengerjaanIkan: idJenisPengerjaanIkan!,
                              );
                              if (toDayDate != loginState.read('lastVisit')) {
                                await laporanHarianProvider.inputLaporan();
                                loginState.write('lastVisit', toDayDate);
                              }

                              Get.toNamed('/home-nelayan');
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: List.generate(
                                      errors.length,
                                      (index) => Text(errors[index]),
                                    ),
                                  ),
                                ),
                              );
                            }
                            setState(() {
                              isLoading = false;
                            });
                          }),
                ],
              ),
              SizedBox(
                height: getPropertionateScreenHeight(20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFieldContainer buildJenisIkan({
    required TextEditingController input,
    required List<JenisIkanModel> jenisIkanModel,
    required IconData icon,
    required String hintText,
    required int? selected,
  }) {
    return TextFieldContainer(
      isWrapSize: false,
      child: DropdownButtonFormField2(
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
        isExpanded: true,
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.black45,
        ),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        items: jenisIkanModel
            .map((item) => DropdownMenuItem<JenisIkanModel>(
                  value: item,
                  child: Text(
                    item.jenisIkan.toString(),
                    style: primaryTextStyle,
                  ),
                  onTap: () {
                    selected = item.id;
                  },
                ))
            .toList(),
        onChanged: (value) {},
        onSaved: (value) {
          idJenisIkan = selected;
        },
      ),
    );
  }

  TextFieldContainer buildJasaPengerjaanIkan({
    required TextEditingController input,
    required List<JasaPengerjaanModel> jasaPengerjaanIkan,
    required IconData icon,
    required String hintText,
    required int? selected,
  }) {
    return TextFieldContainer(
      isWrapSize: false,
      child: DropdownButtonFormField2(
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
        isExpanded: true,
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.black45,
        ),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        items: jasaPengerjaanIkan
            .map((item) => DropdownMenuItem<JasaPengerjaanModel>(
                  value: item,
                  child: Text(
                    item.jenisPengerjaan.toString(),
                    style: primaryTextStyle,
                  ),
                  onTap: () {
                    selected = item.id;
                  },
                ))
            .toList(),
        onChanged: (value) {
          print('test = ' + selected.toString());
        },
        onSaved: (value) {
          idJenisPengerjaanIkan = selected;
        },
      ),
    );
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
          keyboardType: TextInputType.name,
          controller: inputController,
          validator: (value) {}),
    );
  }
}

Future<File?> getImage() async {
  ImagePicker _picker = ImagePicker();
  XFile? selectImage =
      await _picker.pickImage(source: ImageSource.gallery, imageQuality: 30);
  return File(selectImage!.path);
}

Future<File?> getImageOld(String path) async {
  return File(path);
}
