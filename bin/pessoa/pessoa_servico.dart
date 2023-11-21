//import '../Curso/curso.dart';
import '../aluno/aluno.dart';
import '../professor/professor.dart';
import '../util.dart';
import 'pessoa.dart';
import 'pessoaRepository.dart';

class PessoaServico {
  PessoaRepository pessoaRepository = PessoaRepository();
  Util util = Util();

  bool cadastrarPessoa(Pessoa pessoa) {
    var pessoaEncontrada = pessoaRepository.buscarPorEmail(pessoa.email);
    if (pessoaEncontrada == null) {
      pessoaRepository.adicionar(pessoa);
      return true;
    }
    return false;
  }

  void excluirPessoa(String email) {
    Pessoa? pessoaEncontrada = pessoaRepository.buscarPorEmail(email);
    if (pessoaEncontrada != null) {
      pessoaRepository.excluir(pessoaEncontrada);
      print('\x1B[32mAluno Exluido com Sucesso.\x1B[0m');
    } else {
      print('\x1B[31mFalha ao Excluir\x1B[0m');
    }
  }

  Pessoa encontrarPessoaPorEmail(String email) {
    Pessoa pessoa = Pessoa(nome: '', email: '', nascimento: DateTime.now());
    Pessoa? pessoaEncontrada = pessoaRepository.buscarPorEmail(email);
    if (pessoaEncontrada != null) {
      return pessoaEncontrada;
    } else {
      return pessoa;
    }
  }

  Pessoa? encontrarPessoaPorEmailreavaliar(String email) {
    Pessoa? pessoaEncontrada = pessoaRepository.buscarPorEmail(email);
    if (pessoaEncontrada != null) {
      return pessoaEncontrada;
    } else {
      return null;
    }
  }

  void listarAluno() {
    for (var pessoa in PessoaRepository.listPessoa) {
      if (pessoa is Aluno) {
        print(
            '\nAluno\nCódigo: ${pessoa.codigo}\nNome: ${pessoa.nome}\nE-mail: ${pessoa.email}\nData Nascimento: ${util.formatDateParaString(pessoa.nascimento)}\nEndereço: ${pessoa.endereco}');
      }
    }
  }

  List<Pessoa> listarProfessor() {
    List<Professor> professores = [];

    for (var pessoa in PessoaRepository.listPessoa) {
      if (pessoa is Professor) {
        print(
            '\nProfessor\nCódigo: ${pessoa.codigo}\nNome: ${pessoa.nome}\nE-mail: ${pessoa.email}\nData Nascimento: ${pessoa.nascimento}\nEndereço: ${pessoa.endereco}');
        professores.add(pessoa);
      }
    }
    return professores;
  }
}
