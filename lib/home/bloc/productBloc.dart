import 'package:foodmaniac/home/model/product.dart';
import 'package:foodmaniac/home/service/productService.dart';
import 'package:rxdart/rxdart.dart';

class ProductBloc {

  final BehaviorSubject<bool> _listController = BehaviorSubject<bool>(seedValue: true);
  Sink<bool> get listIn => _listController.sink;
  Observable<Product> product;

  ProductService service = ProductService();

  ProductBloc() {
    product = _listController.stream.asyncMap((d) => service.getProducts());
  }

  dispose() {
    _listController.close();
  }
}
