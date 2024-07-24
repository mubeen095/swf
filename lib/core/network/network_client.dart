import 'package:coffee_shop/core/helpers/cache_manager.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class NetworkClient {
  final Dio dio;
  final CacheManager cacheManager;
  NetworkClient({required this.dio, required this.cacheManager});

  Future<Response<dynamic>> get(
      {required String url, Map<String, dynamic>? data}) async {
    try {
      final response = await dio.get(url);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>> post(
      {required String url, required Map<String, dynamic> data}) async {
    try {
      final token = cacheManager.getToken();
      final response = await dio.post(url,
          data: data,
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> uploadFormData({required String url,
 required Map<String,dynamic> map,
  }) async {
try {
   final token = cacheManager.getToken();
  final formData = FormData.fromMap(map);
  final response = await dio.post(url,data: formData,
  options: Options(headers: {
    "Authorization":"Bearer $token",
    "Content-Type":"multipart/form-data"
  })
  );
  return response;
} catch (e) {
  rethrow;
}
  }
}
