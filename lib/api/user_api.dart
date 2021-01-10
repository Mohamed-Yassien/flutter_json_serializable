import 'dart:convert';

import 'package:flutter_serli/models/user.dart';
import 'package:http/http.dart' as http;

class UserApi{

  static Future<List<User>> getAllUser() async{
    final response = await http.get('https://jsonplaceholder.typicode.com/users');
    if (response.statusCode == 200){
      Iterable parsedData = jsonDecode(response.body);
      return parsedData.map((e) => User.fromJson(e)).toList();
    }
    else{
      return null;
    }
  }

}