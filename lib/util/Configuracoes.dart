import 'package:flutter/material.dart';

class Configuracoes {

  static List<DropdownMenuItem<String>> getCategorias() {
    List<DropdownMenuItem<String>> itensDropCategorias = [];

    //Categorias
    itensDropCategorias.add(
        DropdownMenuItem(child: Text(
          "Categoria", style: TextStyle(
            color: Color(0xff9c27b0)
        ),
        ), value: null,)
    );

    itensDropCategorias.add(
        DropdownMenuItem(child: Text("Automóvel"), value: "auto",)
    );

    itensDropCategorias.add(
        DropdownMenuItem(child: Text("Imóvel"), value: "imovel",)
    );

    itensDropCategorias.add(
        DropdownMenuItem(child: Text("Eletrônicos"), value: "eletro",)
    );

    itensDropCategorias.add(
        DropdownMenuItem(child: Text("Moda"), value: "moda",)
    );

    itensDropCategorias.add(
        DropdownMenuItem(child: Text("Esportes"), value: "esportes",)
    );

    return itensDropCategorias;
  }

   List<DropdownMenuItem<String>> getProdutos() {
    List<DropdownMenuItem<String>> itensDropProdutos = [];

    //Categorias
    itensDropProdutos.add(
        DropdownMenuItem(child: Text(
          "Categoria", style: TextStyle(
            color: Color(0xff9c27b0)
        ),
        ), value: null,)
    );

    StreamBuilder();


    return itensDropProdutos;
  }
}