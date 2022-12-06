import 'package:consumo_api/api/acesso_api.dart';
import 'package:consumo_api/model/cidade.dart';
import 'package:consumo_api/model/pessoa.dart';
import 'package:consumo_api/util/combo_cidade.dart';
import 'package:consumo_api/util/componentes.dart';
import 'package:consumo_api/util/radio_sexo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  TextEditingController txtNome = TextEditingController();
  TextEditingController txtSexo = TextEditingController(text: "M");
  TextEditingController txtIdade = TextEditingController();
  TextEditingController txtCidade = TextEditingController();

  @override
  Widget build(BuildContext context) {
    cadastrar() {
      Pessoa p = Pessoa(0, txtNome.text, txtSexo.text, int.parse(txtIdade.text),
          Cidade(int.parse(txtCidade.text), "", ""));
      AcessoApi().inserePessoa(p.toJson());
      Navigator.of(context).pushReplacementNamed('/consulta');
    }

    home() {
      Navigator.of(context).pushReplacementNamed('/home');
    }

    return Scaffold(
      appBar: Componentes().criaAppBar("Cadastrar Pessoa", home),
      body: Form(
          key: formController,
          child: Column(
            children: [
              Icon(Icons.person_add, size: 150, color: Colors.amber.shade700),
              Componentes().criaRowHab("Informe o nome: ", txtNome, "Nome", 20),
              Componentes()
                  .criaRowHab("Informe a idade: ", txtIdade, "Idade", 20),
              Center(child: RadioSexo(controller: txtSexo)),
              Center(child: ComboCidade(controller: txtCidade)),
              Componentes().criaButton(formController, cadastrar, "cadastrar")
            ],
          )),
    );
  }
}
