import 'dart:convert';

import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:stylish/models/login_response_model.dart';

import '../screens/register/login_screen.dart';

class SharedService {
  static Future<bool> isLoggedIn() async {
    var isKeyExits = await APICacheManager().isAPICacheKeyExist(
        "login_details");
    return isKeyExits;
  }

  static Future<LoginResponseModel?> loginDetails() async {
    var isKeyExits = await APICacheManager().isAPICacheKeyExist(
        "login_details");

    if (isKeyExits) {
      var cacheData = await APICacheManager().getCacheData("login_details");

      return loginResponseModel(cacheData.syncData);
    }
    return null;
  }

  static Future<void> setLoginDetails(LoginResponseModel model) async {
    APICacheDBModel cacheDBModel = APICacheDBModel(
        key: "login_details", syncData: jsonEncode(model.toJson()));

    await APICacheManager().addCacheData(cacheDBModel);
  }

  static Future<void> logout(BuildContext context) async {
    await APICacheManager().deleteCache("login_details");
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) => const LoginScreen(),
    ), (route) => false);
  }

}