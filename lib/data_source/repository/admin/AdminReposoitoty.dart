

import 'package:dio/dio.dart';
import 'package:ehsan_store/data_source/model/admin/Admin.dart';

abstract class AbstractAdminRepository {
  Future<Response> addAdmin(Admin admin);
  Future<Response> getAllAdmins();
  Future<Response> deleteAdmin(int id);
}

class AdminRepository implements AbstractAdminRepository {
  Dio _dio = Dio(BaseOptions(
      baseUrl: 'http://localhost:3000/', contentType: 'application/json'));

  @override
  Future<Response> addAdmin(Admin admin) {
    return _dio.post('/admin', data: admin);
  }

  @override
  Future<Response> getAllAdmins() {
    return _dio.get('/admin');
  }

  @override
  Future<Response> updateAdmin(Admin admin) {
    return _dio.put('/admin/${admin.id}', data: admin);
  }

  @override
  Future<Response> deleteAdmin(int id) {
    return _dio.delete('/admin/$id');
  }
}
