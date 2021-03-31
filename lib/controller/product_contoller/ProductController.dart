import 'package:ehsan_store/data_source/model/product/Product.dart';
import 'package:ehsan_store/data_source/repository/product/ProductRepository.dart';
import 'package:ehsan_store/screens/admin/product_detail/AdminProductDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  ProductRepository _productRepository = ProductRepository();

  List<dynamic> _allProduct = [].obs;
  var tempListProducts =List<Product>().obs;
  var listUserProducts=List<Product>().obs;
  RxBool isLoading = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptinController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController tagController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  RxBool isAddedProduct = false.obs;

  @override
  void onInit() async {
    print('on init');
    getAllProducts();
    initListUserProducts();
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
          initListUserProducts();
        print('onInit products is$listUserProducts');
      });
    } catch (error) {
      isAddedProduct(false);
      isLoading(false);
      print('network error:$error');
    }
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


  void initialTempListAllProducts() {
    for (var product in _allProduct) {
      Product _tempProduct = Product();
      _tempProduct.fromJson(product);
      tempListProducts.add(_tempProduct);
    }

  }

  initListUserProducts() {
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

  void showDeletedProductSnackBar()  =>
      Get.snackbar('Product Deleted', 'You have Deleted a Product',
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.all(8),
          colorText: Theme.of(Get.context).accentColor,
          backgroundColor: Colors.black87.withOpacity(0.8));


}
