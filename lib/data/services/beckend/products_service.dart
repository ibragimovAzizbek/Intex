import 'package:dio/dio.dart';
import 'package:intex/data/model/products_model.dart';

import '../../../core/base/base_api.dart';

class ProductService {
  int page = 0;
  int limit = 4;
  static final ProductService _inherentce = ProductService._init();

  static ProductService get inherentce => _inherentce;

  ProductService._init();

  Future<List<Result>> getProducts() async {
    Response res = await Dio()
        .get("${BaseApi.baseApi}products/getAll?page=$page&limit=$limit");

    // print("PRODUCTS: ${res.data}");

    if (res.statusCode == 200 || res.statusCode == 201) {
      try {
        // print("PRODUCTS: ${res.data['result']}");
        return (res.data['result'] as List)
            .map((e) => Result.fromJson(e))
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
