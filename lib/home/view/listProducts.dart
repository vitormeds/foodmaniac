import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodmaniac/addProductWidget.dart';
import 'package:foodmaniac/home/bloc/productBloc.dart';
import 'package:foodmaniac/home/model/product.dart';
import 'package:foodmaniac/home/view/addComponent.dart';
import 'package:foodmaniac/home/view/productCell.dart';

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
                      return ProductCell(character, minusPressed, plusPressed);
                    });
              }),
        ));
  }

  void minusPressed(Result character, int qtd) {
    print("-");
  }

  void plusPressed(Result character, int qtd) {
    print("+");
  }
}
