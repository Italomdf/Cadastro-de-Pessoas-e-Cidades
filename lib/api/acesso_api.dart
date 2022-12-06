import 'dart:convert';

import 'package:consumo_api/model/cidade.dart';
import 'package:consumo_api/model/pessoa.dart';
import 'package:consumo_api/pages/altera_pessoa.dart';
import 'package:http/http.dart';

class AcessoApi {
  Future<List<Pessoa>> listaPessoas() async {
    String url = 'http://localhost:8080/cliente';
    Response resposta = await get(Uri.parse(url));
    String jsonFormatadoUtf8 = (utf8.decode(resposta.bodyBytes));
    Iterable l = json.decode(jsonFormatadoUtf8);
    List<Pessoa> pessoas = List<Pessoa>.from(l.map((p) => Pessoa.fromJson(p)));
    return pessoas;
  }

  Future<List<Cidade>> listaCidades() async {
    String url = 'http://localhost:8080/cidade';
    Response resposta = await get(Uri.parse(url));
    String jsonFormatadoUtf8 = (utf8.decode(resposta.bodyBytes));
    Iterable l = json.decode(jsonFormatadoUtf8);
    List<Cidade> cidades = List<Cidade>.from(l.map((c) => Cidade.fromJson(c)));
    return cidades;
  }

  Future<List<Cidade>> buscaPorUf(String uf) async {
    String url = 'http://localhost:8080/cidade/buscauf/${uf}';
    Response resposta = await get(Uri.parse(url));
    String jsonFormatadoUtf8 = (utf8.decode(resposta.bodyBytes));
    Iterable l = json.decode(jsonFormatadoUtf8);
    List<Cidade> cidadesUf =
        List<Cidade>.from(l.map((c) => Cidade.fromJson(c)));
    return cidadesUf;
  }

  Future<List<Pessoa>> listaPorCidade(String c) async {
    String url = 'http://localhost:8080/cliente/buscaPorCidade/${c}';
    Response resposta = await get(Uri.parse(url));
    String jsonFormatadoUtf8 = (utf8.decode(resposta.bodyBytes));
    Iterable l = json.decode(jsonFormatadoUtf8);
    List<Pessoa> pessoasc = List<Pessoa>.from(l.map((p) => Pessoa.fromJson(p)));
    return pessoasc;
  }

  Future<void> inserePessoa(Map<String, dynamic> pessoa) async {
    String url = 'http://localhost:8080/cliente';
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    await post(Uri.parse(url), headers: headers, body: json.encode(pessoa));
  }

  Future<void> insereCidade(Map<String, dynamic> cidade) async {
    String url = 'http://localhost:8080/cidade';
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    await post(Uri.parse(url), headers: headers, body: json.encode(cidade));
  }

  Future<void> deletaCidade(int id) async {
    String url = 'http://localhost:8080/cidade/${id}';
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    await delete(Uri.parse(url), headers: headers, body: json.encode(id));
  }

  Future<void> deletaCliente(int id) async {
    String url = 'http://localhost:8080/cliente/${id}';
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    await delete(Uri.parse(url), headers: headers, body: json.encode(id));
  }

  Future<void> alteraCidade(Map<String, dynamic> cidade, id) async {
    String url = 'http://localhost:8080/cidade?id=${id}';
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    await put(Uri.parse(url), headers: headers, body: json.encode(cidade));
  }

  Future<void> alteraPessoa(Map<String, dynamic> pessoa, id) async {
    String url = 'http://localhost:8080/cliente?id=${id}';
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    await put(Uri.parse(url), headers: headers, body: json.encode(pessoa));
  }
}
