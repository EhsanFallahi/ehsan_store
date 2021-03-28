class Favorites {
  int id;
  String title;
  String description;
  String picture;
  double price;
  String tag;
  bool is_favorites;

  Favorites({this.id,
    this.picture,
    this.title,
    this.description,
    this.price,
    this.tag,
    this.is_favorites});

  void fromJson(dynamic json) {
    id = json['id'];
    picture = json['picture'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    tag = json['tag'];
    is_favorites = json['is_favorites'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['picture'] = this.picture;
    data['price'] = this.price;
    data['tag'] = this.tag;
    data['is_favorites'] = this.is_favorites;
    return data;
  }

}


