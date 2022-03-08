import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/konfirmasi_pesanan_screen/components/alamat_pengantaran.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/konfirmasi_pesanan_screen/components/list_pesanan.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/konfirmasi_pesanan_screen/components/profile_pembeli.dart';

class KonfirmasiPesananBody extends StatelessWidget {
  const KonfirmasiPesananBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(
            getPropertionateScreenWidht(24),
          ),
          child: Column(
            children: [
              ProfilePembeli(
                image: 'assets/images/ikan_01.png',
                name: 'Sutono',
                tgl: '14-07-2020',
                id: 'PB-000-001',
              ),
              AlamatPengantaran(
                alamat: 'Rumah',
                jalan:
                    'Jl. G. Bawakaraeng No. 68, Kec. Sinjai Utara, Kel. Balangnipa',
                kota: 'Sinjai',
                kabupaten: 'Sulawesi Selatan',
              ),
              ListPesanan(),
              CardKurir(
                logo: 'assets/images/logo_okjek.png',
                kurir: 'OK - JEK EXPRESS',
                berat: '30',
                harga: '20.000',
              ),
              CollapseCard(
                content: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total: ',
                        style: primaryLightTextStyle,
                      ),
                      Text(
                        'Rp695.000',
                        style: primaryLightTextStyle.copyWith(fontWeight: bold),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: getPropertionateScreenHeight(20),
              ),
              DefaultButton(
                text: Text(
                  'Proses Pesanan',
                  style: whiteTextStyle,
                ),
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}