import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/models/hasil_tangkapan_model.dart';
import 'package:flutter_ruang_nelayan/providers/jenis_ikan_provider.dart';
import 'package:flutter_ruang_nelayan/providers/jenis_pengerjaan_ikan.dart';
import 'package:get/get.dart';

class CardHasilTangkapan extends StatelessWidget {
  const CardHasilTangkapan({
    Key? key,
    required this.hasilTangkapanModel,
  }) : super(key: key);

  final HasilTangkapanModel hasilTangkapanModel;
  @override
  Widget build(BuildContext context) {
    JenisIkanProvider jenisIkanProvider =
        Provider.of<JenisIkanProvider>(context);
    JenisPengerjaanIkanProvider jenisPengerjaanIkanProvider =
        Provider.of<JenisPengerjaanIkanProvider>(context);

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: getPropertionateScreenHeight(24),
      ),
      padding: EdgeInsets.symmetric(
          vertical: getPropertionateScreenHeight(10),
          horizontal: getPropertionateScreenWidht(10)),
      decoration: BoxDecoration(
        color: kBackgroundColor1,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 4,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                width: getPropertionateScreenWidht(90),
                height: getPropertionateScreenHeight(110),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      hasilTangkapanModel.gambar.toString(),
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                width: getPropertionateScreenWidht(7),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hasilTangkapanModel.namaIkan.toString(),
                    style: primaryTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'hasil tangkapan: ',
                      style: subtitleTextStyle.copyWith(
                        fontSize: 11,
                      ),
                      children: [
                        TextSpan(
                            text: hasilTangkapanModel.jumlah.toString(),
                            style: primaryTextStyle.copyWith(
                              fontWeight: bold,
                              fontSize: 11,
                            ))
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Harga Per Kilo: ',
                      style: subtitleTextStyle.copyWith(
                        fontSize: 11,
                      ),
                      children: [
                        TextSpan(
                            text: formatCurrency
                                .format(hasilTangkapanModel.harga)
                                .toString()
                                .replaceAll(regex, ''),
                            style: primaryTextStyle.copyWith(
                              fontWeight: bold,
                              fontSize: 11,
                            ))
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Jasa Pengerjaan: ',
                      style: subtitleTextStyle.copyWith(
                        fontSize: 11,
                      ),
                      children: [
                        TextSpan(
                            text: hasilTangkapanModel
                                .jenisPengerjaanIkan!.jenisPengerjaan
                                .toString(),
                            style: primaryTextStyle.copyWith(
                              fontWeight: bold,
                              fontSize: 11,
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getPropertionateScreenHeight(5),
                  ),
                  DefaultButtonOutlined(
                    isInfinity: false,
                    text: Text(
                      'Edit',
                      style: primaryTextStyle.copyWith(
                        fontSize: 12,
                        color: kPrimaryColor,
                        fontWeight: medium,
                      ),
                    ),
                    press: () async {
                      await jenisIkanProvider.getJenisIkan();
                      await jenisPengerjaanIkanProvider
                          .getJenisPengerjaanIkan();

                      Get.toNamed("/hasil-tangkapan-nelayan/tambah-ikan",
                          arguments: [
                            {'isEdit': true},
                            {'hasilTangkapan': hasilTangkapanModel}
                          ]);
                    },
                  ),
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: DefaultButtonGradient(
              text: Text(
                hasilTangkapanModel.jenisIkan!.jenisIkan.toString(),
                style: whiteTextStyle.copyWith(
                  fontSize: 8,
                ),
              ),
              press: () {},
              isInfinity: false,
              color1: kColorLightkGreen,
              color2: kColorDarkGreen,
            ),
          ),
        ],
      ),
    );
  }
}
