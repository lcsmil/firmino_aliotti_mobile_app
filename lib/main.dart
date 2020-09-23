import 'package:firmino_aliotti/paginas/adicionar_cliente.dart';
import 'package:flutter/material.dart';
import 'package:firmino_aliotti/paginas/home.dart';
import 'package:firmino_aliotti/paginas/loading.dart';
import 'package:firmino_aliotti/paginas/lista_clientes.dart';
import 'cards_clientes.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/listadeclientes': (context) => Listadeclientes(),
      '/adicionarcliente': (context) => AdicionarCliente(),
    }, /*home: Listadeclientes()*/
  ));
}
