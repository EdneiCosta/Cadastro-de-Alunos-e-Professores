//import 'notas_aluno.dart';

class NotasRepositorio{
  List<double> listaNotas = []; 
 

  double calcularMedia() {
    if (listaNotas.isNotEmpty) {
      var soma = listaNotas.reduce((a, b) => a + b);
      return soma / listaNotas.length;
    } else {
      return 0.0;
    }
  }

}