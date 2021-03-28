import 'package:dio/dio.dart';
import 'package:ehsan_store/data_source/model/cart/Cart.dart';

abstract class AbstractCartRepository {
  Future<Response> addToCart(Cart cart);
  Future<Response> getAllCarts();
  Future<Response> deleteCarts(Cart cart);
}

class CartRepository implements AbstractCartRepository{
  Dio _dio = Dio(BaseOptions(
      baseUrl: 'http://localhost:3000/', contentType: 'application/json'));

  @override
  Future<Response> addToCart(Cart cart) {
    return _dio.post('/cart', data: cart);
  }

  @override
  Future<Response> deleteCarts(Cart cart) {
    return _dio.delete('/cart',data:cart );
  }

  @override
  Future<Response> getAllCarts() {
    return _dio.get('/cart');
  }

}