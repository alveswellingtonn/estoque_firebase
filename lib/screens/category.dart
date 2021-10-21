import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cadCategoria.dart';
import 'produtoCategoria.dart';


class CategoriasPage extends StatefulWidget {

  @override
  _CategoriasPageState createState() => _CategoriasPageState();
}

class _CategoriasPageState extends State<CategoriasPage> {

  TextEditingController _alterarCategoria = TextEditingController();

  final Stream<QuerySnapshot> _categoria = FirebaseFirestore.instance.collection("produtos").snapshots();
  //final Stream documentSnapshot = FirebaseFirestore.instance.collection("estoque").doc('2stgxJqwNs6ohWeLOhBM').snapshots();
  //final Stream<QuerySnapshot> _categoria = FirebaseFirestore.instance.collection("estoque").doc("${FieldPath.documentId}").collection("items").snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categorias"),
        centerTitle: true,
        backgroundColor: Colors.redAccent[700],
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        child: Icon(Icons.add), backgroundColor: Colors.redAccent[700],
        onPressed: (){
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => cadCategoria())
          );
        },
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20, bottom: 20, left: 16, right: 16),
        child: StreamBuilder<QuerySnapshot>(
          stream: _categoria,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            if(snapshot.hasError) {
              return Text("Erro ao carregar lista");
            }
            if(snapshot.connectionState == ConnectionState.waiting) {
              return Text("Carregando");
            }
            return new ListView (
              children: snapshot.data.docs.map((DocumentSnapshot document){
                Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                return Card(
                  color: Colors.red[50],
                  child: ListTile(
                    onTap: (){
                       /* FirebaseFirestore db = FirebaseFirestore.instance;

                        QuerySnapshot querySnapshot = await db.collection("estoque")
                        .where("items", isEqualTo: document.id)
                        .get();

                        for ( DocumentSnapshot item in querySnapshot.docs){
                          var dados = item.data();
                          print("filtro categoria: ${dados}" );
                        }*/


                        /*db.collection("estoque").doc().collection("items")
                        .doc().set(
                        {"title": "home"});*/

                      /*FirebaseFirestore db = FirebaseFirestore.instance;
                      Stream<QuerySnapshot<Map<String, dynamic>>> ref = db.collection("estoque").doc(document.id).collection("items").snapshots();
                      print("dados exibido: "+ ref.toList().toString());*/
                    },
                    title: new Text(data["title"]),
                    onLongPress: (){
                      return showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text("Deseja atualizar ou excluir a categoria?"),
                            content: TextField(
                              controller: _alterarCategoria,
                              decoration: InputDecoration(
                                  hintText: "Nova Categoria",
                                  border: OutlineInputBorder(borderRadius: new BorderRadius.circular(15.0)),
                                  labelText: "Nome da categoria"),
                            ),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: (){
                                    FirebaseFirestore db = FirebaseFirestore.instance;
                                    db.collection("produtos").doc(document.id).delete();
                                    Navigator.pop(context);
                                  },
                                  child: Text('Deletar')),
                              TextButton(
                                  onPressed: (){Navigator.pop(context);},
                                  child: Text('Cancelar')),
                              TextButton(
                                  onPressed: (){
                                    FirebaseFirestore db = FirebaseFirestore.instance;
                                    db.collection("produtos").doc(document.id).set({"title" : _alterarCategoria.text});
                                    Navigator.pop(context);
                                    _alterarCategoria.clear();
                                  },
                                  child: Text('Atualizar')),
                            ],
                          )
                      );

                      /* deletar
                      FirebaseFirestore db = FirebaseFirestore.instance;
                      db.collection("estoque").doc(document.id).delete();*/

                      /*atualizar
                      FirebaseFirestore db = FirebaseFirestore.instance;
                      db.collection("estoque").doc(document.id).set({"title" : "Acessórios"});*/
                    },
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
