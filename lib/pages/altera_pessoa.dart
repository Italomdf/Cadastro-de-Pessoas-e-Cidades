import 'package:consumo_api/api/acesso_api.dart';
import 'package:consumo_api/model/cidade.dart';
import 'package:consumo_api/model/pessoa.dart';
import 'package:consumo_api/util/combo_cidade.dart';
import 'package:consumo_api/util/componentes.dart';
import 'package:consumo_api/util/radio_sexo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AlteraPessoa extends StatefulWidget {
  const AlteraPessoa({super.key});

  @override
  State<AlteraPessoa> createState() => _AlteraPessoaState();
}

class _AlteraPessoaState extends State<AlteraPessoa> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  TextEditingController txtNome = TextEditingController();
  TextEditingController txtSexo = TextEditingController(text: "M");
  TextEditingController txtIdade = TextEditingController();
  TextEditingController txtCidade = TextEditingController();

  home() {
    Navigator.of(context).pushReplacementNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as int;

    alterar() {
      Pessoa p = Pessoa(args, txtNome.text, txtSexo.text,
          int.parse(txtIdade.text), Cidade(int.parse(txtCidade.text), "", ""));
      AcessoApi().alteraPessoa(p.toJson(), args);
      Navigator.of(context).pushReplacementNamed('/consulta');
    }

    return Scaffold(
      appBar: Componentes().criaAppBar("Altera Pessoa", home),
      body: Form(
          key: formController,
          child: Column(
            children: [
              Icon(Icons.published_with_changes_sharp,
                  size: 150, color: Colors.amber.shade700),
              Componentes().criaRowHab("Informe o nome: ", txtNome, "Nome", 20),
              Componentes()
                  .criaRowHab("Informe a idade: ", txtIdade, "Idade", 20),
              Center(child: RadioSexo(controller: txtSexo)),
              Center(child: ComboCidade(controller: txtCidade)),
              Componentes().criaButton(formController, alterar, "alterar")
            ],
          )),
    );
  }
}
