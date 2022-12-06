import 'package:consumo_api/api/acesso_api.dart';
import 'package:consumo_api/model/pessoa.dart';
import 'package:consumo_api/util/combo_cidade.dart';
import 'package:consumo_api/util/componentes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Consulta extends StatefulWidget {
  const Consulta({super.key});

  @override
  State<Consulta> createState() => _ConsultaState();
}

class _ConsultaState extends State<Consulta> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  TextEditingController txtCidade = TextEditingController();

  List<Pessoa> lista = [];

  @override
  Widget build(BuildContext context) {
    home() {
      Navigator.of(context).pushReplacementNamed('/home');
    }

    listarTodas() async {
      List<Pessoa> pessoas = await AcessoApi().listaPessoas();
      setState(() {
        lista = pessoas;
      });
    }

    deletarPessoa(Pessoa pessoa, context) {
      AcessoApi().deletaCliente(pessoa.id);
      Navigator.pushReplacementNamed(context, '/consulta');
      listarTodas();
    }

    alterarPessoa(Pessoa pessoa, context) {
      Navigator.pushReplacementNamed(context, '/alteraPessoa',
          arguments: pessoa.id);
    }

    listarPorCidade() async {
      List<Pessoa> pessoas = await AcessoApi().listaPorCidade(txtCidade.text);
      setState(() {
        lista = pessoas;
      });
    }

    return Scaffold(
      appBar: Componentes().criaAppBar("Consulta de Pessoas", home),
      body: Form(
        key: formController,
        child: Column(
          children: [
            Icon(Icons.person_search_rounded,
                size: 150, color: Colors.amber.shade700),
            Componentes()
                .criaButton(formController, listarTodas, "Listar Todas"),
            Center(child: ComboCidade(controller: txtCidade)),
            Componentes().criaButton(
                formController, listarPorCidade, "Filtrar por Cidade"),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: lista.length,
                  itemBuilder: (context, indice) {
                    return Card(
                      color: Colors.amber.shade700,
                      elevation: 6,
                      margin: const EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Componentes().criaItemPessoa(lista[indice]),
                          SizedBox(
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  maximumSize: MaterialStateProperty.all(
                                      Size(double.infinity, 50)),
                                  minimumSize: MaterialStateProperty.all(
                                      Size(double.infinity, 0)),
                                  backgroundColor:
                                      MaterialStatePropertyAll<Color>(
                                          Colors.blueGrey.shade700),
                                ),
                                onPressed: () {
                                  if (formController.currentState!.validate()) {
                                    alterarPessoa(lista[indice], context);
                                  }
                                },
                                child: Text(
                                  "Alterar",
                                  style: TextStyle(
                                    color: Colors.amber.shade700,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  maximumSize: MaterialStateProperty.all(
                                      const Size(double.infinity, 50)),
                                  minimumSize: MaterialStateProperty.all(
                                      const Size(double.infinity, 0)),
                                  backgroundColor:
                                      const MaterialStatePropertyAll<Color>(
                                          Colors.red),
                                ),
                                onPressed: () {
                                  if (formController.currentState!.validate()) {
                                    deletarPessoa(lista[indice], context);
                                  }
                                },
                                child: Text(
                                  "Deletar",
                                  style: TextStyle(
                                    color: Colors.blueGrey.shade700,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
