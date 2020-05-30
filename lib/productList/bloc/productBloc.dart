

import 'package:foodmaniac/productList/model/infoProduct.dart';
import 'package:foodmaniac/productList/model/product.dart';
import 'package:foodmaniac/productList/service/productService.dart';
import 'package:rxdart/rxdart.dart';

class ProductBloc {
  static final ProductBloc _singleton = ProductBloc._internal();

  factory ProductBloc() {
    return _singleton;
  }

  ProductBloc._internal();
  
  final BehaviorSubject<bool> _listController = BehaviorSubject<bool>(seedValue: true);
  Sink<bool> get listIn => _listController.sink;
  Observable<List<InfoProduct>> infoProducts;
  ProductService service = ProductService();
  
  getData(){
    infoProducts = _listController.stream.asyncMap((d) => service.getProducts());
  }

  dispose() {
    _listController.close();
  }
}