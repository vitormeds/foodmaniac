import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodmaniac/sale/model/infoProduct.dart';
import 'package:foodmaniac/sale/view/addComponent.dart';
import 'package:foodmaniac/utils/constants.dart';

class ProductCell extends StatefulWidget {
  @override
  _ProductCellWidgetState createState() => _ProductCellWidgetState(
      this.character);

  ProductCell(this.character);
  InfoProduct character;
}

class _ProductCellWidgetState extends State<ProductCell> {
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

  _ProductCellWidgetState(this.character);

  InfoProduct character;

  AddComponent addComponent;

  @override
  Widget build(BuildContext context) {

    return Container(
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
          Container(
              child: CachedNetworkImage (
            placeholder: (context, url) => CircularProgressIndicator(),
            imageUrl: baseImageUrl + character.product.image,
            height: 50,
            width: 50,
            alignment: Alignment.centerLeft,
          )),
          Expanded(
              child: Container(
            margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
            child: Column(
              children: <Widget>[
                Text(character.product.name,
                    style: TextStyle(fontSize: 14),
                    overflow: TextOverflow.ellipsis),
                Text(character.product.description,
                    style: TextStyle(fontSize: 14),
                    overflow: TextOverflow.ellipsis)
              ],
            ),
            alignment: Alignment.center,
          ))
        ]));
  }
}
