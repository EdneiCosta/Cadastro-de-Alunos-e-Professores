//import '../aluno/aluno.dart';
import '../pessoa/pessoa.dart';

class Curso {
  late int codigo;
  static int _codigoAtual = 1;
  String nome;
  int totalAlunos;
  static List<Pessoa> pessoas = [];

  Curso({required this.nome, required this.totalAlunos,}) {
    codigo = _codigoAtual++;
    
  }


  // void incluirAluno(Pessoa pessoaAluno) {
  //   if (pessoas.length < totalAlunos) {
  //     pessoas.add(pessoaAluno);
  //     print('Aluno ${pessoaAluno.nome} adicionado ao curso ${nome}.');
  //   } else {
  //     print('Limite de alunos atingido para o curso ${nome}.');
  //   }
  // }

  // void excluirAluno(Pessoa pessoaAluno) {
  //   if (pessoas.contains(pessoaAluno)) {
  //     pessoas.remove(pessoaAluno);
  //     print('Aluno ${pessoaAluno.nome} removido do curso ${nome}.');
  //   } else {
  //     print('Aluno ${pessoaAluno.nome} não encontrado no curso ${nome}.');
  //   }
  // }

  // void listarAlunos() {
  //   if (pessoas.isNotEmpty) {
  //     print('Alunos no curso $nome:');
  //     for (var pessoa in pessoas) {
  //       if (pessoa is Aluno) {
  //         print(' - ${pessoa.nome}');
  //       }
  //     }
  //   } else {
  //     print('Nenhum aluno no curso $nome.');
  //   }
  // }
}
