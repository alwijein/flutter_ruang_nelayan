class TipeIkanModel {
  int? id;
  String? img, title;

  TipeIkanModel({
    this.id,
    this.img,
    this.title,
  });

  TipeIkanModel.fromJson(Map<String, dynamic> json) {
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
