class Product {
  final String id;
  final String picture;
  final String title;
  final String description;
  final String price;
  final String amount;
  final String tag;
  final int likes;

  Product(
      {this.id,
      this.picture,
      this.title,
      this.description,
      this.price,
      this.amount,
      this.tag,
      this.likes});
}

class Products {
  List<Product> _products = [
    Product(
        id: '1',
        picture:
            'https://m.media-amazon.com/images/I/61ypNMyv9LL._UL1500_.jpg',
        title: 'product_one',
        description: 'product_one_description',
        price: '123,000',
        amount: '12',
        tag: '#summer',
        likes: 2),
    Product(
        id: '2',
        picture:
            'https://images-na.ssl-images-amazon.com/images/I/61rCxJDiwlL._UL1500_.jpg',
        title: 'product_two',
        description: 'product_one_description',
        price: '13,000',
        amount: '12',
        tag: '#summer',
        likes: 2),
    Product(
        id: '3',
        picture:
            'https://5.imimg.com/data5/JO/RI/MY-28614641/designer-navy-blue-dress-500x500.jpg',
        title: 'product_three',
        description: 'product_one_description',
        price: '87,000',
        amount: '12',
        tag: '#summer',
        likes: 2),
  ];

  List<Product> get products {
    return [..._products];
  }

  Product getProduct(String id) {
    return _products.firstWhere((product) => product.id == id);
  }
}
