import 'dart:convert';
import 'dart:developer';
import 'package:food_delivery/Utils/urls.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Response/Cat_response/cat_immuniti_response.dart';
import '../Response/Cat_response/cat_nuti_response.dart';
import '../Response/mainfoodpage_response.dart';
import '../Response/viewAll_response.dart';

class Repository{
  //get profile Details
  Future<MainFoodPageResponse> checkapi(
      // String password,
      ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    // var device_token = getDeviceToken();
    // se.GetXState();
      try  {
      final response = await http.get(Uri.parse(baseUrl + home),
          headers: {'Authorization': "Bearer $token"});

      if (response.statusCode == 200) {
        log(response.statusCode.toString());
        log("this is get profile request" + response.body.toString());
        // var context;
        // se.Get.to(const Otp2Screen());

        return MainFoodPageResponse.fromJson(jsonDecode(response.body));
      } else {
        log(response.statusCode.toString());
        throw jsonDecode(response.body)['message'];
      }
    }catch (e){
        throw e;
      }
  }

  Future<NutiCategoryResponse> nutiCategoryrequest(
      // String password,
      ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    // var device_token = getDeviceToken();
    // se.GetXState();
    try  {
      final response = await http.get(Uri.parse(baseUrl + categoryNuti),
          headers: {'Authorization': "Bearer $token"});

      if (response.statusCode == 200) {
        log(response.statusCode.toString());
        log("qwqwqw" + response.body.toString());
        // var context;
        // se.Get.to(const Otp2Screen());

        return NutiCategoryResponse.fromJson(jsonDecode(response.body));
      } else {
        log(response.statusCode.toString());
        throw jsonDecode(response.body)['message'];
      }
    }catch (e){
      throw e;
    }
  }

  Future<ImmunitiResponse> immunitiCategoryrequest(
      // String password,
      ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    // var device_token = getDeviceToken();
    // se.GetXState();
    try  {
      final response = await http.get(Uri.parse(baseUrl + categoryImmuniti),
          headers: {'Authorization': "Bearer $token"});

      if (response.statusCode == 200) {
        log(response.statusCode.toString());
        log("asasas" + response.body.toString());
        // var context;
        // se.Get.to(const Otp2Screen());

        return ImmunitiResponse.fromJson(jsonDecode(response.body));
      } else {
        log(response.statusCode.toString());
        throw jsonDecode(response.body)['message'];
      }
    }catch (e){
      throw e;
    }
  }

  Future<ViewAll_response> ViewAllrequest(
      // String password,
      ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    // var device_token = getDeviceToken();
    // se.GetXState();
    try  {
      final response = await http.get(Uri.parse(baseUrl + viewAll),
          headers: {'Authorization': "Bearer $token"});

      if (response.statusCode == 200) {
        log(response.statusCode.toString());
        log("mnmnmn" + response.body.toString());
        // var context;
        // se.Get.to(const Otp2Screen());

        return ViewAll_response.fromJson(jsonDecode(response.body));
      } else {
        log(response.statusCode.toString());
        throw jsonDecode(response.body)['message'];
      }
    }catch (e){
      throw e;
    }
  }



}