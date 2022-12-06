import 'package:consumo_api/api/acesso_api.dart';
import 'package:consumo_api/model/cidade.dart';
import 'package:consumo_api/util/componentes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ConsultaCidade extends StatefulWidget {
  const ConsultaCidade({super.key});

  @override
  State<ConsultaCidade> createState() => _ConsultaCidadeState();
}

class _ConsultaCidadeState extends State<ConsultaCidade> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();

  List<Cidade> lista = [];
  TextEditingController txtUf = TextEditingController();
  @override
  Widget build(BuildContext context) {
    home() {
      Navigator.of(context).pushReplacementNamed('/home');
    }

    listarTodas() async {
      List<Cidade> cidades = await AcessoApi().listaCidades();
      setState(() {
        lista = cidades;
      });
    }

    listarPorUf() async {
      List<Cidade> cidades = await AcessoApi().buscaPorUf(txtUf.text);
      setState(() {
        lista = cidades;
      });
    }

    deletarCidade(Cidade cidade, context) {
      AcessoApi().deletaCidade(cidade.id);
      Navigator.pushReplacementNamed(context, '/consultaCidade');
      listarTodas();
    }

    alterarCidade(Cidade cidade, context) {
      Navigator.pushReplacementNamed(context, '/alteraCidade',
          arguments: cidade.id);
    }

    return Scaffold(
      appBar: Componentes().criaAppBar("Consulta de Cidades", home),
      body: Form(
        key: formController,
        child: Column(
          children: [
            Icon(Icons.search, size: 150, color: Colors.amber.shade700),
            Componentes()
                .criaButton(formController, listarTodas, "Listar Todas"),
            Componentes().criaRowHab("Informe a Uf: ", txtUf, "Uf", 20),
            Componentes()
                .criaButton(formController, listarPorUf, "Filtrar por UF"),
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
                          Componentes().criaItemCidade(lista[indice]),
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
                                    alterarCidade(lista[indice], context);
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
                                    deletarCidade(lista[indice], context);
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
