import 'package:flutter_ruang_nelayan/models/jasa_pengerjaan_model.dart';
import 'package:flutter_ruang_nelayan/models/jenis_ikan_model.dart';

class HasilTangkapanModel {
  int? id, idJasaPengerjaanIkan, idUser, idJenisIkan;
  String? namaIkan, gambar;
  DateTime? createdAt, updatedAt;
  double? jumlah, harga;
  JasaPengerjaanModel? jenisPengerjaanIkan;
  JenisIkanModel? jenisIkan;

  HasilTangkapanModel({
    this.id,
    this.namaIkan,
    this.idJenisIkan,
    this.jumlah,
    this.harga,
    this.gambar,
    this.idJasaPengerjaanIkan,
    this.jenisPengerjaanIkan,
    this.jenisIkan,
    this.createdAt,
    this.updatedAt,
  });

  HasilTangkapanModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaIkan = json['nama_ikan'];
    idJenisIkan = json['id_jenis_ikan'];
    jumlah = double.parse(json['jumlah'].toString());
    harga = double.parse(json['harga'].toString());
    gambar = json['gambar'];
    idJasaPengerjaanIkan = json['id_jasa_pengerjaan_ikan'];
    jenisPengerjaanIkan =
        JasaPengerjaanModel.fromJson(json['jasa_pengerjaan_ikan']);
    jenisIkan = JenisIkanModel.fromJson(json['jenis_ikan']);
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama_ikan': namaIkan,
      'id_jenis_ikan': idJenisIkan,
      'jumlah': jumlah,
      'harga': harga,
      'gambar': gambar,
      'id_jasa_pengerjaan_ikan': idJasaPengerjaanIkan,
      'jenis_pengerjaan_ikan': jenisPengerjaanIkan!.toJson(),
      'jenis_ikan': jenisIkan!.toJson(),
      'created_at': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
