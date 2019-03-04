import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';

class StringUtil{
  static List<String> dateFormats(){
    return [DD, ', ', MM,' ',dd, ', ', yyyy];
  }

  static String dateFull(date){
    return DateFormat('EEEE, MMMM d, yyyy').format(date);
  }

  static String dateFormat(){
    return 'EEEE, MMMM d, yyyy';
  }

  static String dateToDB(date){
    return DateFormat('dd-MM-yyyy').format(date);
  }
}