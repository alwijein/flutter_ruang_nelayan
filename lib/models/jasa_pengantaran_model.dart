
class JasaPengantaranModel {
  int? id;
  String? img, name;
  double? biaya;

  JasaPengantaranModel({
    this.img,
    this.name,
    this.biaya,
  });

  JasaPengantaranModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['img'];
    name = json['name'];
    biaya = double.parse(json['biaya'].toString());
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'img': img,
      'name': name,
      'biaya': biaya,
    };
  }
}
