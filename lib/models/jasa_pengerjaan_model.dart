class JasaPengerjaanModel {
  int? id;
  String? jenisPengerjaan;

  JasaPengerjaanModel({
    this.id,
    this.jenisPengerjaan,
  });

  JasaPengerjaanModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jenisPengerjaan = json['jenis_pengerjaan_ikan'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'jenis_pengerjaan_ikan': jenisPengerjaan,
    };
  }
}
