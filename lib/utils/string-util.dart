import 'package:date_format/date_format.dart';

class StringUtil{
  static List<String> dateFormats(){
    return [DD, ', ', MM,' ',dd, ', ', yyyy];
  }
  static String dateFormat(){
    return 'EEEE, MMMM d, yyyy';
  }
}