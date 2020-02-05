import 'package:dio/dio.dart';
import 'package:foodmaniac/home/model/product.dart';
import 'package:foodmaniac/utils/constants.dart';

class ProductService {

  Dio dio = Dio();

  Future<Product> getProducts() async {
    Response response = await dio.get(url);

    if(response.statusCode == 200) {
      return Product.fromJson(response.data);
    } else {
      Exception("Erro de Conexão");
    }
  }

}