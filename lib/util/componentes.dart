import 'package:consumo_api/model/cidade.dart';
import 'package:consumo_api/model/pessoa.dart';
import 'package:flutter/material.dart';

class Componentes {
  criaTexto(texto, cor, tamanho, alinhamento) {
    return Text(
      texto,
      textAlign: alinhamento,
      style: TextStyle(
        color: cor,
        fontSize: tamanho,
      ),
    );
  }

  criaTextField(habilitado, controlador, label) {
    return TextFormField(
      controller: controlador,
      decoration: InputDecoration(
        floatingLabelStyle: TextStyle(color: Colors.amber.shade700),
        labelStyle: TextStyle(color: Colors.white),
        labelText: label,
        enabled: habilitado,
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.amber.shade700)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.amber.shade700)),
      ),
    );
  }

  criaTextFieldResultado(habilitado, conteudo) {
    return TextField(
      decoration: InputDecoration(
        labelText: conteudo,
        enabled: habilitado,
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.amber.shade700)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.amber.shade700)),
      ),
    );
  }

  criaAppBar(texto, funcao) {
    return AppBar(
      actions: [
        IconButton(
            onPressed: funcao,
            tooltip: "Home",
            icon: Icon(
              Icons.home,
              color: Colors.blueGrey.shade700,
            ))
      ],
      backgroundColor: Colors.amberAccent.shade700,
      centerTitle: true,
      title: Text(
        texto,
        style: TextStyle(fontSize: 20, color: Colors.blueGrey.shade700),
      ),
    );
  }

  criaSwitch() {
    bool interruptor = false;
    return Switch(value: true, onChanged: null);
  }

  criaRowHab(texto, controlador, label, tamanhoTexto) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: criaTexto(
              texto, Colors.amber.shade700, tamanhoTexto, TextAlign.center),
        ),
        Expanded(flex: 2, child: criaTextField(true, controlador, label)),
      ],
    );
  }

  criaRowDesab(texto, conteudo) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: criaTexto(texto, Colors.amber.shade700, 20, TextAlign.center),
        ),
        Expanded(flex: 2, child: criaTextFieldResultado(false, conteudo)),
      ],
    );
  }

  criaButton(controladorFormulario, funcao, texto) {
    return SizedBox(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ElevatedButton(
          style: ButtonStyle(
            maximumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
            minimumSize: MaterialStateProperty.all(Size(double.infinity, 0)),
            backgroundColor:
                MaterialStatePropertyAll<Color>(Colors.amber.shade700),
          ),
          onPressed: () {
            if (controladorFormulario.currentState!.validate()) {
              funcao();
            }
          },
          child: Text(
            texto,
            style: TextStyle(
              color: Colors.blueGrey.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  criaItemPessoa(Pessoa p) {
    String sexo = p.sexo == 'M' ? 'Masculino' : "Feminino";
    return ListTile(
      title: criaTexto(
          "${p.id} - ${p.nome}", Colors.blueGrey.shade700, 20, TextAlign.start),
      subtitle: criaTexto("${p.idade} anos - ${p.sexo}",
          Colors.blueGrey.shade700, 20, TextAlign.start),
      trailing: criaTexto("${p.cidade.nome}/${p.cidade.uf}",
          Colors.lightGreen.shade900, 20, TextAlign.start),
    );
  }

  criaItemCidade(Cidade c) {
    return ListTile(
      title: criaTexto("${c.id} - ${c.nome}/${c.uf}", Colors.blueGrey.shade700,
          20, TextAlign.center),
    );
  }
}
