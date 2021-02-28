import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodmaniac/productAdd/addProductWidget.dart';
import 'package:foodmaniac/productList/bloc/productBloc.dart';
import 'package:foodmaniac/productList/model/infoProduct.dart';
import 'package:foodmaniac/productList/model/product.dart';
import 'package:foodmaniac/productList/view/productCell.dart';
import 'package:foodmaniac/productList/view/shoppingCart.dart';

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
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddProductWidget()),
              );
            },
            child: Icon(Icons.add),
          ),
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

                return ListView.builder(
                    itemCount: snapshop.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      InfoProduct character = snapshop.data[index];
                      return ProductCell(character, minusPressed, plusPressed);
                    });
              }),
          bottomNavigationBar: showItensBar
              ? Container(
                  color: Colors.blue,
                  height: 60,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
                          child: Text("Total: ${totalvalue}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.fromLTRB(4, 0, 8, 0),
                        child: RaisedButton(
                          child: Text(
                            'Comprar',
                            style: TextStyle(color: Colors.blue),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ShoppingCartWidget(cartList)),
                            );
                          },
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                )
              : Container(
                  height: 0,
                ),
        ));
  }
}
