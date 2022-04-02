class LaporanHarianModel {
  int? id;
  DateTime? createdAt;

  LaporanHarianModel({
    this.id,
    this.createdAt,
  });

  LaporanHarianModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = DateTime.parse(json['created_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt,
    };
  }
}
