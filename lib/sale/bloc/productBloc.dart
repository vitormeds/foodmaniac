
import 'package:foodmaniac/sale/model/infoProduct.dart';
import 'package:foodmaniac/sale/service/productService.dart';
import 'package:rxdart/rxdart.dart';

class ProductBloc {
  static final ProductBloc _singleton = ProductBloc._internal();

  factory ProductBloc() {
    return _singleton;
  }

  ProductBloc._internal();

  final BehaviorSubject<bool> _listController =
      BehaviorSubject<bool>.seeded(true);
  Sink<bool> get listIn => _listController.sink;
  Stream<List<InfoProduct>> infoProducts;
  ProductService service = ProductService();

  getData() {
    infoProducts =
        _listController.stream.asyncMap((d) => service.getProducts());
  }

  dispose() {
    _listController.close();
  }
}
