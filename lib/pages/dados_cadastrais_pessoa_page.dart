import 'package:flutter/material.dart';

import '../model/pessoa.dart';
import '../repository/pessoa_repository.dart';
import '../utils/text_lable.dart';

class DadosCadastraisPessoaPage extends StatefulWidget {
  const DadosCadastraisPessoaPage({super.key});

  @override
  State<DadosCadastraisPessoaPage> createState() =>
      _DadosCadastraisPessoaPageState();
}

class _DadosCadastraisPessoaPageState extends State<DadosCadastraisPessoaPage> {
  var nomeController = TextEditingController();
  var pesoController = TextEditingController();
  var alturaControlle = TextEditingController();
  var pessoaRepository = PessoaRepository();
  final _pessoas = <Pessoa>[];

  var peso = 0.0;
  var altura = 0.0;
  var imc = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Dados da Pessoa")),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: ListView(children: [
            const TextLabel(texto: "Nome"),
            TextField(
              controller: nomeController,
            ),
            const TextLabel(texto: "Peso"),
            TextField(
              controller: pesoController,
            ),
            const TextLabel(texto: "Altura"),
            TextField(
              controller: alturaControlle,
            ),
            TextButton(
              onPressed: () {
                peso = double.parse(pesoController.text);
                altura = double.parse(alturaControlle.text);
                var pessoa = Pessoa(nomeController.text, peso, altura);
                imc = pessoa.calculaIMC();
                debugPrint(imc.round().toString());
                setState(() {
                  debugPrint("Salvando....");
                  pessoaRepository.adicionar(pessoa);
                  _pessoas.add(pessoa);
                  debugPrint(
                      "Quantidade de pessoas na lista ${_pessoas.length}");
                });
                Navigator.pop(context);
              },
              child: const Text("Salvar"),
            ),
          ]),
        ));
  }
}
