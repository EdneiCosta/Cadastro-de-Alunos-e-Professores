import 'dart:io';
import 'package:intl/intl.dart';

import 'Curso/curso.dart';
import 'Curso/servico_curso.dart';
import 'aluno/aluno.dart';
import 'notas_aluno/notas_aluno.dart';
import 'notas_aluno/servico_notas.dart';
import 'pessoa/pessoa.dart';
import 'pessoa/pessoa_servico.dart';
import 'professor/professor.dart';
import 'util.dart';

class UI {
  PessoaServico pessoaInterface = PessoaServico();
  ServicoCurso servicoCurso = ServicoCurso();
  ServicoNotas servicoNotas = ServicoNotas();
  Util util = Util();

  menuPrincipal() {
    int opcao = 0;
    while (opcao != 4) {
      print('=-=-=-=-= CADASTRO =-=-=-=-=');
      print('1 - Aluno \n2 - Professor\n3 - Curso\n4 - Sair.');

      opcao = int.parse(stdin.readLineSync()!);
      switch (opcao) {
        case 1:
          menuGerenciarAluno();
          break;
        case 2:
          menuGerenciarProfessor();
          break;
        case 3:
          menuGerenciarCurso();
          break;
        case 4:
          break;
        default:
          print('\x1B[31mOpção Inválida\x1B[0m');
      }
    }
  }

  menuGerenciarAluno() {
    int opcao = 0;
    while (opcao != 5) {
      print('=-=-=-=-= ALUNO =-=-=-=-=');
      print('1 - Criar\n2 - Alterar\n3 - Excluir\n4 - Listar\n5 - Voltar');

      try {
        opcao = int.parse(stdin.readLineSync()!);
        switch (opcao) {
          case 1:
            cadastrarAluno();
            break;
          case 2:
            alterarALuno();
            break;
          case 3:
            excluirAlunoPorEmail();
            break;
          case 4:
            pessoaInterface.listarAluno();
            break;
          case 5:
            print('Voltar.');
            break;
          default:
            print('\x1B[31mOpção Inválida\x1B[0m');
            break;
        }
      } catch (e) {
        print(
            '=-=-=-=-=\x1B[31mEntrada inválida. Gerenciar Aluno.\x1B[0m=-=-=-=-=');
      }
    }
  }

  menuGerenciarProfessor() {
    int opcao = 0;
    while (opcao != 5) {
      print('=-=-=-=-= Professor =-=-=-=-=');
      print('1 - Criar\n2 - Alterar\n3 - Excluir\n4 - Listar\n5 - Voltar');
      try {
        opcao = int.parse(stdin.readLineSync()!);
        switch (opcao) {
          case 1:
            cadastrarProfessor();
            break;
          case 2:
            alterarProfessor();
            break;
          case 3:
            excluirProfessorPorEmail();
            break;
          case 4:
            pessoaInterface.listarProfessor();
            break;
          case 5:
            print('Voltar.');
            break;
          default:
            print('\x1B[31mOpção Inválida\x1B[0m');
            break;
        }
      } catch (e) {
        print(
            '=-=-=-=-=\x1B[31mEntrada inválida.Gerenciar Professor.\x1B[0m=-=-=-=-=');
      }
    }
  }

  menuGerenciarCurso() {
    int opcao = 0;
    while (opcao != 6) {
      print('=-=-=-=-= CADASTRO DE CURSO =-=-=-=-=');
      print(
          '1 - Criar\n2 - Alterar\n3 - Excluir\n4 - Listar\n5 - vincular Aluno no curso\n6 - voltar');
      try {
        opcao = int.parse(stdin.readLineSync()!);
        switch (opcao) {
          case 1:
            cadastrarCurso();
            break;
          case 2:
            alterarCurso();
            break;
          case 3:
            excluirCurso();
            break;
          case 4:
            servicoCurso.listarCursos();
            break;
          case 5:
            menuIncluirAlunoEProfessor();
            break;
          case 6:
            print('Voltar.');
            break;
          default:
            print('\x1B[31mOpção Inválida\x1B[0m');
            break;
        }
      } catch (e) {
        print(
            '=-=-=-=-=\x1B[31mEntrada inválida. Gerenciar Curso.\x1B[0m=-=-=-=-=');
      }
    }
  }

