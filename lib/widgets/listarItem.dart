import 'package:flutter/material.dart';

class ListaItem extends StatelessWidget {
  //const ListaItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Card(
        child: Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 16, right: 16),
          child: ListTile(
            title: Text("TESTE"),
          )
        ),
      ),
    );
  }
}
