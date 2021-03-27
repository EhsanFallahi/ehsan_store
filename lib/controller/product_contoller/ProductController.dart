import 'package:ehsan_store/data_source/model/product/Product.dart';
import 'package:ehsan_store/data_source/repository/product/ProductRepository.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  ProductRepository _productRepository = ProductRepository();

  List<dynamic> _allProduct = [].obs;
  var tempListProducts =List<Product>().obs;

  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    getAllProducts();
  }

   void getAllProducts(){
    try {
      isLoading(true);
        _productRepository.getProduct().then((response) {
          isLoading(false);
        _allProduct.addAll(response.data);
          initialTempListAllProducts() ;
        print('onInit products is$tempListProducts');
      });
    } catch (error) {
      isLoading(false);
      print('network error:$error');
    }
  }

  void initialTempListAllProducts() {
    for (var product in _allProduct) {
      Product _tempProduct = Product();
      _tempProduct.fromJson(product);
      tempListProducts.add(_tempProduct);
    }
  }
}
