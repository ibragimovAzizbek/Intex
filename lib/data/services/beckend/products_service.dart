import 'package:dio/dio.dart';
import 'package:intex/data/model/products_model.dart';

import '../../../core/base/base_api.dart';

class ProductService {
  static final ProductService _inherentce = ProductService._init();

  static ProductService get inherentce => _inherentce;

  ProductService._init();

  Future<List<ProductsModel>> getProducts() async {
    Response res = await Dio().get("${BaseApi.baseApi}product/getAll");

    print("STATUS CODE: Products");

    if (res.statusCode == 200) {
      try {
        return (res.data as List)
            .map((e) => ProductsModel.fromJson(e))
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
