
import 'package:intl/intl.dart';

class Util{
  String formatDateParaString(DateTime data) {
    final df = DateFormat('dd/MM/yyyy');
    String nascimentoString = df.format(data) ;
    return nascimentoString;
  }

  DateTime formatStringParaDate(String data){
    DateFormat df = DateFormat('dd/MM/yyyy');
    DateTime dateTime = df.parse(data);
    return dateTime;
  }
}