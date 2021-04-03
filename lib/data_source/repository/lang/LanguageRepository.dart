import 'package:dio/dio.dart';
import 'package:ehsan_store/data_source/model/cart/Cart.dart';
import 'package:ehsan_store/data_source/model/lang/Language.dart';

abstract class AbstractLanguageRepository {
  Future<Response> getLanguage();
  Future<Response> updateLanguage(Language language);
}

class LanguageRepository implements AbstractLanguageRepository{
  Dio _dio = Dio(BaseOptions(
      baseUrl: 'http://localhost:3000/', contentType: 'application/json'));

  @override
  Future<Response> updateLanguage(Language language) {
    return _dio.put('/lang/${language.id}', data: language);
  }
  @override
  Future<Response> getLanguage() {
    return _dio.get('/lang');
  }

}