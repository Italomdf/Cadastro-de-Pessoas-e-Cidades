import 'package:consumo_api/api/acesso_api.dart';
import 'package:consumo_api/model/cidade.dart';
import 'package:consumo_api/util/componentes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DeletaCidade extends StatefulWidget {
  const DeletaCidade({super.key});

  @override
  State<DeletaCidade> createState() => _DeletaCidadeState();
}

class _DeletaCidadeState extends State<DeletaCidade> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  TextEditingController txtId = TextEditingController();

  deletar() {
    AcessoApi().deletaCidade(int.parse(txtId.text));
    Navigator.of(context).pushReplacementNamed('/consultaCidade');
  }

  home() {
    Navigator.of(context).pushReplacementNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Componentes().criaAppBar("Deletar Cidade", home),
      body: Form(
          key: formController,
          child: Column(
            children: [
              Componentes().criaRowHab("Informe o Id: ", txtId, "Id", 20),
              Componentes().criaButton(formController, deletar, "Deletar")
            ],
          )),
    );
  }
}
