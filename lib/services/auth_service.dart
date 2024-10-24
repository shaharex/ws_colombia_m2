import 'package:dio/dio.dart';

class AuthService {
  final dio = Dio();
  void request() async {
    Response response;
    response = await dio.get('');
  }
}