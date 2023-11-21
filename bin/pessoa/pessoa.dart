class Pessoa{
  static int _codigoAtual = 1;
  late int codigo ;
  String nome;
  String email;
  late DateTime nascimento;
  String? endereco;

  Pessoa({required this.nome, required this.email, required DateTime nascimento, this.endereco}){
    // ignore: prefer_initializing_formals
    this.nascimento = nascimento;
    codigo = _codigoAtual++;
  }

  

 
}