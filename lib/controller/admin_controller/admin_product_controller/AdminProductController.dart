import 'package:ehsan_store/controller/product_contoller/ProductController.dart';
import 'package:ehsan_store/data_source/model/product/Product.dart';
import 'package:ehsan_store/data_source/repository/admin/AdminReposoitoty.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminProductController extends GetxController {

  AdminRepository _adminRepository = AdminRepository();
  final neededProductsDetails = Get.arguments;


  dynamic _selectedProduct = Product().obs;
  var tempSelectedProduct = Product().obs;
  RxInt amountCounter = 0.obs;
  RxBool isLoading = false.obs;
  RxBool changeDisplayProduct = true.obs;

  // [id,title,description,price,tag,amount,is_display,picture]
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var priceController = TextEditingController();
  var tagController = TextEditingController();
  var picture;
  var isFavorites;

  @override
  void onInit() async {
    titleController = TextEditingController(text: neededProductsDetails[1]);
    descriptionController = TextEditingController(text: neededProductsDetails[2]);
    priceController = TextEditingController(text: neededProductsDetails[3].toString());
    tagController = TextEditingController(text: neededProductsDetails[4]);
    picture=neededProductsDetails[7];
    isFavorites=neededProductsDetails[8];
    getSelectedProduct();
    amountCounter.value = neededProductsDetails[5];
    changeDisplayProduct.value = neededProductsDetails[6];
    super.onInit();
  }

  void getSelectedProduct() {
    _getSelectedProduct();
  }

  void _getSelectedProduct() {
    try {
      isLoading(true);
      _adminRepository.getSelectedProducts(neededProductsDetails[0]).then((
          response) {
        isLoading(false);
        _selectedProduct = response.data;
        Product _tempProduct = Product();
        _tempProduct.fromJson(_selectedProduct);
        tempSelectedProduct(_tempProduct);
        print('on get method temp is: ${tempSelectedProduct}');
        ProductController().getAllProducts();
      });
    } catch (error) {
      isLoading(false);
      print('network error:$error');
    }
  }

}