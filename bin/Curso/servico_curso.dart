import '../aluno/aluno.dart';
import '../notas_aluno/notas_aluno.dart';
import '../pessoa/pessoa.dart';
import '../pessoa/pessoaRepository.dart';
import '../pessoa/pessoa_servico.dart';
import '../professor/professor.dart';
import 'curso.dart';
import 'curso_repositorio.dart';

class ServicoCurso {
  CursoRepositorio cursoRepositorio = CursoRepositorio();
  PessoaServico pessoaInterface = PessoaServico();
  PessoaRepository pessoaRepository = PessoaRepository();

  adicionarProfessorAoCurso(int codigoCurso, String email) {
    Curso? curso = cursoRepositorio.buscarCursoPorCodigo(codigoCurso);
    Pessoa? professorEncontrado =
        pessoaInterface.encontrarPessoaPorEmailreavaliar(email);

    if (curso != null && professorEncontrado != null) {
      if (Curso.pessoas.length < curso.totalAlunos + 1) {
        if (cursoRepositorio.verificaSeTemProfessor(curso) > 0) {
          cursoRepositorio.adicionarPessoa(professorEncontrado);
          print('\x1B[32mProfessor Cadastrado Com Sucesso\x1B[0m');
        }
      } else {
        print('Professor ja Cadastrado.');
      }
    }
  }

  adicionarAlunoAoCurso(int codigoCurso, String email) {
    Curso? curso = cursoRepositorio.buscarCursoPorCodigo(codigoCurso);
    Pessoa? alunoEncontrado =
        pessoaInterface.encontrarPessoaPorEmailreavaliar(email);

    if (curso != null && alunoEncontrado != null) {
      if (Curso.pessoas.length < curso.totalAlunos) {
        if (cursoRepositorio.verificarSeTemAlunoRepetida(curso, email)) {
          cursoRepositorio.adicionarPessoa(alunoEncontrado);
          print('\x1B[32mAluno adicionado ao curso com sucesso!\x1B[0m');
        } else {
          print('\x1B[31mAluno ja Cadastrado, ou verifique o Email\x1B[0m');
        }
      } else {
        print('\x1B[31mExcedeu o Limite de Aluno no Curso.\x1B[0m');
      }
    } else {
      print('\x1B[31mCurso Não Encontrado\x1B[0m');
    }
  }

  adicinarCurso(Curso curso) {
    cursoRepositorio.adicionarCurso(curso);
  }

  listarCursos() {
    for (var curso in cursoRepositorio.listaDeCurso) {
      print(
          '\nCurso: ${curso.nome}\nCódigo: ${curso.codigo}\nTotal de Alunos: ${curso.totalAlunos}');
    }
  }

  listarPessoasAssociadas(int codigo) {
    Curso? curso = cursoRepositorio.buscarCursoPorCodigo(codigo);

    if (curso != null) {
      print(curso.nome);

      for (final pessoa in Curso.pessoas) {
        if (pessoa is Professor) {
          print(
              'Tipo: Professor\nCódigo: ${pessoa.codigo}\nNome: ${pessoa.nome}\nE-mail: ${pessoa.email}\nData Nascimento: ${pessoa.nascimento}\nEndereço: ${pessoa.endereco}\n');
        } else if (pessoa is Aluno) {
          print(
              'Tipo: Aluno\nCódigo: ${pessoa.codigo}\nNome: ${pessoa.nome}\nE-mail: ${pessoa.email}\nData Nascimento: ${pessoa.nascimento}\nEndereço: ${pessoa.endereco}\n');
        }
      }
    }
  }

  void excluirPessoasDoCurso(String email) {
    for (final pessoa in Curso.pessoas) {
      if (pessoa.email == email) {
        Curso.pessoas.remove(pessoa);
        NotaAluno.notas.clear();
        print('Aluno Excluido com Sucesso.');
      } else {
        print('Aluno não encontrado.');
      }
    }
  }

  void excluirCurso(int codigo) {
    Curso? curso = cursoRepositorio.buscarCursoPorCodigo(codigo);

    if (curso == null) {
      print('\x1B[31mCurso não encontrado.\x1B[0m');
      return;
    }

    if (Curso.pessoas.isNotEmpty) {
      print(
          '\x1B[31mNão é possível excluir o curso, pois existem alunos ou professores associados a ele.\x1B[0m');
      return;
    }

    cursoRepositorio.excluir(curso);
    print('\x1B[32mCurso excluído com sucesso!\x1B[0m');
  }

  Curso atualizarDadosCurso(int codigo) {
    Curso curso = Curso(nome: '', totalAlunos: 0);
    Curso? cursoEncontrado = cursoRepositorio.buscarCursoPorCodigo(codigo);
    if (cursoEncontrado != null) {
      return cursoEncontrado;
    } else {
      return curso;
    }
  }
}
