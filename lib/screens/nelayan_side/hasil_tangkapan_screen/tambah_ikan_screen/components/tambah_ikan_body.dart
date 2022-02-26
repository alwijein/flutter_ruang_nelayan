import 'package:flutter_ruang_nelayan/boostrap.dart';

class TambahIkanBody extends StatefulWidget {
  const TambahIkanBody({Key? key}) : super(key: key);

  @override
  _TambahIkanBodyState createState() => _TambahIkanBodyState();
}

class _TambahIkanBodyState extends State<TambahIkanBody> {
  TextEditingController namaIkan = TextEditingController();
  TextEditingController jenisPengerjaan = TextEditingController();

  bool isLoading = false;
  bool showPass = true;

  final List<String> errors = ["Register Failed"];

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
              buildFieldInput(
                'namaIkan',
                'Masukkan Jenis Ikan',
                namaIkan,
                Icons.directions_boat_filled_sharp,
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
                      Icon(
                        Icons.remove_circle_outline,
                      ),
                      SizedBox(
                        width: getPropertionateScreenWidht(10),
                      ),
                      Text(
                        '4',
                        style: subtitleTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        width: getPropertionateScreenWidht(10),
                      ),
                      Icon(
                        Icons.add_circle_outline,
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
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getPropertionateScreenHeight(50),
              ),
              Text(
                'Upload Gambar Ikan',
                style: subtitleTextStyle,
              ),
              SizedBox(
                height: getPropertionateScreenHeight(10),
              ),
              SvgPicture.asset('assets/icons/add_form_icon.svg'),
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
              buildFieldInput(
                'namaIkan',
                'Masukkan Jenis Pengerjaan',
                jenisPengerjaan,
                Icons.kitchen_outlined,
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
                    press: () {},
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
                                kPrimaryColor,
                              ),
                            ),
                          ),
                          press: () {})
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
                            // if (errors.length == 1) {
                            //   Navigator.of(context)
                            //       .pushReplacement(MaterialPageRoute(builder: (_) {
                            //     return OtpScreen(
                            //         email: email.text,
                            //         password: password.text,
                            //         nama: nama.text,
                            //         nomorUnik: nomorUnik.text,
                            //         status: status.text);
                            //   }));
                            // } else {
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //     SnackBar(
                            //       backgroundColor: Colors.red,
                            //       content: Column(
                            //         mainAxisSize: MainAxisSize.min,
                            //         children: List.generate(
                            //           errors.length,
                            //           (index) => Text(errors[index]),
                            //         ),
                            //       ),
                            //     ),
                            //   );
                            // }
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
          onChanged: (value) {
            if (type == 'name') {
              if (value.isNotEmpty && errors.contains(kNimNullError)) {
                setState(() {
                  errors.remove(kNimNullError);
                });
              } else if (type == 'email') {
                if (value.isNotEmpty && errors.contains(kAddressNullError)) {
                  setState(() {
                    errors.remove(kAddressNullError);
                  });
                } else if (emailValidatorRegExp.hasMatch(value) &&
                    errors.contains(kInvalidEmailError)) {
                  setState(() {
                    errors.remove(kInvalidEmailError);
                  });
                }
              }
            }
          },
          validator: (value) {
            if (type == 'name') {
              if (value!.isEmpty && !errors.contains(kNimNullError)) {
                setState(() {
                  errors.add(kNimNullError);
                });
              }
            } else if (type == 'email') {
              if (value!.isEmpty && !errors.contains(kAddressNullError)) {
                setState(() {
                  errors.add(kAddressNullError);
                });
              } else if (!emailValidatorRegExp.hasMatch(value) &&
                  !errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.add(kInvalidEmailError);
                });
              }
            }
            return 'Something Wrong';
          }),
    );
  }
}
