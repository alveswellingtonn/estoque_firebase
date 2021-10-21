import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estoque_firebase/data/product_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estoque_firebase/screens/CadProduto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:estoque_firebase/util/Configuracoes.dart';

class Produtos extends StatefulWidget {
  @override
  _ProdutosState createState() => _ProdutosState();
}

class _ProdutosState extends State<Produtos> {

  final Stream<QuerySnapshot> _produtos =
  FirebaseFirestore.instance.collection("estoque").snapshots();

  bool pesquisar = false;

  //List<DropdownMenuItem<String>> _listaItensDropCategorias;

  //String _itemSelecionadoCategoria;

  /*_carregarItensDropdown() {
    //Categorias
    _listaItensDropCategorias = Configuracoes.getCategorias();
  }*/

  _carregarLista(text) async{
    FirebaseFirestore.instance.collection("estoque")
        .where('title', isGreaterThanOrEqualTo: "Pirelli")
        .get();

  }

  @override
  void initState() {
    super.initState();

    //_carregarItensDropdown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: !pesquisar ? Text("Produtos") :
          TextField(decoration: InputDecoration(
            icon: Icon(Icons.search, color: Colors.white,),
            hintText: "Pesquisar Produto",
            hintStyle: TextStyle(color: Colors.white)
          ),
            style: TextStyle(color: Colors.white),
            onChanged: (_){
              var pesquisa ="P" ;
              //_carregarLista(text);
              FirebaseFirestore.instance.collection("estoque")
                  .where('title', isGreaterThan: pesquisa)
                  .get();

              print(pesquisa);
            },
          ),
          centerTitle: true,
          backgroundColor: Colors.redAccent[700],
          actions: <Widget>[
            pesquisar ?
            IconButton(
              onPressed: (){
                setState(() {
                  this.pesquisar = false;
                });
              },
              icon: Icon(Icons.cancel),
            ):
             IconButton(
              onPressed: (){
                setState(() {
                  this.pesquisar = true;
                });
              },
              icon: Icon(Icons.search),
            ),
          ],


        ),
        floatingActionButton: FloatingActionButton(
          foregroundColor: Colors.white,
          child: Icon(Icons.add),
          backgroundColor: Colors.redAccent[700],
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CadastrarProduto()));
          },
        ),
        body: Container(
        padding: EdgeInsets.only(top: 20, bottom: 30, left: 16, right: 16),
           child: StreamBuilder<QuerySnapshot>(
            stream: _produtos,
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
               if(snapshot.hasError) {
                return Text("Erro ao carregar dados!");
            }
            if(snapshot.connectionState == ConnectionState.waiting) {
             return Text("Carregando");
            }
            return new ListView(
            children: snapshot.data.docs.map((DocumentSnapshot document){
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            return Card(
            color: Colors.red[50],
            child: Container(
              padding: EdgeInsets.all(12.0),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
            Text("Produto: " + data["title"]),
            Text("Descrição: " + data["description"].toString()),
             Text("Preço: " + data["preco"].toString()),
             Text("Estoque: " + data["quantidade"].toString()),
             ],
            ),
           )
          );
          }).toList(),
         );
         },
          )
        ,
        )
    );
  }

  }

