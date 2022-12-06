import 'package:consumo_api/pages/altera_cidade.dart';
import 'package:consumo_api/pages/altera_pessoa.dart';
import 'package:consumo_api/pages/cadastro.dart';
import 'package:consumo_api/pages/cadastro_cidade.dart';
import 'package:consumo_api/pages/consulta.dart';
import 'package:consumo_api/pages/consulta_cidades.dart';
import 'package:consumo_api/pages/deleta_cidade.dart';
import 'package:consumo_api/pages/deleta_cliente.dart';
import 'package:consumo_api/pages/home.dart';
import 'package:consumo_api/util/tema.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Tema().criaTema(),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const Home(),
        '/consulta': (context) => const Consulta(),
        '/consultaCidade': (context) => const ConsultaCidade(),
        '/cadastro': (context) => const Cadastro(),
        '/cadastroCidade': (context) => const CadastroCidade(),
        '/deletaCidade': (context) => const DeletaCidade(),
        '/deletaCliente': (context) => const DeletaCliente(),
        '/alteraCidade': (context) => const AlteraCidade(),
        '/alteraPessoa': (context) => const AlteraPessoa(),
      },
    );
  }
}
