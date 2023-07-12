import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import '../Response/best_selling_product/product1_response.dart';
import '../Response/conf_email_response.dart';
import '../Response/login_response.dart';
import '../Response/verificationOtp_response.dart';

class Post_Repo {
  static final BaseOptions _baseOptions = BaseOptions(
      baseUrl: 'http://13.232.136.117/api/');

  Dio dio = Dio(_baseOptions);

  Future<LoginResponse> login(String email, String password) async {
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Content-Length'] = '<calculated when request is sent>';
    try {
      final response = await dio.post("login", data: {
        "email": email,
        "password": password,
      });
      // log(jsonEncode(response.data));

      return LoginResponse.fromJson(response.data);
    } on DioError catch (e) {
      print(e.response!.data);
      throw e.response!.data['msg'];
    } catch (e) {
      print(e);
      throw e.toString();
    }
  }

  Future<String> signUp(String firstName, String lastName, int mobile,
      String email, String password, String confirmPassword,) async {
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Content-Length'] = '<calculated when request is sent>';

    try {
      final response = await dio.post("create_and_register_new_user", data: {
        "first_name": firstName,
        "last_name": lastName,
        "mobile": mobile,
        "email": email,
        "password": password,
        "confirm_password": confirmPassword,
      });

      return response.data['message'];
    } on DioError catch (e) {
      print(e);
      throw e.response?.data['message'];
    } catch (e) {
      print(e);
      throw e.toString();
    }
  }

  Future<ConfirmationEmail> getForgetPassword(String email) async {
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Content-Length'] = '<calculated when request is sent>';
    try {
      final response = await dio.post("password/change",
        data: {"email": email},
      );
      return ConfirmationEmail.fromJson(response.data);
    } on DioError catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<VerifyOtpResponse> verifyOtp(String email, int otp) async {
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Content-Length'] = '<calculated when request is sent>';

    try {
      final response = await dio.post("verification",
        data: {"email": email, "otp": otp},
      );
      return VerifyOtpResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }


  Future<String> forgotOtp(String email, int otp) async {
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Content-Length'] = '<calculated when request is sent>';

    try {
      final response = await dio.post("verify/user",
        data: {"email": email, "otp": otp},
      );
      return response.data['message'];
    } on DioError catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<String> resendOtp(String email) async {
    dio.options.headers['Content-Type'] = 'application/json';
    //  dio.options.headers['Content-Length'] = '<calculated when request is sent>';
    log("message");
    try {
      final response = await dio.post("resend_otp",
        data: {"email": email},
      );
      return response.data['message'];
    } on DioError catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Product1_Response> products1(String product_id) async {
    dio.options.headers['Content-Type'] = 'application/json';
    //dio.options.headers['Content-Length'] = '<calculated when request is sent>';
    log("message");
    try {
      final response = await dio.post("get_the_product",data: {
        "product_id":product_id
      }

      );
      log(jsonEncode(response!.data));
      return Product1_Response.fromJson(response.data);
    } on DioException catch (e) {

      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }
}

class ApiErrorHandler {
  static String getErrorMessage(DioError error) {
    log(error.type.toString());
    log(error.response!.statusCode.toString());
    if (error.type == DioErrorType.connectionTimeout) {
      return 'Connection timeout';
    } else if (error.type == DioErrorType.receiveTimeout) {
      return 'Receive timeout';
    } else if (error.type == DioErrorType.badResponse) {
      // Handle different status codes
      final statusCode = error.response?.statusCode;
      switch (statusCode) {
        case 400:
          return error.response!.data['message'];
        case 401:
          return "unauthenticatedError";
        case 403:
          return error.response!.data['message'];
        case 404:
          return "NO DATA FOUND";
        case 500:
          return "serverError";
      // Add more cases as needed
        default:
          return "serverError";
      }
    } else if (error.type == DioErrorType.unknown) {
      return "serverError";
    } else {
      return "serverError";
    }
  }
}