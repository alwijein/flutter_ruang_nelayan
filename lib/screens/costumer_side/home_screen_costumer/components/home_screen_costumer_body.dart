import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/models/hasil_tangkapan_model.dart';
import 'package:flutter_ruang_nelayan/providers/cart_provider.dart';
import 'package:flutter_ruang_nelayan/providers/hasil_tangkapan_provider.dart';
import 'package:flutter_ruang_nelayan/providers/tipe_ikan_provider.dart';
import 'package:get/get.dart';

class HomeScreenCostumerBody extends StatelessWidget {
  const HomeScreenCostumerBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> corousel = [
      {
        'image': 'assets/images/illustration_corousel.svg',
        'text': 'Berbagai Protein Hewani Laut Ada disini',
        'color1': kColorLightkBlue,
        'color2': kColorDarkBlue,
      },
      {
        'image': 'assets/images/illustration_corousel_02.svg',
        'text': 'Kualitas Hewani Laut sangat terjaga disini',
        'color1': kColorLightkOrange,
        'color2': kColorDarkOrange,
      },
      {
        'image': 'assets/images/illustration_corousel_03.svg',
        'text': 'Gak Pake Ribet Gak Bikin Repot Tinggal Belanja',
        'color1': kColorLightkPurple,
        'color2': kColorDarkPurple,
      },
    ];

    TipeIkanProvider tipeIkanProvider = Provider.of<TipeIkanProvider>(context);

    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              height: getPropertionateScreenHeight(335),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/illustration_home_costumer_03.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: Container(
                  width: double.infinity,
                  height: getPropertionateScreenHeight(505),
                  decoration: const BoxDecoration(
                    color: kBackgroundColor1,
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: getPropertionateScreenWidht(15),
                          left: getPropertionateScreenWidht(15),
                          right: getPropertionateScreenWidht(15),
                        ),
                        child: HeaderMenu(),
                      ),
                      SizedBox(
                        height: getPropertionateScreenHeight(24),
                      ),
                      CarouselSlider(
                        options: CarouselOptions(
                          height: getPropertionateScreenHeight(160),
                        ),
                        items: corousel.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return CardCaraousel(
                                img: i['image'],
                                text: 'Berbagai Protein Hewani Laut Ada disini',
                                color1: i['color1'],
                                color2: i['color2'],
                              );
                            },
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        height: getPropertionateScreenHeight(24),
                      ),
                      CardCategory(
                        img: 'assets/images/ikan_air_tawar_image.png',
                        title: 'Ikan Air Tawar',
                        desc: 'Lihat selengkapnya daftar ikan air tawar disini',
                        press: () async {
                          await tipeIkanProvider.ikanAirTawar();
                          Get.toNamed('/ikan-air-tawar-costumer');
                        },
                      ),
                      CardCategory(
                        img: 'assets/images/ikan_air_laut_image.png',
                        title: 'Ikan Air Laut',
                        desc: 'Lihat selengkapnya daftar ikan air laut disini',
                        press: () async {
                          await tipeIkanProvider.ikanAirLaut();
                          Get.toNamed('/ikan-air-tawar-costumer');
                        },
                      ),
                      SizedBox(
                        height: getPropertionateScreenHeight(24),
                      ),
                      // PopulerMenu(),
                      const TerbaruMenu(),
                    ],
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

