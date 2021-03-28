import 'package:dio/dio.dart';
import 'package:ehsan_store/data_source/model/product/Product.dart';

abstract class AbstractProductRepository {
  Future<Response> addProduct(Product product);
  Future<Response> getAllProducts();
  Future<Response> getSelectedProducts(int id);
  Future<Response> updateProduct(Product product);
}

class ProductRepository implements AbstractProductRepository{
  Dio _dio = Dio(BaseOptions(
      baseUrl: 'http://localhost:3000/', contentType: 'application/json'));

  @override
  Future<Response> addProduct(Product product) {
    return _dio.post('/product', data: product);
  }

  @override
  Future<Response> getAllProducts() {
    return _dio.get('/product');
  }

  @override
  Future<Response> updateProduct(Product product) {
    return _dio.put('/product/${product.id}', data: product);
  }

  @override
  Future<Response> getSelectedProducts(int id) {
    return _dio.get('/product/$id');
  }

}