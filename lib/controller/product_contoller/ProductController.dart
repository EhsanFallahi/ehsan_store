import 'package:ehsan_store/data_source/model/cart/Cart.dart';
import 'package:ehsan_store/data_source/model/favorites/Favorites.dart';
import 'package:ehsan_store/data_source/model/product/Product.dart';
import 'package:ehsan_store/data_source/repository/cart/CartRepository.dart';
import 'package:ehsan_store/data_source/repository/favorites/FavoritesRepository.dart';
import 'package:ehsan_store/data_source/repository/product/ProductRepository.dart';
import 'package:ehsan_store/screens/admin/product_detail/AdminProductDetailScreen.dart';
import 'package:ehsan_store/screens/cart/CartScreen.dart';
import 'package:ehsan_store/screens/favorite/FavoritesScreen.dart';
import 'package:ehsan_store/util/Constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  ProductRepository _productRepository = ProductRepository();
  FavoritesRepository _favoritesRepository = FavoritesRepository();
  CartRepository _cartRepository = CartRepository();

  List<dynamic> _allProduct = [].obs;
  var tempListProducts = List<Product>().obs;
  var listUserProducts = List<Product>().obs;

  List<dynamic> _allFavorites = [];
  var tempListFavorites = List<Favorites>().obs;

  List<dynamic> _allCarts = [];
  var tempListCarts = List<Cart>().obs();

  RxBool isLoading = false.obs;
  RxBool isAddedProduct = false.obs;
  RxDouble amountCounter = 1.0.obs;

  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptinController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController tagController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  void onInit() async {
    getAllProducts();
    getAllFavorites();
    getAllCarts();
    visibleProductListUser();
  }

  void updateProduct(Product product) async {
    isLoading(true);
    await _updateProduct(product);
  }

  Future _updateProduct(Product product) async {
    try {
      await _productRepository.updateProduct(product);
      isAddedProduct(true);
      Get.off(AdminProductDetailScreen());
      showCustomSnackBar('Product Updated', 'You have Update a Product');
    } catch (error) {
      isAddedProduct(false);
      isLoading(false);
      print('network error:$error');
    } finally {
      isLoading(false);
    }
  }

  void deleteProduct(Product product) async {
    isLoading(true);
    await _deleteProduct(product);
  }

  Future _deleteProduct(Product product) async {
    try {
      await _productRepository.deleteProduct(product);
      isAddedProduct(false);
      Get.off(AdminProductDetailScreen());
      showCustomSnackBar('Product Deleted', 'You have Deleted a Product');
    } catch (error) {
      isAddedProduct(true);
      isLoading(false);
      print('network error:$error');
    } finally {
      isLoading(false);
    }
  }

  void getAllProducts() {
    if (isAddedProduct.value) {
      return;
    } else {
      _getAllProduct();
    }
  }

  void _getAllProduct() {
    try {
      isLoading(true);
      _productRepository.getAllProducts().then((response) {
        isAddedProduct(true);
        isLoading(false);
        _allProduct.addAll(response.data);
        initialTempListAllProducts();
        visibleProductListUser();
      });
    } catch (error) {
      isAddedProduct(false);
      isLoading(false);
      print('network error:$error');
    }
  }

  void getAllFavorites() {
    if (isAddedProduct.value) {
      return;
    } else {
      _getAllFavorites();
    }
  }

  void _getAllFavorites() {
    try {
      isLoading(true);
      _favoritesRepository.getAllFavorites().then((response) {
        isAddedProduct(true);
        isLoading(false);
        _allFavorites.addAll(response.data);
        initialTempListAllFavorites();
      });
    } catch (error) {
      isAddedProduct(false);
      isLoading(false);
      print('network error:$error');
    }
  }

  void getAllCarts() {
    if (isAddedProduct.value) {
      return;
    } else {
      _getAllCarts();
    }
  }

  void _getAllCarts() {
    try {
      isLoading(true);
      _cartRepository.getAllCarts().then((response) {
        isAddedProduct(true);
        isLoading(false);
        _allCarts.addAll(response.data);
        initialTempListAllCarts();
      });
    } catch (error) {
      isAddedProduct(false);
      isLoading(false);
      print('network error:$error');
    }
  }

  void addFavorites(Favorites favorites) async {
    await _addFavorites(favorites);
  }

  Future _addFavorites(Favorites favorites) async {
    try {
      isLoading(true);
      await _favoritesRepository.addFavorites(favorites);
      tempListFavorites.add(favorites);
      isAddedProduct(true);
      showCustomSnackBar('favorites'.tr, 'added_to_your_favorites'.tr);
    } catch (error) {
      isAddedProduct(false);
      isLoading(false);
      print('network error:$error');
    } finally {
      isLoading(false);
    }
  }

  void deleteFavorites(Favorites favorites) async {
    isLoading(true);
    await _deleteFavorites(favorites);
  }

  Future _deleteFavorites(Favorites favorites) async {
    try {
      await _favoritesRepository.deleteFavorites(favorites);
      isAddedProduct(false);
      Get.off(() => FavoritesScreen());
    } catch (error) {
      isAddedProduct(true);
      isLoading(false);
      print('network error:$error');
    } finally {
      isLoading(false);
    }
  }

  void addProduct(Product product) async {
    isLoading(true);
    await _addProduct(product);
  }

  Future _addProduct(Product product) async {
    try {
      await _productRepository.addProduct(product);
      print('added product');
      tempListProducts.add(product);
      isAddedProduct(true);
      Get.off(AdminProductDetailScreen());
      showCustomSnackBar('added_product'.tr, 'you_have_added_a_new_product'.tr);
    } catch (error) {
      isAddedProduct(false);
      isLoading(false);
      print('network error:$error');
    } finally {
      isLoading(false);
    }
  }

  void addCart(Cart cart) async {
    await _addCart(cart);
  }

  Future _addCart(Cart cart) async {
    try {
      isLoading(true);
      await _cartRepository.addToCart(cart);
      tempListCarts.add(cart);
      isAddedProduct(true);
      showCustomSnackBar('carts'.tr, 'added_to_your_cart'.tr);
    } catch (error) {
      isAddedProduct(false);
      isLoading(false);
      print('network error:$error');
    } finally {
      isLoading(false);
    }
  }

  void deleteCart(Cart cart) async {
    isLoading(true);
    await _deleteCart(cart);
  }

  Future _deleteCart(Cart cart) async {
    try {
      await _cartRepository.deleteCart(cart);
      isAddedProduct(false);
      Get.off(() => CartScreen());
    } catch (error) {
      isAddedProduct(true);
      isLoading(false);
      print('network error:$error');
    } finally {
      isLoading(false);
    }
  }

  void initialTempListAllProducts() {
    for (var product in _allProduct) {
      Product _tempProduct = Product();
      _tempProduct.fromJson(product);
      tempListProducts.add(_tempProduct);
    }
  }

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

  visibleProductListUser() {
    for (var product in tempListProducts) {
      if (product.is_display) {
        listUserProducts.add(product);
      }
    }
  }
}
