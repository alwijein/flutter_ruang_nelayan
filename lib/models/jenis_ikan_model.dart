class JenisIkanModel {
  int? id;
  String? jenisIkan, keterangan;

  JenisIkanModel({
    this.id,
    this.jenisIkan,
    this.keterangan,
  });

  JenisIkanModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jenisIkan = json['jenis_ikan'];
    keterangan = json['keterangan'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'jenis_pengerjaan_ikan': jenisIkan,
      'keterangan': keterangan,
    };
  }
}
