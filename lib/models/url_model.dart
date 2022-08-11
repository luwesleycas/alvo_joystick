import 'package:dio/dio.dart';

class UrlModel {
  final String url;

  UrlModel(this.url);

  fetch(String url) async {
      final response = await Dio().get(url);
    try {
      print(response.statusMessage);
    } catch (e) {
      print('Deu Erro');
    }
  }
}
