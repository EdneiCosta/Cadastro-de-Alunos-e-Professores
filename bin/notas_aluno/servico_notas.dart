import '../Curso/curso.dart';
import '../Curso/curso_repositorio.dart';
import '../aluno/aluno.dart';
import 'notas_aluno.dart';


class ServicoNotas {
  CursoRepositorio cursoRepositorio = CursoRepositorio();

  Aluno? buscarAlunoNoCurso(String email) {
    Aluno? pessoaEncontrada =
        Aluno(nome: '', email: '', nascimento: DateTime.now());

    for (final pessoa in Curso.pessoas) {
      if (pessoa.email == email) {
        return pessoaEncontrada;
      }
    }
    return null;
  }

  incluirNotas(double nota) {
    if (NotaAluno.notas.length < 3) {
      NotaAluno.notas.add(nota);
    }
  }

  double mediaDasNotas(List<double> notas) {
    double media = 0;
    if (notas.isNotEmpty) {
      for (final soma in notas) {
        media += soma;
      }
    }
    return media / 3;
  }

  listarNotas(List<double> notas) {
    for (final exibir in notas) {
      print(exibir);
    }
  }
}