  menuIncluirAlunoEProfessor() {
    int opcao = 0;
    while (opcao != 5) {
      print('=-=-=-=-= GERENCIAR ALUNOS/PROFESSORES =-=-=-=-=');
      print(
          '1 - Aluno \n2 - Professor\n3 - Listar\n4 - Excluir\n5 - Menu Gerenciar Notas.\n6 - Voltar');
      try {
        opcao = int.parse(stdin.readLineSync()!);
        switch (opcao) {
          case 1:
            incluirAluno();
            break;
          case 2:
            incluirProfessor();
            break;
          case 3:
            listarCursoComPessoas();
            break;
          case 4:
            excluirPessoasVinculadoAoCurso();
            break;
          case 5:
            menuGerenciarNotasAlunos();
            break;
          case 6:
            print("Voltar");
            break;
          default:
            print('\x1B[31mOpção Inválida\x1B[0m');
        }
      } catch (e) {
        print(
            '=-=-=-=-=\x1B[31mEntrada inválida.GERENCIAR ALUNOS/PROFESSORES.\x1B[0m=-=-=-=-=');
      }
    }
  }

  menuGerenciarNotasAlunos() {
    int opcao = 0;
    while (opcao != 5) {
      print('=-=-=-=-= GERENCIAR NOTAS DO ALUNO =-=-=-=-=');
      print(
          '1 - Adicionar Notas \n2 - Alterar Notas\n3 - Excluir Notas\n4 - Exibir Média aritmética\n5 - Voltar.');

      opcao = int.parse(stdin.readLineSync()!);
      switch (opcao) {
        case 1:
          adicionarNotas();
          break;
        case 2:
          alterarNotas();
          break;
        case 3:
          excluirNotas();
          break;
        case 4:
          exibirMediaAritmetica();
          break;
        case 5:
          print('Voltar');
          break;
        default:
          print('\x1B[31mOpção Inválida\x1B[0m');
      }
    }
  }

  alterarNotas() {
    print(
        'Qual o Curso que você deseja Alterar as notas?(Digite o Codigo do Curso)');
    int codiCurso = int.parse(stdin.readLineSync()!);
    servicoCurso.listarPessoasAssociadas(codiCurso);

    print('Qual o Email do aluno que você deseja Gerenciar as notas?');
    String email = stdin.readLineSync()!;
    servicoNotas.buscarAlunoNoCurso(email);

    servicoNotas.listarNotas(NotaAluno.notas);
    int opcao = 0;

    print(
        'Qual das notas deseja alterar?\n1 - Primeira Nota\n2 - Segunda Nota\n3 - Terceira Nota');
    opcao = int.parse(stdin.readLineSync()!);
    switch (opcao) {
      case 1:
        print('Informe o valor da nova Nota');
        double novaNota = double.parse(stdin.readLineSync()!);
        NotaAluno.notas[0] = novaNota;
        break;
      case 2:
        print('Informe o valor da nova Nota');
        double novaNota = double.parse(stdin.readLineSync()!);
        NotaAluno.notas[1] = novaNota;
        break;
      case 3:
        print('Informe o valor da nova Nota');
        double novaNota = double.parse(stdin.readLineSync()!);
        NotaAluno.notas[2] = novaNota;
        break;
      default:
        print('\x1B[31mOpção Inválida\x1B[0m');
        ;
    }
  }

