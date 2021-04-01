import 'package:ehsan_store/controller/product_contoller/ProductController.dart';
import 'package:ehsan_store/data_source/model/cart/Cart.dart';
import 'package:ehsan_store/data_source/model/favorites/Favorites.dart';
import 'package:ehsan_store/widgets/BorderedContainer.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends StatelessWidget {
  final int id;
  final String title;
  final String description;
  final String picture;
  final double price;
  final int amount;
  final bool is_display;
  final String tag;
  final bool is_favorites;

  ProductDetailScreen(
      {this.id,
      this.picture,
      this.title,
      this.description,
      this.price,
      this.amount,
      this.is_display,
      this.tag,
      this.is_favorites});

  ProductController get _productController => Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<ProductController>(() => ProductController());

    final appBar = AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
    return Scaffold(
      appBar: appBar,
      extendBodyBehindAppBar: true,
      body: mainBody(context),
    );
  }

  Obx mainBody(BuildContext context) {
    return Obx(() {
      return _productController.isLoading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.70,
                      color: Colors.white,
                      child: Stack(
                        children: [
                          imageItem(context),
                          titleDescriptionItem(context)
                        ],
                      ),
                    ),
                    ItemsView(context)
                  ],
                ),
              ),
            );
    });
  }

  Container ItemsView(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Row(
          children: [
            counterViewItem(context),
            priceFavoriteViewsItem(),
            buyButton(context)
          ],
        ),
      ),
    );
  }

  Flexible buyButton(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Material(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).accentColor,
          child: buyButtonItem(),
        ),
      ),
    );
  }

  InkWell buyButtonItem() {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      splashColor: Colors.white24,
      onTap: () {
        _productController.addCart(Cart(
            picture: picture,
            title: title,
            price: price,
            amount: _productController.amountCounter.value));
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: columnIconTextViews(),
        ),
      ),
    );
  }

  Column columnIconTextViews() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [iconCart(), titleBuy()],
    );
  }

  Icon iconCart() {
    return Icon(
      Icons.add_shopping_cart_rounded,
      color: Colors.white,
    );
  }

  Text titleBuy() {
    return Text(
      'BUY',
      style: TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  Flexible priceFavoriteViewsItem() {
    return Flexible(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          favoriteButton(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: priceItem(),
          ),
        ],
      ),
    );
  }

  Column priceItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BorderedContainer(
          childWidget: columnPriceViews(),
        )
      ],
    );
  }

  Column columnPriceViews() {
    return Column(
      children: [
        Text(
          'Price',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        Text(
          price.toString(),
          style: TextStyle(fontSize: 24, color: Color(0xffD43030)),
        )
      ],
    );
  }

  FavoriteButton favoriteButton() {
    return FavoriteButton(
      isFavorite: false,
      valueChanged: (_isFavorite) {
        print('Is Favorite : $_isFavorite');
        if (_isFavorite) {
          _productController.addFavorites(Favorites(
              picture: picture,
              title: title,
              description: description,
              price: price,
              is_favorites: true));
          _productController.getAllFavorites();
        }
      },
    );
  }

  Expanded counterViewItem(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(12)),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: columnOfCounterViews(),
            ),
          ),
        ),
      ),
    );
  }

  Column columnOfCounterViews() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        incraseButtonItem(),
        displayAmountItem(),
        decraseButtonItem(),
      ],
    );
  }

  IconButton decraseButtonItem() {
    return IconButton(
      icon: Icon(Icons.remove),
      color: Colors.white,
      onPressed: () {
        if (_productController.amountCounter.value < 1) {
          return;
        }
        _productController.amountCounter--;
      },
    );
  }

  Container displayAmountItem() {
    return Container(
      height: 26,
      width: 26,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white24),
          borderRadius: BorderRadius.circular(11)),
      child: Center(
        child: Obx(
          () => Text(
            _productController.amountCounter.value.toString(),
            style: TextStyle(
                color: Colors.black87,
                fontSize: 12,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  IconButton incraseButtonItem() {
    return IconButton(
      icon: Icon(
        Icons.add,
      ),
      color: Colors.white,
      onPressed: () {
        _productController.amountCounter.value++;
      },
    );
  }

  Positioned titleDescriptionItem(BuildContext context) {
    return Positioned(
      bottom: 30,
      width: MediaQuery.of(context).size.width,
      child: titleDescriptionListTile(),
    );
  }

  ListTile titleDescriptionListTile() {
    return ListTile(
      title: Transform.translate(
        offset: Offset(0, 4),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 2),
          ),
        ),
      ),
      subtitle: Text(
        description,
        style: TextStyle(color: Colors.black87, fontSize: 16),
      ),
    );
  }

  Positioned imageItem(BuildContext context) {
    return Positioned(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.70,
      top: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Hero(
            child: Image.network(picture),
            tag: id,
          ),
        ),
      ),
    );
  }
}
