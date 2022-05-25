import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences {
  static SharedPreferences? _sharedPreferences;

  static Future init() async {
    print("Line 23: In init()");
    _sharedPreferences = await SharedPreferences.getInstance();
    print("Line 25: In init() $_sharedPreferences");
  }

  static Future setCartList(RxList<dynamic> rxList) async {
    var mapInString = jsonEncode(rxList);
    print("Line 30: SetCart " + mapInString);
    await _sharedPreferences?.setString('cart', mapInString);
  }

  static String? getCartList() {
    String? mapInString;
    if (_sharedPreferences!.containsKey('cart')) {
      mapInString = _sharedPreferences!.getString('cart');
      print("Line 38: GetCart Found");
    } else {
      print("Line 38: GetCart Not Found");
    }
    return mapInString;
  }

  static void deleteCartList() {
    if (_sharedPreferences!.containsKey('cart')) {
      _sharedPreferences!.remove('cart');
      print("Line 52: Cart Deleted");
    }
  }
}
