import 'package:consumo_api/api/acesso_api.dart';
import 'package:consumo_api/util/componentes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DeletaCliente extends StatefulWidget {
  const DeletaCliente({super.key});

  @override
  State<DeletaCliente> createState() => _DeletaClienteState();
}

class _DeletaClienteState extends State<DeletaCliente> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  TextEditingController txtId = TextEditingController();

  deletar() {
    AcessoApi().deletaCliente(int.parse(txtId.text));
    Navigator.of(context).pushReplacementNamed('/consulta');
  }

  home() {
    Navigator.of(context).pushReplacementNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Componentes().criaAppBar("Deletar Cliente", home),
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
