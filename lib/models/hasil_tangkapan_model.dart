class HasilTangkapanModel {
  int? id;
  String? idUser,
      namaIkan,
      idJenisIkan,
      jumlah,
      harga,
      gambar,
      idJasaPengerjaanIkan;

  HasilTangkapanModel({
    this.id,
    this.namaIkan,
    this.idJenisIkan,
    this.jumlah,
    this.harga,
    this.gambar,
    this.idJasaPengerjaanIkan,
  });

  HasilTangkapanModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaIkan = json['nama_ikan'];
    idJenisIkan = json['id_jenis_ikan'];
    jumlah = json['jumlah'];
    harga = json['harga'];
    gambar = json['gambar'];
    idJasaPengerjaanIkan = json['id_jasa_pengerjaan_ikan'];
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
    };
  }
}
