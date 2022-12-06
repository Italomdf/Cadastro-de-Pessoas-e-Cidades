import 'package:consumo_api/pages/consulta_cidades.dart';
import 'package:consumo_api/util/componentes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    home() {
      Navigator.of(context).pushReplacementNamed('/home');
    }

    cadastro() {
      Navigator.of(context).pushReplacementNamed('/cadastro');
    }

    consulta() {
      Navigator.of(context).pushReplacementNamed('/consulta');
    }

    consultaCidade() {
      Navigator.of(context).pushReplacementNamed('/consultaCidade');
    }

    cadstroCidade() {
      Navigator.of(context).pushReplacementNamed('/cadastroCidade');
    }

    deletaCidade() {
      Navigator.of(context).pushReplacementNamed('/deletaCidade');
    }

    deletaCliente() {
      Navigator.of(context).pushReplacementNamed('/deletaCliente');
    }

    alteraCidade() {
      Navigator.of(context).pushReplacementNamed('/alteraCidade');
    }

    alteraPessoa() {
      Navigator.of(context).pushReplacementNamed('/alteraPessoa');
    }

    return Scaffold(
      appBar: Componentes().criaAppBar("Consumo API", null),
      body: Form(
        key: formController,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.post_add_rounded,
                  size: 150, color: Colors.amber.shade700),
              Componentes()
                  .criaButton(formController, cadastro, "Cadastro de Pessoa"),
              Componentes().criaButton(
                  formController, cadstroCidade, "Cadastro de Cidade"),
              Icon(Icons.change_circle_outlined,
                  size: 150, color: Colors.amber.shade700),
              Componentes()
                  .criaButton(formController, consulta, "Consulta de Pessoas"),
              Componentes().criaButton(
                  formController, consultaCidade, "Consulta de Cidades"),
            ],
          ),
        ),
      ),
    );
  }
}
