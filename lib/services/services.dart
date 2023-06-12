import 'package:data_on_test/models/university_model.dart';
import 'package:dio/dio.dart';

import '../utils/urls/urls.dart';

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioError e, handler) {
          if (e.response!.statusCode == 401) {
            // do something
          } else {
            // do something
          }
          return handler.next(e);
        },
      ),
    );
  }

  Future<UniversityModel> fetchUniversity() async {
    try {
      final response =
          await _dio.get('${Urls.baseUrl}${Urls.search}country=Indonesia');
      print('fetchUniversity Services');
      print(response.data);

      return UniversityModel.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }
}
