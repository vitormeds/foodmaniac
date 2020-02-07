import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodmaniac/home/model/product.dart';
import 'package:foodmaniac/home/view/addComponent.dart';

class ProductCell extends StatelessWidget {
  ProductCell(this.character, this.minusPressed, this.plusPressed);

  Result character;
  Function(Result character) minusPressed;
  Function(Result character) plusPressed;

  AddComponent addComponent;

  @override
  Widget build(BuildContext context) {
    addComponent = AddComponent(
        value: 0, minusPressed: actionMinusPressed, plusPressed: actionPlusPressed);
    return Container(
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
          Container(
              child: CachedNetworkImage(
            placeholder: (context, url) => CircularProgressIndicator(),
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
            child: addComponent,
            alignment: Alignment.centerRight,
          )
        ]));
  }

  void actionMinusPressed() {
    minusPressed(character);
  }

  void actionPlusPressed() {
    plusPressed(character);
  }
}
