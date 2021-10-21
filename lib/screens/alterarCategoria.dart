import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:validadores/Validador.dart';

class alterarCategoria extends StatefulWidget {

  @override
  _alterarCategoriaState createState() => _alterarCategoriaState();
}

class _alterarCategoriaState extends State<alterarCategoria> {

  TextEditingController _categoriaController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  /*String _categoria;
  String _mensagem = "";*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Cadastrar Categoria"),
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
              children: <Widget> [
                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 80.0, bottom: 100.0),
                  child: TextFormField(
                    autofocus: true,
                    controller: _categoriaController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: new BorderRadius.circular(15.0)),
                      hintText: "Digite a Categoria",
                      labelText: "Nome da categoria",
                    ),
                    validator: (valor){

                      return Validador()
                          .add(Validar.OBRIGATORIO, msg: "Campo obrigtório").valido(valor);
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
                      //salvar dados no firebase
                      /*setState(() {
                        _categoria = _categoriaController.text;
                      });*/
                      FirebaseFirestore db = FirebaseFirestore.instance;
                      db.collection("estoque").doc().set({"title" : _categoriaController.text});
                      //DocumentReference ref = await db.collection("estoque").add({"title": _categoriaController.text});
                      //print("Item salvo: " + ref.id);
                      Navigator.pop(context);
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
