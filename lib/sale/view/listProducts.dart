import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodmaniac/sale/bloc/productBloc.dart';
import 'package:foodmaniac/sale/model/infoProduct.dart';
import 'package:foodmaniac/sale/view/productCell.dart';
import 'package:foodmaniac/sale/view/productDetail.dart';
import 'package:foodmaniac/sale/view/shoppingCart.dart';
import 'package:foodmaniac/profile/view/profile.dart';

class ListProducts extends StatefulWidget {
  @override
  _ListProductsWidgetState createState() => _ListProductsWidgetState();
}

class _ListProductsWidgetState extends State<ListProducts> {
  bool showItensBar = false;
  double totalvalue = 0;
  List<InfoProduct> cartList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ProductBloc().getData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    ProductBloc().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        behavior: HitTestBehavior.translucent,
        child: Scaffold(
          body: StreamBuilder(
              stream: ProductBloc().infoProducts,
              builder: (context, AsyncSnapshot<List<InfoProduct>> snapshop) {
                if (snapshop.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (!snapshop.hasData ||
                    snapshop.hasError ||
                    snapshop.data.isEmpty) {
                  return Center(child: Text("Sem conexão"));
                }

                void updateValues() {
                  setState(() {
                    int count = 0;
                    totalvalue = 0;
                    cartList.clear();
                    for (int i = 0; i < snapshop.data.length; i++) {
                      if (snapshop.data[i].qtd > 0) {
                        cartList.add(snapshop.data[i]);
                        count = count + snapshop.data[i].qtd;
                        totalvalue = totalvalue +
                            (snapshop.data[i].qtd *
                                snapshop.data[i].product.price);
                      }
                    }
                    if (count > 0) {
                      showItensBar = true;
                    } else {
                      showItensBar = false;
                    }
                  });
                }

                void minusPressed(InfoProduct character) {
                  updateValues();
                }

                void plusPressed(InfoProduct character) {
                  updateValues();
                }

                void addProduct(InfoProduct product) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductDetailWidget(product)),
                  );
                }

                return ListView.builder(
                    itemCount: snapshop.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      InfoProduct product = snapshop.data[index];
                      return GestureDetector(
                      child: ProductCell(product),
                        onTap: () {
                          addProduct(product);
                        },
                      );
                    });
              }),
        ));
  }
}
