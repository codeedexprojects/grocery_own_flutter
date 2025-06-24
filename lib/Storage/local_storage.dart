import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

storeUserId({required int userId}) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt('userId', userId);
}

removeUserId() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('userId');
}

checkUserisLogginrOrNot({required int userId}) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  userId = prefs.getInt('userId') ?? 0;
  log(userId);
}
