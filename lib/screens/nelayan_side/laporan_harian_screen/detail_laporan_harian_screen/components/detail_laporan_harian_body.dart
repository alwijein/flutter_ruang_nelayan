import 'dart:io';

import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/models/hasil_tangkapan_model.dart';
import 'package:flutter_ruang_nelayan/providers/hasil_tangkapan_provider.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/laporan_harian_screen/detail_laporan_harian_screen/components/data_hasil_tangkapan.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/laporan_harian_screen/detail_laporan_harian_screen/components/data_penjualan.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/laporan_harian_screen/detail_laporan_harian_screen/components/header.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:get/get.dart';

class DetailLaporanHarianBody extends StatelessWidget {
  DetailLaporanHarianBody({Key? key}) : super(key: key);

  final pdf = pw.Document();
  final date = Get.arguments['created_at'];

  @override
  Widget build(BuildContext context) {
    HasilTangkapanProvider hasilTangkapanProvider =
        Provider.of<HasilTangkapanProvider>(context);

    // method for count jumlah ikan
    int jumlahIkan = 0;
    double totalHarga = 0;
    for (int i = 0; i < hasilTangkapanProvider.hasilTangkapan.length; i++) {
      jumlahIkan += hasilTangkapanProvider.hasilTangkapan[i].jumlah!;
      totalHarga += hasilTangkapanProvider.hasilTangkapan[i].harga!;
    }
    String tanggal = FormatDate.formatDateWithTime(DateTime.parse(date));
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(
            getPropertionateScreenWidht(24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Header(
                    date: tanggal,
                  ),
                  IconButton(
                    onPressed: () async {
                      createPDF(jumlahIkan.toString(), totalHarga,
                          hasilTangkapanProvider.hasilTangkapan);

                      if (await savePDF(tanggal + '_laporan')) {
                        Get.snackbar(
                          'Success',
                          'Laporan berhasil di download',
                          colorText: kBackgroundColor1,
                          backgroundColor: kGreenColor,
                        );
                      }
                    },
                    icon: const Icon(
                      Icons.picture_as_pdf,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 2.0,
              ),
              DataHasilTangkapan(
                jumlahIkan: jumlahIkan,
                totalHarga: totalHarga,
              ),
              const Divider(
                thickness: 2.0,
              ),
              const DataPenjualan(),
            ],
          ),
        ),
      ),
    );
  }

  createPDF(
    String jumlahIkan,
    double totalHarga,
    List<HasilTangkapanModel> hasilTangkapanModel,
  ) async {
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context contex) {
          return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  'Tanggal: ' +
                      FormatDate.formatDateWithTime(DateTime.parse(date)),
                  style: pw.TextStyle(
                    fontSize: 24,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.Divider(
                  thickness: 2.0,
                ),
                pw.Text(
                  'Data hasil tangkapan',
                  style: pw.TextStyle(
                    fontSize: 24,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.Text('Jumlah ikan yang diperoleh: ' + jumlahIkan),
                pw.Text('Harga satuan ikan perkilo : ' +
                    formatCurrency
                        .format(totalHarga)
                        .toString()
                        .replaceAll(regex, '')),
                pw.Divider(
                  thickness: 2.0,
                ),
                pw.Column(
                  children: hasilTangkapanModel.map((hasil) {
                    return pw.Container(
                      margin: pw.EdgeInsets.symmetric(
                        vertical: getPropertionateScreenHeight(24),
                      ),
                      padding: pw.EdgeInsets.symmetric(
                          vertical: getPropertionateScreenHeight(10),
                          horizontal: getPropertionateScreenWidht(10)),
                      decoration: pw.BoxDecoration(
                        borderRadius: pw.BorderRadius.circular(10),
                        color: const PdfColor.fromInt(0xffE7F3FE),
                        // boxShadow: [
                        //   pw.BoxShadow(
                        //     color: PdfColor.fromInt(0xff999999),
                        //     spreadRadius: 3,
                        //     blurRadius: 4,
                        //     // changes position of shadow
                        //   ),
                        // ],
                      ),
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            hasil.namaIkan.toString(),
                            style: pw.TextStyle(
                                fontSize: 20, fontWeight: pw.FontWeight.bold),
                          ),
                          pw.RichText(
                            text: pw.TextSpan(
                              text: 'hasil tangkapan: ',
                              style: pw.TextStyle(
                                  fontSize: 20, fontWeight: pw.FontWeight.bold),
                              children: [
                                pw.TextSpan(
                                  text: hasil.jumlah.toString(),
                                  style: const pw.TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          pw.RichText(
                            text: pw.TextSpan(
                              text: 'Harga Per Kilo: ',
                              style: pw.TextStyle(
                                  fontSize: 20, fontWeight: pw.FontWeight.bold),
                              children: [
                                pw.TextSpan(
                                  text: formatCurrency
                                      .format(hasil.harga)
                                      .toString()
                                      .replaceAll(regex, ''),
                                  style: const pw.TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          pw.RichText(
                            text: pw.TextSpan(
                              text: 'Jasa Pengerjaan: ',
                              style: pw.TextStyle(
                                  fontSize: 20, fontWeight: pw.FontWeight.bold),
                              children: [
                                pw.TextSpan(
                                  text: hasil
                                      .jenisPengerjaanIkan!.jenisPengerjaan
                                      .toString(),
                                  style: const pw.TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          pw.SizedBox(
                            height: getPropertionateScreenHeight(5),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ]);
        },
      ),
    );
  }

  Future<bool> savePDF(String filename) async {
    try {
      final directory = (await getExternalStorageDirectories(
              type: StorageDirectory.documents))!
          .first;
      final file = File('${directory.path}/$filename.pdf');
      await file.writeAsBytes(await pdf.save());
      print('success');
      return true;
    } catch (e) {
      print('error');
      return false;
    }
  }
}