  excluirNotas() {
    print(
        'Qual o Curso que você deseja Excluir a notas?(Digite o Codigo do Curso)');
    int codiCurso = int.parse(stdin.readLineSync()!);
    servicoCurso.listarPessoasAssociadas(codiCurso);

    print('Qual o Email do aluno que você deseja Gerenciar as notas?');
    String email = stdin.readLineSync()!;
    servicoNotas.buscarAlunoNoCurso(email);

    servicoNotas.listarNotas(NotaAluno.notas);
    int opcao = 0;

    print(
        'Qual das notas deseja Excluir?\n1 - Primeira Nota\n2 - Segunda Nota\n3 - Terceira Nota');
    opcao = int.parse(stdin.readLineSync()!);
    switch (opcao) {
      case 1:
        NotaAluno.notas.removeAt(0);
        break;
      case 2:
        NotaAluno.notas.removeAt(1);
        break;
      case 3:
        NotaAluno.notas.removeAt(2);
        break;
      default:
        print('\x1B[31mOpção Inválida\x1B[0m');
    }
  }

  exibirMediaAritmetica() {
    print(
        'Qual o Curso que você deseja verificar a media aritimetica?(Digite o Codigo do Curso)');
    int codiCurso = int.parse(stdin.readLineSync()!);
    servicoCurso.listarPessoasAssociadas(codiCurso);

    print('Qual o Email do aluno que você deseja Gerenciar as notas?');
    String email = stdin.readLineSync()!;
    servicoNotas.buscarAlunoNoCurso(email);

    double media = servicoNotas.mediaDasNotas(NotaAluno.notas);
    print('A média do Aluno é ${media.toStringAsFixed(2)}');
  }

  adicionarNotas() {
    print(
        'Qual o Curso que você deseja Adicionar as notas?(Digite o Codigo do Curso)');
    int codiCurso = int.parse(stdin.readLineSync()!);
    servicoCurso.listarPessoasAssociadas(codiCurso);

    print('Qual o Email do aluno que você deseja Gerenciar as notas?');
    String email = stdin.readLineSync()!;
    servicoNotas.buscarAlunoNoCurso(email);

    for (int i = 1; i < 4; i++) {
      print('Qual a $iª nota?');
      double nota = double.parse(stdin.readLineSync()!);
      servicoNotas.incluirNotas(nota);
    }
  }

  excluirPessoasVinculadoAoCurso() {
    print('Qual o codigo do curso');
    int codigo = int.parse(stdin.readLineSync()!);
    servicoCurso.listarPessoasAssociadas(codigo);

    print('Insira o email da Pessoa que deseja exluir');
    String email = stdin.readLineSync()!;
    servicoCurso.excluirPessoasDoCurso(email);
  }

  listarCursoComPessoas() {
    int codCurso = 0;
    print('Qual o codigo do curso que você deseja Listar?');
    codCurso = int.parse(stdin.readLineSync()!);
    servicoCurso.listarPessoasAssociadas(codCurso);
  }

  incluirAluno() {
    int codCurso = 0;
    String email = '';
    int controle = 0;

    while (controle != 2) {
      servicoCurso.listarCursos();
      print('Qual o codigo do Curso?');
      codCurso = int.parse(stdin.readLineSync()!);

      pessoaInterface.listarAluno();
      print('Qual o email do aluno?');
      email = stdin.readLineSync()!;

      servicoCurso.adicionarAlunoAoCurso(codCurso, email);

      print('Deseja incluir mais algum aluno?\n1 - Sim.\n2 - Não.');
      controle = int.parse(stdin.readLineSync()!);
    }
  }

  incluirProfessor() {
    int codCurso = 0;
    String email = '';
    servicoCurso.listarCursos();
    print('Qual o codigo do Curso?');
    codCurso = int.parse(stdin.readLineSync()!);

    pessoaInterface.listarProfessor();
    print('Qual o email do Professor?');
    email = stdin.readLineSync()!;

    servicoCurso.adicionarProfessorAoCurso(codCurso, email);
  }

