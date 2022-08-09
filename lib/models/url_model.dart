import 'package:http/http.dart' as http;


class UrlModel{
  final String url;

  UrlModel(this.url); 

  fetch(String url) async {
    var link = Uri.parse(url);
    var response = await http.get(link);
  }
}