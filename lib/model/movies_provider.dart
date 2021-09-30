import 'package:flutter/cupertino.dart';

import 'package:movies/remotly/dio_helper.dart';

class MovieProvider extends ChangeNotifier {
  List popular = [];
  List topRated = [];

  Future getPopular() async {
    await DioHelper.getData(
        url: '/3/movie/popular',
        query: {'api_key': '837aa67b269303622a476bbe24283a57'}).then((value) {
      popular = value.data['results'];
    }).catchError((error) {
      print(error.toString());
    });
    notifyListeners();
  }

  Future<void> getTopRated() async {
    await DioHelper.getData(
        url: '/3/movie/top_rated',
        query: {'api_key': '837aa67b269303622a476bbe24283a57'}).then((value) {
      topRated = value.data['results'];
    }).catchError((error) {
      print(error.toString());
    });
    notifyListeners();
  }
}
