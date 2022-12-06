import 'package:consumo_api/api/acesso_api.dart';
import 'package:consumo_api/model/cidade.dart';
import 'package:consumo_api/util/combo_cidade.dart';
import 'package:consumo_api/util/componentes.dart';
import 'package:consumo_api/util/radio_sexo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CadastroCidade extends StatefulWidget {
  const CadastroCidade({super.key});

  @override
  State<CadastroCidade> createState() => _CadastroCidadeState();
}

class _CadastroCidadeState extends State<CadastroCidade> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  TextEditingController txtNome = TextEditingController();
  TextEditingController txtUf = TextEditingController();

  cadastrar() {
    Cidade c = Cidade(0, txtNome.text, txtUf.text);
    AcessoApi().insereCidade(c.toJson());
    Navigator.of(context).pushReplacementNamed('/consultaCidade');
  }

  home() {
    Navigator.of(context).pushReplacementNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Componentes().criaAppBar("Cadastrar Cidade", home),
      body: Form(
          key: formController,
          child: Column(
            children: [
              Icon(Icons.location_city_sharp,
                  size: 150, color: Colors.amber.shade700),
              Componentes().criaRowHab("Informe o nome: ", txtNome, "Nome", 20),
              Componentes().criaRowHab("Informe o Estado: ", txtUf, "Uf", 20),
              Componentes().criaButton(formController, cadastrar, "Cadastrar")
            ],
          )),
    );
  }
}
