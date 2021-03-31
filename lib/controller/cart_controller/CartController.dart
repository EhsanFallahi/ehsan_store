// import 'package:ehsan_store/data_source/model/cart/Cart.dart';
// import 'package:ehsan_store/data_source/model/favorites/Favorites.dart';
// import 'package:ehsan_store/data_source/repository/cart/CartRepository.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class CartController extends GetxController{
//   CartRepository _cartRepository = CartRepository();
//
//   List<dynamic> _allCarts = [];
//   var tempListCarts =List<Cart>().obs();
//   RxBool isLoading = false.obs;
//
//   @override
//   void onInit() async {
//     getAllCarts();
//   }
//
//
//   void addCart(Cart cart) async {
//     try {
//       isLoading(true);
//       await _cartRepository.addToCart(cart);
//       tempListCarts.add(cart);
//       // isAddedAdmin(true);
//       print('cart  added!');
//       showAddedCartSnackBa();
//       // Get.off(DashboardScreen());
//     }catch(error){
//       // isAddedAdmin(false);
//       print('network error:$error');
//     } finally {
//       isLoading(false);
//
//     }
//   }
//
//
//   void getAllCarts(){
//     // if(isAddedAdmin.value){
//     //   return;
//     // }
//     // else{
//       try {
//         isLoading(true);
//         _cartRepository.getAllCarts().then((response) {
//           // isAddedAdmin(true);
//           isLoading(false);
//           _allCarts.addAll(response.data);
//           initialTempListAllCarts() ;
//           print('onInit carts is$tempListCarts');
//         });
//       } catch (error) {
//         // isAddedAdmin(false);
//         isLoading(false);
//         print('network error:$error');
//       }
//     // }
//   }
//
//   void showAddedCartSnackBa()=>Get.snackbar('Carts', 'Added to your Cart',
//       snackPosition: SnackPosition.BOTTOM,
//       margin: EdgeInsets.all(8),
//       colorText: Theme.of(Get.context).accentColor,
//       backgroundColor: Colors.black87.withOpacity(0.8));
//
//   void initialTempListAllCarts() {
//     for (var cart in _allCarts) {
//       Cart _tempCart = Cart();
//       _tempCart.fromJson(cart);
//       tempListCarts.add(_tempCart);
//     }
//   }
// }