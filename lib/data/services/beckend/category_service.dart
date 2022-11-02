import 'package:dio/dio.dart';
import 'package:intex/data/model/category_model.dart';

import '../../../core/base/base_api.dart';

class CategoryService {
  static final CategoryService _inherentce = CategoryService._init();

  static CategoryService get inherentce => _inherentce;

  CategoryService._init();

  int categoryLength = 0;

  Future<List<CategoryModel>> getCatrgory() async {
    Response res = await Dio().get("${BaseApi.baseApi}category");

    // print("STATUS CODE: CATEGORY");

    if (res.statusCode == 200) {
      categoryLength = (res.data as List).length;
      try {
        return (res.data as List)
            .map((e) => CategoryModel.fromJson(e))
            .toList();
      } catch (e) {
        throw Exception("ERROR $e");
      }
    } else if (res.data == 404) {
      throw Exception("404 not found page");
    } else if (res.data == 500) {
      throw Exception("Internal server error");
    } else {
      throw Exception(
          "There is an error on the server. Maybe there is a problem with the internet.");
    }
  }
}
