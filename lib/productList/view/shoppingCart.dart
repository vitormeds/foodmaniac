
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodmaniac/productList/model/infoProduct.dart';

class ShoppingCartWidget extends StatefulWidget {
  @override
  _ShoppingCartWidgetState createState() => _ShoppingCartWidgetState(this.cartList);

  ShoppingCartWidget(this.cartList);
  List<InfoProduct> cartList;
}

class _ShoppingCartWidgetState extends State<ShoppingCartWidget> {
  List<InfoProduct> cartList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  _ShoppingCartWidgetState(this.cartList);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Cart"),),

      body: ListView.builder(
          itemCount: cartList.length,
          itemBuilder: (BuildContext context, int index) {
            return Text(cartList[index].product.name);
          }),
    );
  }
}
