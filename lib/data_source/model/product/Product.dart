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

class Products {
  List<Product> _products = [
    Product(
        id: 1,
        picture: 'https://m.media-amazon.com/images/I/61ypNMyv9LL._UL1500_.jpg',
        title: 'product_one',
        description: 'product_one_description',
        price: 87000,
        amount: 12,
        is_display: true,
        tag: '#summer',
        is_favorites: false),
    Product(
        id: 2,
        picture:
            'https://images-na.ssl-images-amazon.com/images/I/61rCxJDiwlL._UL1500_.jpg',
        title: 'product_two',
        description: 'product_one_description',
        price: 100000,
        amount: 10,
        is_display: true,
        tag: '#summer',
        is_favorites: false),
    Product(
        id: 3,
        picture:
            'https://5.imimg.com/data5/JO/RI/MY-28614641/designer-navy-blue-dress-500x500.jpg',
        title: 'product_three',
        description: 'product_one_description',
        price: 54000,
        amount: 8,
        is_display: true,
        tag: '#summer',
        is_favorites: false),
  ];

  List<Product> get products {
    return [..._products];
  }

  Product getProduct(String id) {
    return _products.firstWhere((product) => product.id == id);
  }
}
