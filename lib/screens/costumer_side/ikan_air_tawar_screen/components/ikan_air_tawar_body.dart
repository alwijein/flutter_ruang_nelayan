import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/models/tipe_ikan_model.dart';
import 'package:flutter_ruang_nelayan/providers/hasil_tangkapan_provider.dart';
import 'package:flutter_ruang_nelayan/providers/tipe_ikan_provider.dart';
import 'package:get/get.dart';

class IkanAirTawarBody extends StatelessWidget {
  const IkanAirTawarBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TipeIkanProvider tipeIkanProvider = Provider.of<TipeIkanProvider>(context);

    List<TipeIkanModel> tipeIkan = tipeIkanProvider.tipeIkan;

    HasilTangkapanProvider hasilTangkapanProvider =
        Provider.of<HasilTangkapanProvider>(context);

    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: getPropertionateScreenWidht(10),
          vertical: getPropertionateScreenWidht(20),
        ),
        width: double.infinity,
        child: GridView.builder(
            itemCount: tipeIkan.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (_, count) {
              return Container(
                padding: EdgeInsets.symmetric(
                  vertical: getPropertionateScreenHeight(18),
                  horizontal: getPropertionateScreenWidht(10),
                ),
                decoration: BoxDecoration(
                  color: kBackgroundColor1,
                  boxShadow: softShadow,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: double.infinity,
                      height: getPropertionateScreenHeight(150),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              NetworkImage("$storageUrl${tipeIkan[count].img}"),
                          // "http://192.168.1.26:8000/storage/${tipeIkan[count].img}"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      tipeIkan[count].title.toString(),
                      style: primaryLightTextStyle.copyWith(
                        fontWeight: bold,
                      ),
                    ),
                    DefaultButtonOutlined(
                      isInfinity: false,
                      width: getPropertionateScreenWidht(40),
                      text: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_shopping_cart,
                            color: kPrimaryColor,
                            size: getPropertionateScreenWidht(18),
                          ),
                          Text(
                            'Belanja Sekarang',
                            style: primaryLightTextStyle.copyWith(fontSize: 9),
                          ),
                        ],
                      ),
                      press: () async {
                        await hasilTangkapanProvider
                            .getNamaIkan(tipeIkan[count].title!.toLowerCase());
                        Get.toNamed("/detail-ikan");
                      },
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
