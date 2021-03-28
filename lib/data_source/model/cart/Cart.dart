class Cart {
  int id;
  String title;
  double amount;
  String picture;
  double price;

  Cart({this.id,
    this.picture,
    this.title,
    this.price,
    this.amount
});

  void fromJson(dynamic json) {
    id = json['id'];
    picture = json['picture'];
    title = json['title'];
    price = json['price'];
    amount=json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['picture'] = this.picture;
    data['price'] = this.price;
    data['amount']=this.amount;
    return data;
  }

}


