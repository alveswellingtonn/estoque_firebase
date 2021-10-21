import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Produtos.dart';
import 'category.dart';

class Home extends StatelessWidget {

  final DocumentSnapshot documentSnapshot;

  const Home({Key key, this.documentSnapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controle Estoque'),
        centerTitle: true,
        backgroundColor: Colors.redAccent[700]
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 15),
            child: Text("Vendas realizadas",),
          ),
          SizedBox(
            width: 400,
            height: 100,
            child: Card(
                margin: EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 10),
                color: Colors.red[50],
                child: ListTile(
                  title: Text("Venda", style: TextStyle(color: Colors.red[900],
                      fontWeight: FontWeight.bold, fontSize: 22.0),
                  ),
                  subtitle: Text("teste", style: TextStyle(color: Colors.red[900],
                      fontSize: 16.0),
                  ),
                )
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 150,
                child: Card(
                    margin: EdgeInsets.only(top: 10, left: 10, right: 5),
                    color: Colors.red[50],
                    child: ListTile(
                      title: Text("Categoria", style: TextStyle(color: Colors.red[900],
                          fontWeight: FontWeight.bold, fontSize: 22.0),
                      ),
                      subtitle: Text("teste", style: TextStyle(color: Colors.red[900],
                          fontSize: 16.0),
                      ),
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => CategoriasPage())
                        );
                      },
                    )
                ),
              ),
              SizedBox(
                width: 200,
                height: 150,
                child: Card(
                    margin: EdgeInsets.only(top: 10, left: 5, right: 10),
                    color: Colors.red[50],
                    child: ListTile(
                      onTap: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Produtos())
                        );
                      },
                      title: Text("Estoque", style: TextStyle(color: Colors.red[900], fontWeight: FontWeight.bold, fontSize: 22.0),),
                      subtitle: Text("teste", style: TextStyle(color: Colors.red[900], fontSize: 16.0),),
                    )
                ),
              )
            ],
          )
        ],
      )
    );
  }
}

