
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User{
  String _userNo;
  String _firstName;
  String _lastName;
  String _sex;
  String _idNumber;
  String _position;
  String _personalPhone;

  User();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  String get personalPhone => _personalPhone;

  set personalPhone(String value) {
    _personalPhone = value;
  }

  String get position => _position;

  set position(String value) {
    _position = value;
  }

  String get idNumber => _idNumber;

  set idNumber(String value) {
    _idNumber = value;
  }

  String get sex => _sex;

  set sex(String value) {
    _sex = value;
  }

  String get lastName => _lastName;

  set lastName(String value) {
    _lastName = value;
  }

  String get firstName => _firstName;

  set firstName(String value) {
    _firstName = value;
  }

  String get userNo => _userNo;

  set userNo(String value) {
    _userNo = value;
  }

  @override
  String toString() {
    return 'User{_userNo: $_userNo, _firstName: $_firstName, _lastName: $_lastName, _sex: $_sex, _idNumber: $_idNumber, _position: $_position, _personalPhone: $_personalPhone}';
  }

}