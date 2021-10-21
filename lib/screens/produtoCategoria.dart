import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Produtos extends StatelessWidget {

  final DocumentSnapshot snapshot;
  Produtos(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Produtos"),
        centerTitle: true,
        backgroundColor: Colors.redAccent[700],
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        child: Icon(Icons.add), backgroundColor: Colors.redAccent[700],
        onPressed: ()async{
          FirebaseFirestore db = FirebaseFirestore.instance;

          QuerySnapshot querySnapshot = await db.collection("estoque").get();

          for ( DocumentSnapshot item in querySnapshot.docs){
            var dados = item.data();
            print("filtro categoria: ${dados}" );
          }
          /*db.collection("estoque").doc().collection("items")
              .doc().set(
              {"title": "home"});*/
        },
      ),
      body: Container(color: Colors.brown,),
    );
  }
}
