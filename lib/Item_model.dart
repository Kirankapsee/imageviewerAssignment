class ItemModel {
  final int id;
  final String title;
  final String shortDescription;
  final String mainImageURL;

  ItemModel({
    required this.id,
    required this.title,
    required this.shortDescription,
    required this.mainImageURL,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['Id'],
      title: json['title'],
      shortDescription: json['shortDescription'],
      mainImageURL: json['mainImageURL'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'shortDescription': shortDescription,
      'mainImageURL': mainImageURL,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      id: map['id'],
      title: map['title'],
      shortDescription: map['shortDescription'],
      mainImageURL: map['mainImageURL'],
    );
  }
}
