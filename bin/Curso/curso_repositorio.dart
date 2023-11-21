import '../pessoa/pessoa.dart';
import '../professor/professor.dart';
import 'curso.dart';

class CursoRepositorio {
  Curso curso = Curso(nome: '', totalAlunos: 0);
  List<Curso> listaDeCurso = [];

  adicionarCurso(Curso curso) {
    listaDeCurso.add(curso);
    print('\x1B[32mCurso Cadastrado com sucesso!\x1B[0m');
  }

  bool verificarSeTemAlunoRepetida(Curso curso, String email) {
    for (final pessoa in Curso.pessoas) {
      if (pessoa.email == email) {
        return false;
      }
    }return true;
  }

  int verificaSeTemProfessor(Curso curso) {
    int professorMatriculado = 0;
    for (final professor in Curso.pessoas) {
      if (professor is Professor) {
        professorMatriculado++;
      }
    }
    return professorMatriculado;
  }

  listarAlunosDoCurso() {
    for (final alunos in Curso.pessoas) {
      print(alunos.nome);
    }
  }

  excluir(Curso curso) {
    listaDeCurso.remove(curso);
  }

  Curso? buscarCursoPorCodigo(int codigo) {
    for (final curso in listaDeCurso) {
      if (curso.codigo == codigo) {
        //if (curso.pessoas.isNotEmpty) {
        return curso;
        //}
      }
    }
    return null;
  }

  List<Pessoa> adicionarPessoa(Pessoa pessoa) {
    Curso.pessoas.add(pessoa);
    return Curso.pessoas;
  }
}
