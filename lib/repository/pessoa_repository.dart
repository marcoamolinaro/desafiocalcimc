import '../model/pessoa.dart';

class PessoaRepository {
  final List<Pessoa> _pessoa = [];

  Future<List<Pessoa>> listar() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _pessoa;
  }

  Future<void> adicionar(Pessoa pessoa) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _pessoa.add(pessoa);
  }

  Future<void> revover(String id) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _pessoa.remove(_pessoa.where((pessoa) => pessoa.getId() == id).first);
  }
}
