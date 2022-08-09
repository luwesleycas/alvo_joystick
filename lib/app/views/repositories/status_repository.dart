import 'package:alvo_joystick/models/status_model.dart';
import 'package:dio/dio.dart';

class StatusRepository {
  final dio = Dio();
  final url = 'http://localhost:3031/status';

  Future<List<StatusModel>> fetchStatus() async {
    final response = await dio.get(url);
    final list = response.data;
    print(list);
    return list;
  }

  // Future<bool> sCode() async {
  //   final response = await dio.get(url);
  //   bool status = false;
  //   if (response.statusCode == 200) {
  //     status = false;
  //   }
  //   return status;
  // }
}
