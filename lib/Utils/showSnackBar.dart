import 'package:flutter_flushbar/flutter_flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';


showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message),
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(
      left: 8,
      right: 8,
      bottom: 8,
    ),));
}

flushbar1(BuildContext context , String message) {
  Flushbar(
    flushbarStyle: FlushbarStyle.FLOATING,
    // message:  "Please Enter your first Name",
    message: message,
    duration:  const Duration(seconds: 3),
  ).show(context);
}

loader(BuildContext context) {
  Loader.show(context,
      isSafeAreaOverlay: false,
      isAppbarOverlay: true,
      isBottomBarOverlay: true,
      progressIndicator:  CircularProgressIndicator(valueColor:  AlwaysStoppedAnimation<Color>(Colors.transparent)),
      themeData: Theme.of(context).copyWith(
          colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: Colors.transparent)),
      overlayColor: Colors.transparent);
}



loader1(BuildContext context) {
  Loader.show(context,
      isSafeAreaOverlay: false,
      isAppbarOverlay: true,
      isBottomBarOverlay: true,
      progressIndicator: const CircularProgressIndicator(),
      themeData: Theme.of(context).copyWith(
          colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: Colors.red)),
      overlayColor: Colors.red);
}