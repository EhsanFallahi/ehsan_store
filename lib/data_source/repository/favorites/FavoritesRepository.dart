import 'package:dio/dio.dart';
import 'package:ehsan_store/data_source/model/favorites/Favorites.dart';
import 'package:ehsan_store/data_source/model/product/Product.dart';

abstract class AbstractFavoritesRepository {
  Future<Response> addFavorites(Favorites favorites);
  Future<Response> getAllFavorites();
  Future<Response> deleteFavorites(Favorites favorites);
}

class FavoritesRepository implements AbstractFavoritesRepository{
  Dio _dio = Dio(BaseOptions(
      baseUrl: 'http://localhost:3000/', contentType: 'application/json'));

  @override
  Future<Response> addFavorites(Favorites favorites) {
    return _dio.post('/favorites', data: favorites);
  }

  @override
  Future<Response> deleteFavorites(Favorites favorites) {
    return _dio.delete('/favorites/${favorites.id}', data: favorites);
  }

  @override
  Future<Response> getAllFavorites() {
    return _dio.get('/favorites');
  }

}