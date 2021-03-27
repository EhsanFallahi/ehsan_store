class Category{
   String name;
   bool active;
   String picture;

  Category(this.name,this.active,this.picture);
}

class Categories{
  List<Category> categories=[
    Category('cat_one', true, 'https://m.media-amazon.com/images/I/61ypNMyv9LL._UL1500_.jpg'),
    Category('cat_two', false, 'https://5.imimg.com/data5/SELLER/Default/2020/9/OT/FX/XZ/58076618/womens-knee-length-one-piece-red-flare-dress-500x500.jpg'),
    Category('cat_three', false, 'https://5.imimg.com/data5/SELLER/Default/2020/8/IM/UF/KR/58076618/new-product-500x500.jpeg'),
    Category('cat_four', false, 'https://5.imimg.com/data5/JO/RI/MY-28614641/designer-navy-blue-dress-500x500.jpg'),
    Category('cat_five', false, 'https://images-na.ssl-images-amazon.com/images/I/61tWei3gBYL._UY550_.jpg'),
    Category('cat_six', false, 'https://images-na.ssl-images-amazon.com/images/I/61rCxJDiwlL._UL1500_.jpg'),
  ];

  List<Category> getCategories(){
    return [...categories];
  }
}
