class Product {
  int id;
  String title;
  String description;
  String picture;
  double price;
  int amount;
  bool is_display;
  String tag;
  bool is_favorites;

  Product(
      {this.id,
      this.picture,
      this.title,
      this.description,
      this.price,
      this.amount,
      this.is_display,
      this.tag,
      this.is_favorites});


  void fromJson(dynamic json) {
    id = json['id'];
    picture = json['picture'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    amount = json['amount'];
    tag = json['tag'];
    is_favorites = json['is_favorites'];
    is_display = json['is_display'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['picture'] = this.picture;
    data['price'] = this.price;
    data['amount'] = this.amount;
    data['is_display'] = this.is_display;
    data['tag'] = this.tag;
    data['is_favorites'] = this.is_favorites;
    return data;
  }
}

