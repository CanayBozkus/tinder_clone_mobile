import 'package:tinder_clone/models/model_mixin.dart';
import 'package:tinder_clone/utilities/constant.dart';

class User with ModelMixin {
  static const tableName = 'User_table';

  int? id;
  String? phoneNumber;
  String? countryCode = '${K.countryCodes[0]['code']} ${K.countryCodes[0]['dial_code']}';
  String? email;
  String? name;
  DateTime? birthDay;
  int? gender;
  List? sexualOrientation = [];
  bool? showOrientation = true;
  int? genderPreference;
  List? passions = [];


  static String createTable(){
    return "CREATE TABLE ${User.tableName}("
        "id INTEGER PRIMARY KEY AUTOINCREMENT, "
        "phoneNumber INT NOT NULL, "
        "countryCode TEXT, "
        "email TEXT NOT NULL, "
        "name TEXT NOT NULL, "
        "birthDay TEXT NOT NULL, "
        "gender INT NOT NULL, "
        "sexualOrientation TEXT NOT NULL, "
        "showOrientation TEXT, "
        "genderPreference INT, "
        "passions TEXT"
        ")";
  }

  static String getCleanPhoneNumber(String number){
    String phone =  number.replaceAll(RegExp(r'[A-Za-z\*\(\)\s#\.,\+\/\;-]'), '');
    if(phone.isNotEmpty){
      phone = phone[0] == '0' ? phone.substring(1) : phone;
    }
    return phone;
  }
}