  cadastrarAluno() {
    print('CADASTRO DE ALUNO');
    print('Qual o Nome:');
    String nome = stdin.readLineSync()!;
    print('Qual o Email:');
    String email = stdin.readLineSync()!;
    print('Qual a Data de Nascimento (formato dd/MM/yyyy):');
    String data = stdin.readLineSync()!;

    DateTime nascimento = DateFormat('dd/MM/yyyy').parseStrict(data);

    print('Qual o Endereço:');
    String endereco = stdin.readLineSync()!;

    Pessoa aluno = Aluno(
        email: email, nome: nome, nascimento: nascimento, endereco: endereco);

    bool resultado = pessoaInterface.cadastrarPessoa(aluno);
    if (resultado) {
      print('');
      print('\x1B[32mAluno Cadastrado com sucesso!\x1B[0m');
    } else {
      print(
          '\x1B[31mFalha ao cadastrar o aluno! Já existe um email igual cadastrado!\x1B[0m');
    }
  }

  alterarALuno() {
    pessoaInterface.listarAluno();
    print('Insira o email do aluno que deseja alterar');
    String email = stdin.readLineSync()!;

    servicoCurso.listarCursos();
    Pessoa alunoSerALterado = pessoaInterface.encontrarPessoaPorEmail(email);
    if (alunoSerALterado.email != email) {
      print('Aluno não Encontrado');
      menuGerenciarAluno();
    }
    int opcao = 0;

    print('Qual o dados do Aluno que você deseja alterar');
    print('1 - Nome.\n2 - Data de Nascimento.\n3 - Endereço.');
    opcao = int.parse(stdin.readLineSync()!);
    try {
      switch (opcao) {
        case 1:
          print('Nome atual ${alunoSerALterado.nome} qual sera o novo nome?');
          alunoSerALterado.nome = stdin.readLineSync()!;
          print("\x1B[32mNome alterado com sucesso!\x1B[0m");
          break;
        case 2:
          print(
              'Data de Nascimento Atual ${alunoSerALterado.nascimento} Qual a Data de Nascimento que deseja Alterar?');
          String data = stdin.readLineSync()!;
          alunoSerALterado.nascimento = util.formatStringParaDate(data);
          print("\x1B[32mData de Nascimento alterado com sucesso!\x1B[0m");
          break;
        case 3:
          print('Qual o Endereço que deseja Alterar?');
          alunoSerALterado.endereco = stdin.readLineSync()!;
          print("\x1B[32mNome alterado com sucesso!\x1B[0m");
          break;
        default:
          print('\x1B[31mOpção Inválida\x1B[0m');
      }
    } catch (e) {
      print(
          '=-=-=-=-=\x1B[31mEntrada inválida. Alterar Aluno.\x1B[0m=-=-=-=-=');
    }
  }

  excluirAlunoPorEmail() {
    pessoaInterface.listarAluno();
    print('Insira o email do aluno que deseja exluir');
    String email = stdin.readLineSync()!;
    pessoaInterface.excluirPessoa(email);
  }

  cadastrarProfessor() {
    print('CADASTRO DE PROFESSOR');
    print('Qual o Nome:');
    String nome = stdin.readLineSync()!;
    print('Qual o Email:');
    String email = stdin.readLineSync()!;
    print('Qual a Data de Nascimento (formato dd/MM/yyyy):');
    String data = stdin.readLineSync()!;

    DateTime nascimento = util.formatStringParaDate(data);

    print('Qual o Endereço:');
    String endereco = stdin.readLineSync()!;

    Pessoa professor = Professor(
        email: email, nome: nome, nascimento: nascimento, endereco: endereco);

    bool resultado = pessoaInterface.cadastrarPessoa(professor);
    if (resultado) {
      print('\x1B[32mProfessor Cadastrado com Sucesso!\x1B[0m');
    } else {
      print('\x1B[31mFalha ao Cadastrar o Professor\x1B[0m');
    }
  }

