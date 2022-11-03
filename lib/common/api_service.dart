import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import '/model/user.dart';
import 'package:test/common/exceptions.dart';

const String url = 'http://jsonplaceholder.typicode.com/user';
Future<List<User>> fetchUsrInfo() async {
  try {
    final response = await http.get(Uri.parse(url));
    if (200 == response.statusCode) {
      final List<User> users = modelUserFromJson(response.body);
      return users;
    } else {
      return <User>[];
    }
  } on NoInternetException catch (e) {
    throw NoInternetException('No Internet');
  } on HttpException {
    throw NoServiceFoundException('No Service Found');
  } on FormatException {
throw InvalidFormatException('Invalid Data Format');
} on UnknownException catch (e) {
throw UnknownException(e.message);
}
}
