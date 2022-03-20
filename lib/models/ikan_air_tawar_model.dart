class IkanAirTawarModel {
  int? id;
  String? img, title;

  IkanAirTawarModel({
    this.id,
    this.img,
    this.title,
  });

  IkanAirTawarModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['img'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'img': img,
      'title': title,
    };
  }
}
