import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodmaniac/addProductWidget.dart';
import 'package:foodmaniac/home/bloc/productBloc.dart';
import 'package:foodmaniac/home/model/product.dart';

class ListProducts extends StatefulWidget {
  @override
  _ListProductsWidgetState createState() => _ListProductsWidgetState();
}

class _ListProductsWidgetState extends State<ListProducts> {
  ProductBloc bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = ProductBloc();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          stream: bloc.product,
          builder: (context, AsyncSnapshot<Product> snapshop) {
            if (snapshop.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (!snapshop.hasData ||
                snapshop.hasError ||
                snapshop.data.results.isEmpty) {
              return Center(child: Text("Sem conexão"));
            }

            List<Result> characters = snapshop.data.results;

            return ListView.builder(
                itemCount: characters.length,
                itemBuilder: (BuildContext context, int index) {
                  Result character = characters[index];
                  return Container(
                      width: 50,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                child: CachedNetworkImage(
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              imageUrl: character.image,
                              height: 50,
                              width: 50,
                              alignment: Alignment.centerLeft,
                            )),
                            Expanded(
                                child: Container(
                              margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
                              child: Column(
                                children: <Widget>[
                                  Text(character.name,
                                      style: TextStyle(fontSize: 14),
                                      overflow: TextOverflow.ellipsis),
                                  Text(character.species,
                                      style: TextStyle(fontSize: 14),
                                      overflow: TextOverflow.ellipsis)
                                ],
                              ),
                              alignment: Alignment.center,
                            )),
                            Container(
                              child: Row(children: <Widget>[
                                Container(
                                    margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
                                    alignment: Alignment.centerLeft,
                                    width: 40,
                                    child: RawMaterialButton(
                                      onPressed: () {},
                                      child: new Icon(
                                        Icons.add,
                                        color: Colors.blue,
                                        size: 2.0,
                                      ),
                                      shape: new CircleBorder(),
                                      elevation: 2.0,
                                      fillColor: Colors.white,
                                    )),
                                Container(
                                  alignment: Alignment.center,
                                  width: 20,
                                  child: Text("0"),
                                ),
                                Container(
                                    margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
                                    alignment: Alignment.centerRight,
                                    width: 40,
                                    child: RawMaterialButton(
                                      onPressed: () {},
                                      child: new Icon(
                                        Icons.minimize,
                                        color: Colors.blue,
                                        size: 2.0,
                                      ),
                                      shape: new CircleBorder(),
                                      elevation: 2.0,
                                      fillColor: Colors.white,
                                    ))
                              ]),
                              alignment: Alignment.centerRight,
                            )
                          ]));
                });
          }),
    );
  }
}
