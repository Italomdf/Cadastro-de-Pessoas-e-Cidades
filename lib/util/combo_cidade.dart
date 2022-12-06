import 'package:consumo_api/api/acesso_api.dart';
import 'package:consumo_api/model/cidade.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ComboCidade extends StatefulWidget {
  TextEditingController? controller;
  ComboCidade({Key? key, this.controller}) : super(key: key);

  @override
  State<ComboCidade> createState() => _ComboCidadeState();
}

class _ComboCidadeState extends State<ComboCidade> {
  int? cidadesel;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(const Duration(seconds: 1))
            .then((value) => AcessoApi().listaCidades()),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            List<Cidade> cidades = snapshot.data;
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton(
                  underline: Container(
                    height: 2,
                    color: Colors.amber.shade700,
                  ),
                  dropdownColor: Colors.blueGrey.shade700,
                  iconEnabledColor: Colors.amber.shade700,
                  isExpanded: true,
                  value: cidadesel,
                  icon: const Icon(Icons.arrow_downward),
                  hint: const Text(
                    'Selecione uma Cidade.....',
                    style: TextStyle(color: Color.fromARGB(255, 255, 160, 0)),
                  ),
                  elevation: 16,
                  onChanged: (int? value) {
                    setState(() {
                      cidadesel = value;
                      widget.controller?.text = "$value";
                    });
                  },
                  items: cidades.map<DropdownMenuItem<int>>((Cidade cid) {
                    return DropdownMenuItem<int>(
                      value: cid.id,
                      child: Text(
                        "${cid.nome}/${cid.uf}",
                        style: TextStyle(color: Colors.amber.shade700),
                      ),
                    );
                  }).toList(),
                ));
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                LinearProgressIndicator(
                  color: Color.fromARGB(255, 255, 160, 0),
                  semanticsLabel: "Carregando Cidades",
                ),
                Text(
                  'Carregando Cidades',
                  style: TextStyle(color: Color.fromARGB(255, 255, 160, 0)),
                ),
              ],
            );
          }
        });
  }
}
