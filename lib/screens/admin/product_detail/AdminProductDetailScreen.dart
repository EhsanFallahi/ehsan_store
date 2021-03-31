import 'package:ehsan_store/controller/product_contoller/ProductController.dart';
import 'package:ehsan_store/screens/admin/add_product/AddProductAdminScreen.dart';
import 'package:ehsan_store/screens/admin/drawer/AdminDrawer.dart';
import 'package:ehsan_store/widgets/AdminProductItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminProductDetailScreen extends StatelessWidget {
  ProductController get _productController => Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<ProductController>(() => ProductController());
    final appBar = AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Theme.of(context).primaryColor,
    );

    final mediaQuery = MediaQuery.of(context);

    Size size=MediaQuery.of(context).size;

    final listHeight = (mediaQuery.size.height -
        appBar.preferredSize.height -
        100 -
        mediaQuery.padding.top);

    return Scaffold(
      appBar: appBar,
      drawer: AdminDrawer(),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton.extended(
            onPressed: (){
              Get.to(AddProductAdminScreen());
            },
            label: Text(
              'Add Product'
            ),
          icon: Icon(Icons.add,color:Colors.white),
        ),
      ),
      body: Obx(()=>_productController.isLoading.value?Center(
        child: CircularProgressIndicator(),
      ):Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Color(0xfF000000), Color(0xfF474546)],
            ),
          ),
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35))),
              height: 60,
              width: double.infinity,
              child: Center(
                child: Text(
                  'Product Detail',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      letterSpacing: 6,
                      color: Colors.white70),
                ),
              ),
            ),
            Positioned(
              top: 50,
              left: 15,
              right: 15,
              child:
              Container(
                height: listHeight,
                child: ListView.builder(
                    itemCount: _productController.tempListProducts.length,
                    itemBuilder: (_, i) => AdminProductItem(
                      id: _productController.tempListProducts[i].id,
                      picture: _productController.tempListProducts[i].picture,
                      title: _productController.tempListProducts[i].title,
                      description: _productController.tempListProducts[i].description,
                      price: _productController.tempListProducts[i].price,
                      amount: _productController.tempListProducts[i].amount,
                      tag: _productController.tempListProducts[i].tag,
                      is_display: _productController.tempListProducts[i].is_display,
                      is_favorites: _productController.tempListProducts[i].is_favorites,
                    )
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}


