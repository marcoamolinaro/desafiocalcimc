import 'package:desafiocalcimc/repository/pessoa_repository.dart';
import 'package:flutter/material.dart';

import '../model/pessoa.dart';
import '../utils/text_lable.dart';

class ListViewCalcudoraPage extends StatefulWidget {
  const ListViewCalcudoraPage({super.key});

  @override
  State<ListViewCalcudoraPage> createState() => _ListViewCalcudoraPageState();
}

class _ListViewCalcudoraPageState extends State<ListViewCalcudoraPage> {
  var pessoaRepository = PessoaRepository();
  var nomeController = TextEditingController(text: "");
  var pesoController = TextEditingController(text: "");
  var alturaController = TextEditingController(text: "");
  var imc = 0.0;
  var _pessoas = const <Pessoa>[];

  @override
  void initState() {
    super.initState();
    obterPessoas();
  }

  void obterPessoas() async {
    _pessoas = await pessoaRepository.listar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext bc) {
                    return Scaffold(
                        appBar: AppBar(title: const Text("Dados da Pessoa")),
                        body: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          child: ListView(
                            children: [
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
                                controller: alturaController,
                              ),
                              TextButton(
                                  child: const Text("Salvar"),
                                  onPressed: () {
                                    var peso =
                                        double.parse(pesoController.text);
                                    var altura =
                                        double.parse(alturaController.text);
                                    var pessoa = Pessoa(
                                        nomeController.text, peso, altura);
                                    pessoaRepository.adicionar(pessoa);
                                    //_pessoas.add(pessoa);
                                    debugPrint(
                                        "Quantidade de pessoas na lista ${_pessoas.length}");
                                    setState(() {
                                      nomeController.text = "";
                                      pesoController.text = "";
                                      alturaController.text = "";
                                      obterPessoas();
                                    });
                                    Navigator.pop(context);
                                  }),
                            ],
                          ),
                        ));
                  });
            }),
        body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                Expanded(
                    child: ListView.builder(
                  itemCount: _pessoas.length,
                  itemBuilder: (BuildContext bc, int index) {
                    var pessoa = _pessoas[index];
                    return Dismissible(
                        onDismissed: (DismissDirection dd) async {
                          await pessoaRepository.revover(pessoa.getId());
                          obterPessoas();
                        },
                        key: Key(pessoa.getId()),
                        child: ListTile(
                          title: Text(
                              "Nome: ${pessoa.getNome()} - IMC: ${pessoa.calculaIMC().round()}"),
                        ));
                  },
                ))
              ],
            )));
  }
}
