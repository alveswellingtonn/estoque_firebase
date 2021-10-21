import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData {

  String category;

  String id;
  String title;
  String description;

  int quantidade;
  double price;

  ProductData({List<DocumentSnapshot<Object>> anuncio});

  ProductData.fromDocument(DocumentSnapshot documentSnapshot){
    /*id = snapshot.id;
    title = snapshot.data();
    description = snapshot.data();
    price = snapshot.data();
    quantidade = snapshot.data();*/
    this.id = documentSnapshot.id;
    this.description = documentSnapshot["description"];
    this.title = documentSnapshot["title"];
    this.quantidade = documentSnapshot["quantidade"];
    this.price = documentSnapshot["price"] + 0.0;
  }

  Map<String, dynamic> toResumeMap(){
    return {
      /*"title": title,
      "description": description*/
      "id" : this.id,
      "title": this.title,
      "description": this.description,
      "quantidade": this.quantidade,
      "preco": this.price
    };
  }
}