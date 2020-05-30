import 'dart:convert';
import 'package:foodmaniac/productList/model/infoProduct.dart';
import 'package:foodmaniac/productList/model/product.dart';
import 'package:foodmaniac/utils/constants.dart';
import 'package:http/http.dart' as http;

class ProductService {
  Future<List<InfoProduct>> getProducts() async {
    final response = await http.get(urlListProducts);

    if (response.statusCode == 200) {
      var product = ProductElement.fromJson(json.decode(response.body));
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
