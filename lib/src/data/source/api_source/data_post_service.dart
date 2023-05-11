import 'package:dio/dio.dart';

class DataPostService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> generateUrl({required String url}) async {
    try {
      final Response res = await _dio
          .post('https://cleanuri.com/api/v1/shorten', data: {'url': url});
      final Map<String, dynamic> decodeRes = res.data;

      if (decodeRes.containsKey('result_url')) {
        return {
          'success': true,
          'message': 'exito!',
          'data': decodeRes['result_url']
        };
      } else {
        return {'success': false, 'message': decodeRes['error'], 'data': null};
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Error al generar la url',
        'data': null
      };
    }
  }
}
