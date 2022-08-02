import 'package:dio/dio.dart';
import 'package:meu_primeiro_app/services/http_client_interface.dart';

class DioClient implements IHttpClientInterface {
  final dio = Dio();

  @override
  Future get(String url) async {
    final response = await dio.get(url);
    return response.data;
  }
}
