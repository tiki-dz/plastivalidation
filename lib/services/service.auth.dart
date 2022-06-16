import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:plastivalidation/controller/controller.local.dart';

import '../data/server.data.dart';

class AuthService {
  static Future<bool> login(String email, String password) async {
    try {
      http.Response response = await http.post(Uri.parse(loginUrl),
          body: {"email": email, "password": password});
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        String token = jsonData['data']['token'];
        LocalController.setToken(token);
        return true;
      }
      return false;
    } on Exception catch (e) {
      return false; 
    }
  }
  static Future<dynamic> check(String token) async {
    print(token);
    try {
      http.Response response = await http.get(Uri.parse(checkUrl),
         headers: {
        'x-access-token' : token,
          });
      debugPrint(checkUrl);
      print("wow");
      print(response.body);
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        Map<String,dynamic> data = jsonData['data'];
        return data;
      }
      return null;
    } on Exception catch (e) {
      return null;
    }
  }
}
