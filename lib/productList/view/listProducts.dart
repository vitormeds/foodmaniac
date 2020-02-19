import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodmaniac/productAdd/addProductWidget.dart';
import 'package:foodmaniac/productList/bloc/productBloc.dart';
import 'package:foodmaniac/productList/model/infoProduct.dart';
import 'package:foodmaniac/productList/model/product.dart';
import 'package:foodmaniac/productList/view/productCell.dart';

class ListProducts extends StatefulWidget {
  @override
  _ListProductsWidgetState createState() => _ListProductsWidgetState();
}

class _ListProductsWidgetState extends State<ListProducts> {
  bool showItensBar = false;
  List<InfoProduct> infoProducts = [];
  double totalvalue = 0;

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
          appBar: AppBar(
            title: Text("Food Maniac"),
          ),
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
              stream: ProductBloc().product,
              builder: (context, AsyncSnapshot<ProductElement> snapshop) {
                if (snapshop.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (!snapshop.hasData ||
                    snapshop.hasError ||
                    snapshop.data.products.isEmpty) {
                  return Center(child: Text("Sem conexão"));
                }

                List<Product> characters = snapshop.data.products;
                for (int i = 0; i < characters.length; i++) {
                  infoProducts.add(InfoProduct(characters[i], 0));
                }

                return ListView.builder(
                    itemCount: infoProducts.length,
                    itemBuilder: (BuildContext context, int index) {
                      InfoProduct character = infoProducts[index];
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
                          onPressed: () {},
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

  void minusPressed(InfoProduct character) {
    updateValues();
  }

  void plusPressed(InfoProduct character) {
    updateValues();
  }

  void updateValues() {
    setState(() {
      int count = 0;
      totalvalue = 0;
      for (int i = 0; i < infoProducts.length; i++) {
        count = count + infoProducts[i].qtd;
        totalvalue = totalvalue + (infoProducts[i].qtd * infoProducts[i].value);
      }
      if (count > 0) {
        showItensBar = true;
      } else {
        showItensBar = false;
      }
    });
  }
}