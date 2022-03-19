import 'package:flutter_ruang_nelayan/boostrap.dart';

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
                      ),
                      CardCategory(
                        img: 'assets/images/ikan_air_laut_image.png',
                        title: 'Ikan Air Laut',
                        desc: 'Lihat selengkapnya daftar ikan air laut disini',
                      ),
                      SizedBox(
                        height: getPropertionateScreenHeight(24),
                      ),
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
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (_, count) {
                              return CardIkanPopuler();
                            }),
                      ),
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
                            itemCount: 4,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.52,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemBuilder: (_, count) {
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                      'Ikan Kembung',
                                      style: primaryLightTextStyle.copyWith(
                                        fontWeight: bold,
                                      ),
                                    ),
                                    Text(
                                      '1 Kg',
                                      style: primaryTextStyle.copyWith(
                                        fontWeight: light,
                                      ),
                                    ),
                                    Text(
                                      'Rp20.000',
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
                                          width:
                                              getPropertionateScreenWidht(10),
                                        ),
                                        Text(
                                          'Dg. Tompo',
                                          style: primaryLightTextStyle.copyWith(
                                            fontWeight: bold,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                        press: () {}),
                                  ],
                                ),
                              );
                            }),
                      ),
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
  }) : super(key: key);

  final String title, desc, img;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getPropertionateScreenHeight(160),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        image: DecorationImage(
          image: AssetImage(
            img,
          ),
          scale: 0.9,
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
      margin: EdgeInsets.symmetric(horizontal: 5.0),
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