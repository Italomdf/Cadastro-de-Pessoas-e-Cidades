import 'package:consumo_api/api/acesso_api.dart';
import 'package:consumo_api/model/cidade.dart';
import 'package:consumo_api/util/componentes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AlteraCidade extends StatefulWidget {
  const AlteraCidade({super.key});

  @override
  State<AlteraCidade> createState() => _AlteraCidadeState();
}

class _AlteraCidadeState extends State<AlteraCidade> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  TextEditingController txtNome = TextEditingController();
  TextEditingController txtUf = TextEditingController();

  home() {
    Navigator.of(context).pushReplacementNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as int;
    alterar() {
      Cidade c = Cidade(args, txtNome.text, txtUf.text);
      AcessoApi().alteraCidade(c.toJson(), args);
      Navigator.of(context).pushReplacementNamed('/consultaCidade');
    }

    return Scaffold(
      appBar: Componentes().criaAppBar("Alterar Cidade", home),
      body: Form(
          key: formController,
          child: Column(
            children: [
              Icon(Icons.published_with_changes_sharp,
                  size: 150, color: Colors.amber.shade700),
              Componentes().criaRowHab("Informe o nome: ", txtNome, "Nome", 20),
              Componentes().criaRowHab("Informe o Estado: ", txtUf, "Uf", 20),
              Componentes().criaButton(formController, alterar, "Alterar")
            ],
          )),
    );
  }
}
