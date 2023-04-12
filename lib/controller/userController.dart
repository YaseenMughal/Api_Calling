import 'dart:convert';

import 'package:crudpractice/model/userModel.dart';
import 'package:http/http.dart' as http;

getUsers() async {
  const url = "https://maaz-api.tga-edu.com/api/users";
  var baseURL = Uri.parse(url);
  var response = await http.get(baseURL);
  var responseData = jsonDecode(response.body);
  var userData = userModel.fromJson(responseData);
  print(userData.data);
  return userData;
}

addUser(data) async {
  const url = "https://maaz-api.tga-edu.com/api/users";
  var baseURL = Uri.parse(url);
  final response = await http.post(baseURL,
      body: jsonEncode(data), headers: {'content-type': 'application/json'});
  print(response.body);
}

deleteUser(id) async {
  var url = "https://maaz-api.tga-edu.com/api/users/$id";
  Uri uri = Uri.parse(url);
  final response = await http.delete(uri);
  print(response.body);
}

getById(id) async {
  var url = "https://maaz-api.tga-edu.com/api/users/$id";
  var baseURL = Uri.parse(url);
  var response = await http.get(baseURL);
  var responseData = jsonDecode(response.body);
  var userData = userModel.fromJson(responseData);
  print(userData.data);
  return userData;
}

updateUser({
  required int id,
  required String name,
  required String userName,
  required String email,
}) async {
  String url = "https://maaz-api.tga-edu.com/api/users/$id";
  Uri uri = Uri.parse(url);
  http.Response response = await http.put(uri,
      headers: {'content-type': 'application/json'},
      body: jsonEncode({"name": name, "username": userName, "email": email}));
  Map<String, dynamic> body = jsonDecode(response.body);
  return body;
}
