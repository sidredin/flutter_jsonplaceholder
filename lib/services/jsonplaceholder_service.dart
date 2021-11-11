import 'package:flutter_jsonplaceholder/models/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class JsonplaceholderService {
  static Future<List<User>> fetchUsers() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      List<User> users;
      var json = jsonDecode(response.body);
      users = List<User>.from(json.map((x) => User.fromJson(x)));
      return users;
    } else {
      throw Exception('Failed to load users list');
    }
  }
}
