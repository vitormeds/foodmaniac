

import 'package:dio/dio.dart';
import 'package:foodmaniac/productList/model/infoProduct.dart';
import 'package:foodmaniac/productList/model/product.dart';
import 'package:foodmaniac/utils/constants.dart';

class ProductService {

  Dio dio = Dio();

  Future<List<InfoProduct>> getProducts() async {
    Response response = await dio.get(urlListProducts);

    if(response.statusCode == 200) {
     var product = ProductElement.fromJson(response.data);
     List<InfoProduct> infoProducts = [];
     for (int i = 0; i < product.products.length; i++) {
        infoProducts.add(InfoProduct(product.products[i], 0));
      }
      return infoProducts;
    } else {
      Exception("Erro de Conexão");
    }
  }

}