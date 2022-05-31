import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:stylish/config.dart';
import 'package:stylish/models/MyCategory.dart';
import 'package:stylish/models/MyProduct.dart';
import 'package:stylish/models/ProductFilterModel.dart';
import 'package:stylish/models/login_request_model.dart';
import 'package:stylish/models/login_response_model.dart';
import 'package:stylish/models/register_response_model.dart';
import 'package:stylish/services/shared_service.dart';

import 'dart:developer' as developer;

import '../models/register_request_model.dart';

final apiService = Provider((ref)=> APIService());

class APIService {
  static var client = http.Client();

  static Future<bool> login(LoginRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.loginAPI);

    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));

    if (response.statusCode == 200) {
      await SharedService.setLoginDetails(loginResponseModel(response.body));
      print("Response 35: "+response.body);
      return true;
    } else {
      return false;
    }
  }

  static Future<RegisterResponseModel> register(
      RegisterRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.registerAPI);

    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));

    return registerResponseModel(response.body);
  }

  static Future<String> getUserProfile(LoginRequestModel model) async {

    var loginDetails = await SharedService.loginDetails();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic ${loginDetails?.data.token}'
    };

    var url = Uri.http(Config.apiURL, Config.userProfileAPI);

    var response = await client.get(url,
        headers: requestHeaders);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }

  Future<List<MyCategory>?> getCategories(page, pageSize) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json'
    };

    Map<String, String> queryString = {
      'page': page.toString(),
      'pageSize': pageSize.toString()
    };

    var url = Uri.http(Config.apiURL, Config.categoryAPI, queryString);

    var response = await client.get(url,
        headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      //developer.log('log me 95: ${data["data"]}', name: 'my.app.category');
      return categoryFromJson(data["data"]);
    } else {
      developer.log('log me', name: 'line 98:');
      return null;
    }
  }

  Future<List<MyProduct>?> getProducts(ProductFilterModel productFilterModel) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json'
    };

    Map<String, String> queryString = {
      'page': productFilterModel.paginationModel.page.toString(),
      'pageSize': productFilterModel.paginationModel.pageSize.toString()
    };

    if(productFilterModel.categoryId != null){
      queryString["categoryId"] = productFilterModel.categoryId!;
    }

    var url = Uri.http(Config.apiURL, Config.productAPI, queryString);

    var response = await client.get(url,
        headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      //developer.log('log me 121: ${data}', name: 'my.app.product');
      //developer.log('log me 121: ${data["data"]}', name: 'my.app.product');
      //developer.log('log me 122: ${productFromJson(data["data"])}', name: 'my.app.product');
      return productFromJson(data["data"]);
    } else {
      developer.log('log me', name: 'line 125:');
      return null;
    }
  }
}
