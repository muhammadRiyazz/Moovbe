import 'package:flutter/material.dart';

showsnackbar({required BuildContext context, required String msg}) {
  final snackbar = SnackBar(content: Text(msg));
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
