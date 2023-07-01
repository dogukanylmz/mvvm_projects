import 'dart:io';

import '../Model/user_model.dart';
import 'package:dio/dio.dart';

class Service {
   Future<List<User>> getUsers() async {
    String endpoint = "https://jsonplaceholder.typicode.com/users";

    var response = await Dio().get(endpoint);

    if (response.statusCode == HttpStatus.ok) {
      final resposeData = response.data as List;
      List<User> users = [];
      for (int i = 0; i < resposeData.length; i++) {
        users.add(User.fromJson(resposeData[i]));
      }
      return users;
    } else {
      return [];
    }
  }
}
