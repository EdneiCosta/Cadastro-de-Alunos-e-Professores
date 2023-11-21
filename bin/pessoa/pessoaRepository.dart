import '../Curso/curso.dart';
import 'pessoa.dart';

class PessoaRepository {
   Curso curso = Curso(nome: '', totalAlunos: 0);
  static List<Pessoa> listPessoa = [];

  adicionar(Pessoa pessoa) {
    listPessoa.add(pessoa);
  }

  excluir(Pessoa pessoa) {
    listPessoa.remove(pessoa);
  }

  Pessoa? buscarPorEmail(String email) {
    for (final pessoa in listPessoa) {
      if (pessoa.email == email) {
        return pessoa;
      }
    }
    return null;
  }
}
