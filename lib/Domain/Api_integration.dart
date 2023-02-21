import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:moovbe/Domain/Modals/modal_Driver.dart';
import 'package:moovbe/Domain/Modals/modal_bus.dart';
import 'package:moovbe/Domain/Modals/modal_loginrspns.dart';
import 'package:moovbe/Presentation/Screen%20Add%20Driver/screen_add_Driver.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Network {
  static Future<Driver> getdriverlist(
      {required String apikey, required String token}) async {
    final url =
        Uri.parse('http://flutter.noviindus.co.in/api/DriverApi/$apikey/');

    final resp = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
    });

    final json = jsonDecode(resp.body);

    final data = Driver.fromJson(json);
    log(data.driverList.length.toString());

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

  static Future<bus> getbuslist({required String apikey}) async {
    final url =
        Uri.parse('http://flutter.noviindus.co.in/api/BusListApi/$apikey/');

    final resp = await http.get(url);
    final json = jsonDecode(resp.body);
    final data = bus.fromJson(json);

    return data;
  }

  static Future<void> deleteDriver(
      {required String apikey,
      required int driverid,
      required String token}) async {
    final url =
        Uri.parse('http://flutter.noviindus.co.in/api/DriverApi/$apikey/');

    final String id = driverid.toString();

    await http.delete(url, body: {
      "driver_id": id,
    }, headers: {
      'Authorization': 'Bearer $token',
    });
  }

  static Future<void> addDriver(
      {required String apikey,
      required String mobile,
      required String name,
      required String licenseno,
      required String token}) async {
    final url =
        Uri.parse('http://flutter.noviindus.co.in/api/DriverApi/$apikey/');

    await http.post(url, body: {
      "name": name,
      "mobile": mobile,
      "license_no": licenseno,
    }, headers: {
      'Authorization': 'Bearer $token',
    });
  }
}