class TerbaruMenu extends StatelessWidget {
  const TerbaruMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HasilTangkapanProvider hasilTangkapanProvider =
        Provider.of<HasilTangkapanProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getPropertionateScreenWidht(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Terbaru',
            style: primaryTextStyle.copyWith(
              fontWeight: bold,
              fontSize: 18,
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: getPropertionateScreenHeight(900),
            child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: hasilTangkapanProvider.hasilTangkapan.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.52,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (_, count) {
                  return CardIkanTerbaru(
                    hasilTangkapanModel:
                        hasilTangkapanProvider.hasilTangkapan[count],
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class CardIkanTerbaru extends StatelessWidget {
  const CardIkanTerbaru({
    Key? key,
    required this.hasilTangkapanModel,
  }) : super(key: key);

  final HasilTangkapanModel hasilTangkapanModel;

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getPropertionateScreenHeight(18),
        horizontal: getPropertionateScreenWidht(18),
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
            height: getPropertionateScreenHeight(170),
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
            hasilTangkapanModel.namaIkan.toString(),
            style: primaryLightTextStyle.copyWith(
              fontWeight: bold,
            ),
          ),
          Text(
            '${hasilTangkapanModel.jumlah} Kg',
            style: primaryTextStyle.copyWith(
              fontWeight: light,
            ),
          ),
          Text(
            'Rp${hasilTangkapanModel.harga}',
            style: primaryTextStyle.copyWith(
              fontWeight: bold,
            ),
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/logo.png',
                ),
              ),
              SizedBox(
                width: getPropertionateScreenWidht(10),
              ),
              Expanded(
                child: Text(
                  hasilTangkapanModel.users!.name.toString(),
                  style: primaryLightTextStyle.copyWith(
                    fontWeight: bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          SizedBox(
            height: getPropertionateScreenHeight(10),
          ),
          DefaultButton(
              isInfinity: false,
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_shopping_cart,
                    color: kBackgroundColor1,
                  ),
                  Text(
                    'Beli',
                    style: whiteTextStyle,
                  ),
                ],
              ),
              press: () {
                cartProvider.addCart(hasilTangkapanModel);
                Get.defaultDialog(
                    title: 'Berhasil',
                    middleText: 'Ikan Berhasil Dimasukkan Ke Keranjang',
                    textConfirm: 'Lihat Keranjang',
                    confirmTextColor: kWhiteTextColor,
                    onConfirm: () {
                      Get.offNamed('/cart');
                    });
              }),
        ],
      ),
    );
  }
}

class PopulerMenu extends StatelessWidget {
  const PopulerMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getPropertionateScreenWidht(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Populer',
            style: primaryTextStyle.copyWith(
              fontWeight: bold,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: getPropertionateScreenHeight(24),
          ),
          SizedBox(
            width: double.infinity,
            height: getPropertionateScreenHeight(500),
            child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (_, count) {
                  return CardIkanPopuler();
                }),
          ),
        ],
      ),
    );
  }
}

class CardIkanPopuler extends StatelessWidget {
  const CardIkanPopuler({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getPropertionateScreenHeight(200),
      width: getPropertionateScreenWidht(200),
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/ikan_01.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              color: kPrimaryColor,
              child: Center(
                child: Text(
                  'Ikan Mujai',
                  style:
                      whiteTextStyle.copyWith(fontWeight: bold, fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardCategory extends StatelessWidget {
  const CardCategory({
    Key? key,
    required this.title,
    required this.desc,
    required this.img,
    required this.press,
  }) : super(key: key);

  final String title, desc, img;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        height: getPropertionateScreenHeight(160),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          image: DecorationImage(
            image: AssetImage(
              img,
            ),
            scale: getPropertionateScreenWidht(0.7),
            fit: BoxFit.none,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: whiteTextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 24,
                ),
              ),
              Text(
                desc,
                style: whiteTextStyle.copyWith(
                  fontSize: 12,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CardCaraousel extends StatelessWidget {
  const CardCaraousel({
    Key? key,
    required this.color1,
    required this.color2,
    required this.text,
    required this.img,
  }) : super(key: key);

  final Color color1, color2;
  final String text, img;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      margin: EdgeInsets.symmetric(horizontal: getPropertionateScreenWidht(5)),
      padding: EdgeInsets.symmetric(horizontal: getPropertionateScreenWidht(3)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            color1,
            color2,
          ],
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: SvgPicture.asset(img),
          ),
          Expanded(
            child: Text(
              text,
              style: whiteTextStyle.copyWith(
                fontWeight: bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
