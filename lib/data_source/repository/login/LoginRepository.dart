import 'package:dio/dio.dart';
import 'package:ehsan_store/data_source/model/admin/Admin.dart';
import 'package:ehsan_store/data_source/model/user/User.dart';

abstract class AbstractLoginRepository {
  Future<Response> addUser(User user);
  Future<Response> addAdmin(Admin admin);

  Future<Response> getUser();
  Future<Response> getAdmin();

  Future<Response> updateUser(User user);
  Future<Response> updateAdmin(Admin admin);
}

class LoginRepository implements AbstractLoginRepository {
  Dio _dio = Dio(BaseOptions(
      baseUrl: 'http://localhost:3000/', contentType: 'application/json'));

  @override
  Future<Response> addUser(User user) {
    return _dio.post('/user', data: user);
  }

  @override
  Future<Response> getUser() async {

    return _dio.get('/user');
  }

  @override
  Future<Response> updateUser(User user) {
    return _dio.put('/user/${user.id}', data: user);
  }

  @override
  Future<Response> addAdmin(Admin admin) {
    return _dio.post('/admin', data: admin);
  }

  @override
  Future<Response> getAdmin() {
    return _dio.get('/admin');
  }

  @override
  Future<Response> updateAdmin(Admin admin) {
    return _dio.put('/adminr/${admin.id}', data: admin);
  }
}
