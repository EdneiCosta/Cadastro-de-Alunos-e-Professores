//import '../Curso/curso.dart';
import '../notas_aluno/notas_aluno.dart';
import '../pessoa/pessoa.dart';

class Aluno extends Pessoa {
  static List<NotaAluno> notas = [];
  List<Aluno> listaDeAlunos = [];

  Aluno({required super.email, required super.nome,  required super.nascimento, super.endereco});

}


