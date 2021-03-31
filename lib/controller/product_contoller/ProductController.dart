import 'package:ehsan_store/data_source/model/cart/Cart.dart';
import 'package:ehsan_store/data_source/model/favorites/Favorites.dart';
import 'package:ehsan_store/data_source/model/product/Product.dart';
import 'package:ehsan_store/data_source/repository/cart/CartRepository.dart';
import 'package:ehsan_store/data_source/repository/favorites/FavoritesRepository.dart';
import 'package:ehsan_store/data_source/repository/product/ProductRepository.dart';
import 'package:ehsan_store/screens/admin/product_detail/AdminProductDetailScreen.dart';
import 'package:ehsan_store/screens/cart/CartScreen.dart';
import 'package:ehsan_store/screens/favorite/FavoritesScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  ProductRepository _productRepository = ProductRepository();
  FavoritesRepository _favoritesRepository = FavoritesRepository();
  CartRepository _cartRepository = CartRepository();

  List<dynamic> _allProduct = [].obs;
  var tempListProducts =List<Product>().obs;
  var listUserProducts=List<Product>().obs;

  List<dynamic> _allFavorites = [];
  var tempListFavorites =List<Favorites>().obs;

  List<dynamic> _allCarts = [];
  var tempListCarts =List<Cart>().obs();

  RxBool isLoading = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptinController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController tagController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  RxBool isAddedProduct = false.obs;
  RxDouble amountCounter=1.0.obs;

  @override
  void onInit() async {
    print('on init');
    getAllProducts();
    getAllFavorites();
    getAllCarts();
    visibleProductListUser();
  }




  void updateProduct(Product product)async{
    isLoading(true);
        try{
      await _productRepository.updateProduct(product);
      isAddedProduct(true);
      Get.off(AdminProductDetailScreen());
      showUpdateProductSnackBar();
        }catch(error){
      isAddedProduct(false);
      isLoading(false);
      print('network error:$error');
    }finally{
    isLoading(false);
    }
  }

  void deleteProduct(Product product)async{
    isLoading(true);
    try{
      await _productRepository.deleteProduct(product);
      print('deleted product');
      isAddedProduct(false);
      Get.off(AdminProductDetailScreen());
      showDeletedProductSnackBar();
    }catch(error){
      isAddedProduct(true);
      isLoading(false);
      print('network error:$error');
    }finally{
      isLoading(false);
    }
  }
  void getAllProducts(){
    if(isAddedProduct.value){
      return;
    }else{
      try {
        isLoading(true);
        _productRepository.getAllProducts().then((response) {
          isAddedProduct(true);
          isLoading(false);
          _allProduct.addAll(response.data);
          initialTempListAllProducts() ;
          visibleProductListUser();
          print('onInit products is$listUserProducts');
        });
      } catch (error) {
        isAddedProduct(false);
        isLoading(false);
        print('network error:$error');
      }
    }
  }

  void getAllFavorites(){
    if(isAddedProduct.value){
      return;
    }else{
      print('getAllFavorites():');
      try {
        isLoading(true);
        print('getAllFavorites():try   isLoading(true);');
        _favoritesRepository.getAllFavorites().then((response) {
          isAddedProduct(true);
          isLoading(false);
          print('getAllFavorites():try   isLoading(true);');
          _allFavorites.addAll(response.data);
          print('getAllFavorites():try   _allFavorites.addAll(response.data)');
          initialTempListAllFavorites();
          print('temp favorites lenght in getAll is: ${tempListFavorites.length}');
        });
      } catch (error) {
        isAddedProduct(false);
        isLoading(false);
        print('network error:$error');
      }
    }

  }

  void addFavorites(Favorites favorites) async {
    print('on product deatil favorites is:$favorites.');
    try {
      isLoading(true);
      await _favoritesRepository.addFavorites(favorites);
      tempListFavorites.add(favorites);
      isAddedProduct(true);
      print('favorites added is:${favorites.toString()}');
      showSnackBar();
    }catch(error){
      isAddedProduct(false);
      isLoading(false);
      print('network error:$error');
    } finally {
      isLoading(false);
    }
  }

  void deleteFavorites(Favorites favorites)async{
    print('deleteFavorites');
    isLoading(true);
    try{
      print('try');
      await _favoritesRepository.deleteFavorites(favorites);
      print('deleted favorites');
      isAddedProduct(false);
      Get.off(()=>FavoritesScreen());
    }catch(error){
      isAddedProduct(true);
      isLoading(false);
      print('network error:$error');
    }finally{
      isLoading(false);
    }
  }

  void addProduct(Product product)async{
    isLoading(true);
    try{
      await _productRepository.addProduct(product);
      print('added product');
      tempListProducts.add(product);
      isAddedProduct(true);
      Get.off(AdminProductDetailScreen());
      showAddedProductSnackBar();
    }catch(error){
      isAddedProduct(false);
      isLoading(false);
      print('network error:$error');
    }finally{
      isLoading(false);
    }
  }

  void addCart(Cart cart) async {
    try {
      isLoading(true);
      await _cartRepository.addToCart(cart);
      tempListCarts.add(cart);
      isAddedProduct(true);
      showAddedCartSnackBa();
      print('cart  added!');
    }catch(error){
      isAddedProduct(false);
      isLoading(false);
      print('network error:$error');
    } finally {
      isLoading(false);
    }
  }
  void deleteCart(Cart cart)async{
    isLoading(true);
    try{
      await _cartRepository.deleteCart(cart);
      print('deleted cart');
      isAddedProduct(false);
      Get.off(()=>CartScreen());
    }catch(error){
      isAddedProduct(true);
      isLoading(false);
      print('network error:$error');
    }finally{
      isLoading(false);
    }
  }

  void getAllCarts(){
    if(isAddedProduct.value){
      return;
    }else{
    try {
      isLoading(true);
      _cartRepository.getAllCarts().then((response) {
        isAddedProduct(true);
        isLoading(false);
        _allCarts.addAll(response.data);
        initialTempListAllCarts() ;
        print('onInit carts is$tempListCarts');
      });
    } catch (error) {
      isAddedProduct(false);
      isLoading(false);
      print('network error:$error');
    }
    }
  }

  void showAddedCartSnackBa()=>Get.snackbar('Carts', 'Added to your Cart',
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(8),
      colorText: Theme.of(Get.context).accentColor,
      backgroundColor: Colors.black87.withOpacity(0.8));

  void initialTempListAllProducts() {
    for (var product in _allProduct) {
      Product _tempProduct = Product();
      _tempProduct.fromJson(product);
      tempListProducts.add(_tempProduct);
    }

  }

  visibleProductListUser() {
    for (var product in tempListProducts) {
      if (product.is_display) {
        listUserProducts.add(product);
      }
    }
  }

  void showAddedProductSnackBar() =>
      Get.snackbar('Product Added', 'You have added a new Product',
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.all(8),
          colorText: Theme.of(Get.context).accentColor,
          backgroundColor: Colors.black87.withOpacity(0.8));

  void showUpdateProductSnackBar() =>
      Get.snackbar('Product Updated', 'You have Update a Product',
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.all(8),
          colorText: Theme.of(Get.context).accentColor,
          backgroundColor: Colors.black87.withOpacity(0.8));

  void showPurchseSnackBar() =>
      Get.snackbar('Complete the purchase', 'thanks for your shopping',
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.all(8),
          colorText: Theme.of(Get.context).accentColor,
          backgroundColor: Colors.black87.withOpacity(0.8));

  void showDeletedProductSnackBar()  =>
      Get.snackbar('Product Deleted', 'You have Deleted a Product',
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.all(8),
          colorText: Theme.of(Get.context).accentColor,
          backgroundColor: Colors.black87.withOpacity(0.8));

  void showSnackBar()=>Get.snackbar('Favorites', 'Added to your favorites',
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(8),
      colorText: Theme.of(Get.context).accentColor,
      backgroundColor: Colors.black87.withOpacity(0.8));

  void initialTempListAllFavorites() {
    for (var favorites in _allFavorites) {
      Favorites _tempFavorites = Favorites();
      _tempFavorites.fromJson(favorites);
      tempListFavorites.add(_tempFavorites);
    }
  }

  void initialTempListAllCarts() {
    for (var cart in _allCarts) {
      Cart _tempCart = Cart();
      _tempCart.fromJson(cart);
      tempListCarts.add(_tempCart);
    }
  }


}
