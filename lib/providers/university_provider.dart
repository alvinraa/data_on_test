import 'package:data_on_test/models/university_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../services/services.dart';
import '../utils/state/finite_state.dart';

class UniversityResultProvider extends ChangeNotifier {
  final ApiService service = ApiService();

  late UniversityModel universityResult;
  MyState myState = MyState.loading;

  Future fetchUniversityResult() async {
    try {
      myState = MyState.loading;
      notifyListeners();

      universityResult = await service.fetchUniversity();

      myState = MyState.loaded;
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        // jika ingin check status dio error
        e.response?.statusCode;
      }

      myState = MyState.failed;
      notifyListeners();
    }
  }
}
