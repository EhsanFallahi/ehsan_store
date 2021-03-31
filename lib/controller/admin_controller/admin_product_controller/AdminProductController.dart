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
    print('in on init start');
    titleController = TextEditingController(text: neededProductsDetails[1]);
    print('in on init start title is: $titleController');
    descriptionController = TextEditingController(text: neededProductsDetails[2]);
    print('in on init desc is: $descriptionController');
    priceController = TextEditingController(text: neededProductsDetails[3].toString());
    print('in on init price is : $priceController');
    tagController = TextEditingController(text: neededProductsDetails[4]);
    picture=neededProductsDetails[7];
    isFavorites=neededProductsDetails[8];
    print('in on init picture is : $picture');
    print('on init id is: ${neededProductsDetails[0]}');
    getSelectedProduct();
    amountCounter.value = neededProductsDetails[5];
    print('on init amountCounter is: ${neededProductsDetails[1]}');
    changeDisplayProduct.value = neededProductsDetails[6];
    print('on init hangeDisplayProduct is: ${neededProductsDetails[2]}');
    super.onInit();
  }

  void getSelectedProduct() {
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