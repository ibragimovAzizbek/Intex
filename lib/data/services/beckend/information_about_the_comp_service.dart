import 'package:dio/dio.dart';

import '../../../core/base/base_api.dart';
import '../../model/about_company_model.dart';

class GetAbountCompany {
  static final GetAbountCompany _inherentce = GetAbountCompany._init();

  static GetAbountCompany get inherentce => _inherentce;

  GetAbountCompany._init();

  Future<List<AboutCompanyModel>> getCategory() async {
    Response res = await Dio().get("${BaseApi.baseApi}site");

    // print("DATA ABOUT: Service");

    if (res.statusCode == 200) {
      try {
        // print("ABOUT THE COMPANY || try");
        return (res.data as List)
            .map((e) => AboutCompanyModel.fromJson(e))
            .toList();
      } catch (e) {
        // print("ABOUT THE COMPANY || catch");
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
