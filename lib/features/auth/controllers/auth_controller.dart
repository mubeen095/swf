import "package:coffee_shop/core/network/network.dart";
import "package:dio/dio.dart";
import "package:fpdart/fpdart.dart";
import "package:injectable/injectable.dart";
import "package:shared_preferences/shared_preferences.dart";

@LazySingleton()
class AuthController {
  final Dio _dio;
  final SharedPreferences _sharedPreferences;
  AuthController(
      {required Dio dio, required SharedPreferences sharedPreferences})
      : _dio = dio,
        _sharedPreferences = sharedPreferences;

  Future<Either<String, bool>> signup(
      {required String mobileNo, password, confirmPassword}) async {
    try {
      final response =
          await _dio.post(APIUrls.signup, options: Options(), data: {
        "mobile_no": mobileNo,
        "password": password,
        "password_confirmation": confirmPassword,
      });
      print(response);
      return right(true);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> verifyOTP({required String otpCode}) async {
    try {
      final response =
          await _dio.post(APIUrls.verifyOTP, options: Options(), data: {
        "code": otpCode,
      });
      print(response);
      return right(true);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, bool>> login(
      {required String mobileNo, password}) async {
    try {
      final response = await _dio.post(APIUrls.login,
          data: {"mobile_no": mobileNo, "password": password});
      print(response);
     await  _sharedPreferences.setString("TOKEN",response.data['token']);
      return right(true);
    } catch (e) {
      return left(e.toString());
    }
  }
}
