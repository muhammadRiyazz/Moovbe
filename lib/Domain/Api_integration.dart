import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:moovbe/Domain/Modals/modal_Driver.dart';
import 'package:moovbe/Domain/Modals/modal_loginrspns.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Network {
  static Future<Driver> getdriverlist(
      {required String apikey, required String token}) async {
    final url =
        Uri.parse('http://flutter.noviindus.co.in/api/DriverApi/$apikey/');
    log('jjyy');

    final resp = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
    });

    final json = jsonDecode(resp.body);
    log(json.toString());

    final data = Driver.fromJson(json);

    return data;
  }

  static Future<Loginrspns> login(
      {required String username, required String password}) async {
    final url = Uri.parse('http://flutter.noviindus.co.in/api/LoginApi');

    final resp = await http.post(url, body: {
      "username": username,
      "password": password,
    });

    final json = jsonDecode(resp.body);
    final data = Loginrspns.fromJson(json);

    log(data.urlId);
    final sharepreferances = await SharedPreferences.getInstance();

    sharepreferances.setString('apikey', data.urlId);

    sharepreferances.setString('token', data.access);

    return data;
  }

  getnewtoken() {
    final url = Uri.parse('http://flutter.noviindus.co.in/api/LoginApi');
  }
}
