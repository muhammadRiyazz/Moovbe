import 'package:flutter/material.dart';
import 'package:moovbe/Domain/Api_integration.dart';
import 'package:moovbe/Domain/Modals/modal_Driver.dart';
import 'package:moovbe/Presentation/widgets/snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future deleteDriver(
    {required int index,
    required List driverlist,
    required BuildContext context}) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  final apikey = sharedPreferences.getString('apikey');
  final apitoken = sharedPreferences.getString('token');

  Network.deleteDriver(
      apikey: apikey!, driverid: driverlist[index].id, token: apitoken!);

  showsnackbar(context: context, msg: 'Deleted');
}

Future addDriver(
    {required String name,
    required String license,
    required BuildContext context}) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  final apikey = sharedPreferences.getString('apikey');
  final apitoken = sharedPreferences.getString('token');

  await Network.addDriver(
      apikey: apikey!,
      mobile: '7034612195',
      name: name,
      licenseno: license,
      token: apitoken!);

  showsnackbar(context: context, msg: 'Driver Added');
}

Future<List<DriverList>> getdata() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  final apikey = sharedPreferences.getString('apikey');
  final apitoken = sharedPreferences.getString('token');

  //log(apikey!);
  //log(apitoken!);

  final respList =
      await Network.getdriverlist(apikey: apikey!, token: apitoken!);
  final driverlist = respList.driverList;
  // log(driverlist.length.toString());
  return driverlist;
}
