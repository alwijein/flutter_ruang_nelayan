import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/models/laporan_harian_model.dart';
import 'package:flutter_ruang_nelayan/models/transaction_model.dart';
import 'package:flutter_ruang_nelayan/providers/hasil_tangkapan_provider.dart';
import 'package:flutter_ruang_nelayan/providers/laporan_harian_provider.dart';
import 'package:flutter_ruang_nelayan/providers/transaction_provider.dart';
import 'package:get/get.dart';

class LaporanHarianBody extends StatelessWidget {
  const LaporanHarianBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LaporanHarianProvider laporanHarianProvider =
        Provider.of<LaporanHarianProvider>(context);

    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              height: getPropertionateScreenHeight(300),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    kColorLightkGreen,
                    kColorDarkGreen,
                  ],
                ),
              ),
              padding: EdgeInsets.all(defaultPadding),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: SvgPicture.asset(
                      'assets/images/illustartion_laporan.svg',
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Laporan Harian',
                        style: whiteTextStyle.copyWith(
                          fontWeight: bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ],
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
                  top: defaultPadding,
                  left: defaultPadding,
                  right: defaultPadding,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: laporanHarianProvider.laporanHarianModel
                        .map(
                          (hasil) => CardLaporanHarian(
                            laporanHarianModel: hasil,
                          ),
                        )
                        .toList(),
                  ),
                  // child: CardLaporanHarian(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardLaporanHarian extends StatelessWidget {
  const CardLaporanHarian({
    required this.laporanHarianModel,
    Key? key,
  }) : super(key: key);

  final LaporanHarianModel laporanHarianModel;

  @override
  Widget build(BuildContext context) {
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);
    HasilTangkapanProvider hasilTangkapanProvider =
        Provider.of<HasilTangkapanProvider>(context);
    return SizedBox(
      width: double.infinity,
      child: GestureDetector(
        onTap: () async {
          print(FormatDate.formatDateBasic(
              DateTime.parse(laporanHarianModel.createdAt.toString())));
          await hasilTangkapanProvider.getWithDate(FormatDate.formatDateBasic(
              DateTime.parse(laporanHarianModel.createdAt.toString())));
          await transactionProvider.getTransactionWithDate(
              'SUDAH DI KONFIRMASI',
              FormatDate.formatDateBasic(
                  DateTime.parse(laporanHarianModel.createdAt.toString())));
          Get.toNamed(
            '/laporan-harian-nelayan/detail',
            arguments: {
              "created_at": laporanHarianModel.createdAt.toString(),
            },
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: getPropertionateScreenHeight(16),
            horizontal: getPropertionateScreenWidht(10),
          ),
          margin: EdgeInsets.only(
            bottom: getPropertionateScreenHeight(20),
          ),
          decoration: BoxDecoration(
            color: kBackgroundColor1,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 4,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      laporanHarianModel.createdAt!.day.toString(),
                      style: subtitleTextStyle.copyWith(
                        fontSize: 34,
                      ),
                    ),
                    Text(
                      FormatDate.formatDateMonth(DateTime.parse(
                          laporanHarianModel.createdAt.toString())),
                      style: primaryTextStyle.copyWith(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Text(
                  'Laporan Harian ${FormatDate.formatDate(DateTime.parse(laporanHarianModel.createdAt.toString()))} Lihat Selengkapnya >>',
                  style: subtitleTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
