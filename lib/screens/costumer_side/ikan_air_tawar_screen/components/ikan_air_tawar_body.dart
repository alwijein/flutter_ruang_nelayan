import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/models/ikan_air_tawar_model.dart';
import 'package:flutter_ruang_nelayan/providers/hasil_tangkapan_provider.dart';
import 'package:flutter_ruang_nelayan/providers/ikan_air_tawar_provider.dart';
import 'package:get/get.dart';

class IkanAirTawarBody extends StatelessWidget {
  const IkanAirTawarBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IkanAirTawarProvider ikanAirTawarProvider =
        Provider.of<IkanAirTawarProvider>(context);

    List<IkanAirTawarModel> ikanAirTawar = ikanAirTawarProvider.ikanAirTawar;

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
            itemCount: ikanAirTawar.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                          image: AssetImage(
                            'assets/images/ikan_01.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      ikanAirTawar[count].title.toString(),
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
                        await hasilTangkapanProvider.getNamaIkan(
                            ikanAirTawar[count].title!.toLowerCase());
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
