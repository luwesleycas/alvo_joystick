// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:http/http.dart' as http;

void main() {}

class ConnectUrl {
  final String url;

  ConnectUrl({required this.url});

}
  // fetch(String url) async {
  //   var link = Uri.parse(url);
  //   var response = await http.get(link);
  // }


// Future<String> fetchStatus(String url) async {
//   late String status;
//   var link = Uri.parse(url);
//   var response = await http.get(link);
//   if (response.statusCode == 200) {
//     status = 'Contectado';
//   }
//   ;
//   return status;
// }