  alterarProfessor() {
    pessoaInterface.listarProfessor();
    print('Insira o email do Professor que deseja alterar');
    String email = stdin.readLineSync()!;

    Pessoa professorSerALterado =
        pessoaInterface.encontrarPessoaPorEmail(email);
    if (professorSerALterado.email != email) {
      print('Professor não Encontrado');
      menuGerenciarProfessor();
    }
    int opcao = 0;

    print('Qual o dados do Professor que você deseja alterar');
    print('1 - Nome.\n2 - Data de Nascimento.\n3 - Endereço.');
    opcao = int.parse(stdin.readLineSync()!);
    try {
      switch (opcao) {
        case 1:
          print(
              'Nome atual ${professorSerALterado.nome} qual sera o novo nome?');
          professorSerALterado.nome = stdin.readLineSync()!;
          print("\x1B[32mNome alterado com sucesso!\x1B[0m");
          break;
        case 2:
          print(
              'Data de Nascimento Atual ${professorSerALterado.nascimento} Qual a Data de Nascimento que deseja Alterar?');
          String data = stdin.readLineSync()!;
          professorSerALterado.nascimento = util.formatStringParaDate(data);
          print("\x1B[32mData de Nascimento alterado com sucesso!\x1B[0m");
          break;
        case 3:
          print('Qual o Endereço que deseja Alterar?');
          professorSerALterado.endereco = stdin.readLineSync()!;
          print("\x1B[32mEndereço alterado com sucesso!\x1B[0m");
          break;
        default:
          print('\x1B[31mOpção Inválida\x1B[0m');
      }
    } catch (e) {
      print(
          '=-=-=-=-=\x1B[31mEntrada inválida. Alterar Professor.\x1B[0m=-=-=-=-=');
    }
  }

  excluirProfessorPorEmail() {
    pessoaInterface.listarProfessor();
    print('Insira o email do Professor que deseja exluir');
    String email = stdin.readLineSync()!;
    pessoaInterface.excluirPessoa(email);
  }

  cadastrarCurso() {
    print('CADASTRO DE CURSO');
    print('Qual o Nome do Curso:');
    String nome = stdin.readLineSync()!;
    print('Qual a Capacidade de Alunos?');
    int totalAlunos = int.parse(stdin.readLineSync()!);

    Curso curso1 = Curso(
      nome: nome,
      totalAlunos: totalAlunos,
    );

    servicoCurso.adicinarCurso(curso1);
  }

  alterarCurso() {
    servicoCurso.listarCursos();
    print('Qual codigo do curso que deseja Alterar');
    int codigo = int.parse(stdin.readLineSync()!);
    Curso cursoASerAlterado = servicoCurso.atualizarDadosCurso(codigo);

    int opcao = 0;

    print('Qual o dados do Curso que você deseja alterar');
    print('1 - Nome.\n2 - Capacidade de Alunos');
    opcao = int.parse(stdin.readLineSync()!);
    try {
      switch (opcao) {
        case 1:
          print('Nome atual ${cursoASerAlterado.nome} qual sera o novo nome?');
          cursoASerAlterado.nome = stdin.readLineSync()!;
          print('\x1B[32mNome Alterado com sucesso\x1B[0m');
          break;
        case 2:
          print(
              'capacidade atual é de ${cursoASerAlterado.totalAlunos} alunos, qual a capacidade que voce deseja.');
          cursoASerAlterado.totalAlunos = int.parse(stdin.readLineSync()!);
          print('\x1B[32mCapacidade de alunos Alterado com sucesso\x1B[0m');

          break;
        default:
          print('\x1B[31mOpção Inválida\x1B[0m');
      }
    } catch (e) {
      print(
          '=-=-=-=-=\x1B[31mEntrada inválida. Alterar Curso.\x1B[0m=-=-=-=-=');
    }
  }

  excluirCurso() {
    servicoCurso.listarCursos();
    print('Qual codigo do curso que deseja remover');
    int codigo = int.parse(stdin.readLineSync()!);

    servicoCurso.excluirCurso(codigo);
  }
}
