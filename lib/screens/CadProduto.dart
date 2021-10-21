import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:validadores/Validador.dart';

class CadastrarProduto extends StatefulWidget {
  //const CadastrarProduto({Key key}) : super(key: key);

  @override
  _CadastrarProdutoState createState() => _CadastrarProdutoState();
}

class _CadastrarProdutoState extends State<CadastrarProduto> {

  TextEditingController _categoriaController = TextEditingController();
  TextEditingController _descricaoController = TextEditingController();
  TextEditingController _precoController = TextEditingController();
  TextEditingController _quantidadeController = TextEditingController();
  TextEditingController _titleController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar Produto"),
        centerTitle: true,
        backgroundColor: Colors.redAccent[700],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0, bottom: 30.0),
                  child: TextFormField(
                    controller: _categoriaController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: new BorderRadius.circular(15.0)),
                      hintText: "Digite a Categoria",
                      labelText: "Categoria",
                    ),
                    validator: (valor){
                      return Validador()
                          .add(Validar.OBRIGATORIO, msg: "Campo Obrigatório").valido(valor);
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30.0),
                  child: TextFormField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: new BorderRadius.circular(15.0)),
                      hintText: "Digite o nome do produto",
                      labelText: "Produto",
                    ),
                    validator: (valor){
                      return Validador()
                          .add(Validar.OBRIGATORIO, msg: "Campo Obrigatório").valido(valor);
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30.0),
                  child: TextFormField(
                    controller: _descricaoController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: new BorderRadius.circular(15.0)),
                      hintText: "Digite a Descrição",
                      labelText: "Descrição",
                    ),
                    validator: (valor){
                      return Validador()
                          .add(Validar.OBRIGATORIO, msg: "Campo Obrigatório").valido(valor);
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _precoController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: new BorderRadius.circular(15.0)),
                      hintText: "Digite o Preço",
                      labelText: "Preço",
                    ),
                    validator: (valor){
                      return Validador()
                          .add(Validar.OBRIGATORIO, msg: "Campo Obrigatório").valido(valor);
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _quantidadeController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: new BorderRadius.circular(15.0)),
                      hintText: "Digite a Quantidade",
                      labelText: "Quantidade",
                    ),
                    validator: (valor){
                      return Validador()
                          .add(Validar.OBRIGATORIO, msg: "Campo Obrigatório").valido(valor);
                    },
                  ),
                ),
                RaisedButton(
                  child: Text("Salvar", style: TextStyle(fontSize: 20), ),
                  textColor: Colors.white,
                  color: Colors.redAccent[700],
                  padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                  onPressed: () async {
                    if(_formKey.currentState.validate()){
                      FirebaseFirestore db = FirebaseFirestore.instance;
                       await db.collection("estoque")
                          .add({
                        "categoria": _categoriaController.text,
                        "title": _titleController.text,
                        "description": _descricaoController.text,
                        "preco": _precoController.text,
                        "quantidade": _quantidadeController.text
                          });
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
