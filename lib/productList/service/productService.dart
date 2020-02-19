

import 'package:dio/dio.dart';
import 'package:foodmaniac/productList/model/product.dart';
import 'package:foodmaniac/utils/constants.dart';

class ProductService {

  Dio dio = Dio();

  Future<ProductElement> getProducts() async {
    Response response = await dio.get(urlListProducts);

    if(response.statusCode == 200) {
      return ProductElement.fromJson(response.data);
    } else {
      Exception("Erro de Conexão");
    }
  }

}