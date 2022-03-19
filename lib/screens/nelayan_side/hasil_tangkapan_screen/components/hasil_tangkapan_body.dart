import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/providers/hasil_tangkapan_provider.dart';
import 'package:flutter_ruang_nelayan/providers/jenis_ikan_provider.dart';
import 'package:flutter_ruang_nelayan/providers/jenis_pengerjaan_ikan.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/hasil_tangkapan_screen/components/card_hasil_tangkapan.dart';
import 'package:get/get.dart';
import 'package:flutter_ruang_nelayan/screens/register_screen/components/register_form.dart';

class HasilTangkapanBody extends StatelessWidget {
  const HasilTangkapanBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HasilTangkapanProvider hasilTangkapan =
        Provider.of<HasilTangkapanProvider>(context);
    JenisIkanProvider jenisIkanProvider =
        Provider.of<JenisIkanProvider>(context);
    JenisPengerjaanIkanProvider jenisPengerjaanIkanProvider =
        Provider.of<JenisPengerjaanIkanProvider>(context);
    return SafeArea(
      child: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              height: getPropertionateScreenHeight(370),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    kColorDarkBlue,
                    kColorLightkBlue,
                  ],
                ),
              ),
              padding: EdgeInsets.all(getPropertionateScreenWidht(24)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Dapat Apa Saja Hari Ini?',
                      style: whiteTextStyle.copyWith(
                        fontWeight: bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: SvgPicture.asset(
                      'assets/images/illustration_fish.svg',
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: getPropertionateScreenHeight(165),
              left: getPropertionateScreenWidht(10),
              child: DefaultButtonGradient(
                text: Row(
                  children: [
                    Icon(
                      Icons.add_circle,
                      color: kBackgroundColor1,
                      size: getPropertionateScreenWidht(18),
                    ),
                    SizedBox(
                      width: getPropertionateScreenWidht(4),
                    ),
                    Text(
                      'Hasil Tangkapan',
                      style: whiteTextStyle.copyWith(
                        fontSize: 11,
                        fontWeight: bold,
                      ),
                    ),
                  ],
                ),
                press: () async {
                  await jenisIkanProvider.getJenisIkan();
                  await jenisPengerjaanIkanProvider.getJenisPengerjaanIkan();
                  Get.toNamed("/hasil-tangkapan-nelayan/tambah-ikan");
                },
                isInfinity: false,
                color1: kColorLightkPurple,
                color2: kColorDarkPurple,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: getPropertionateScreenHeight(550),
                decoration: const BoxDecoration(
                  color: kBackgroundColor1,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                padding: EdgeInsets.only(
                  top: getPropertionateScreenHeight(24),
                  left: getPropertionateScreenHeight(24),
                  right: getPropertionateScreenHeight(24),
                ),
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Data Hasil Tangkapan',
                          style: primaryTextStyle.copyWith(
                            fontWeight: bold,
                            fontSize: 16,
                          ),
                        ),
                        Column(
                          children: hasilTangkapan.hasilTangkapan
                              .map(
                                (hasil) => CardHasilTangkapan(
                                  hasilTangkapanModel: hasil,
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
