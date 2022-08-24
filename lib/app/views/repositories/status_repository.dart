import 'dart:convert';

import 'package:alvo_joystick/models/status_model.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class StatusRepository {
  final dio = Dio();
  final url = Uri.parse('http://192.168.0.200');

  Future<List<StatusModel>> fetchStatus() async {
    final response = await http.get(url);
    Map<String, dynamic> json = jsonDecode(response.body);
    final status = json['status'];
    print(status);
    return status;
  }

  Future<bool> isConected() async {
    final response = await http.get(url);
    var isConect = false;
    if (response.statusCode == 200) {
      isConect = true;
    }
    return isConect;
  }
}
