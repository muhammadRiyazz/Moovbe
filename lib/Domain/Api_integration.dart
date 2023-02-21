import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:moovbe/Domain/Modals/modal_loginrspns.dart';

class Network {
  static getdriverlist() async {
    final url =
        Uri.parse('http://flutter.noviindus.co.in/api/DriverApi/4W4GS3L/');

    final resp = await http.post(url);
    log(resp.body.toString());

    return resp;
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

    return data;
  }
}
