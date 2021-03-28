import 'package:ehsan_store/data_source/model/product/Product.dart';
import 'package:ehsan_store/data_source/repository/product/ProductRepository.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController{
  ProductRepository _productRepository = ProductRepository();
  final productId = Get.arguments;

  dynamic _selectedProduct = Product().obs;
  var tempSelectedProduct =Product().obs;
  RxInt amountCounter=0.obs;

  RxBool isLoading = false.obs;
  @override
  void onInit() async{
    getSelectedProduct();
    super.onInit();
  }

  void getSelectedProduct(){
    try {
      isLoading(true);
      _productRepository.getSelectedProducts(productId).then((response) {
        isLoading(false);
        _selectedProduct=response.data;
        Product _tempProduct = Product();
        _tempProduct.fromJson(_selectedProduct);
        tempSelectedProduct(_tempProduct);
        print('product lenght:${tempSelectedProduct.value.picture}');
      });
    } catch (error) {
      isLoading(false);
      print('network error:$error');
    }
  }
}