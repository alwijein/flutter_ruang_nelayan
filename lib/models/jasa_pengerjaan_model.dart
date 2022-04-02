class JasaPengerjaanModel {
  int? id;
  String? jenisPengerjaan;
  double? biaya;

  JasaPengerjaanModel({
    this.id,
    this.jenisPengerjaan,
    this.biaya,
  });

  JasaPengerjaanModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jenisPengerjaan = json['jenis_pengerjaan_ikan'];
    biaya = double.parse(json['biaya'].toString());
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'jenis_pengerjaan_ikan': jenisPengerjaan,
      'biaya': biaya,
    };
  }
}
