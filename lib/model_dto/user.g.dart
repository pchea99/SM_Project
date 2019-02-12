// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..personalPhone = json['personalPhone'] as String
    ..position = json['position'] as String
    ..idNumber = json['idNumber'] as String
    ..sex = json['sex'] as String
    ..lastName = json['lastName'] as String
    ..firstName = json['firstName'] as String
    ..userNo = json['userNo'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'personalPhone': instance.personalPhone,
      'position': instance.position,
      'idNumber': instance.idNumber,
      'sex': instance.sex,
      'lastName': instance.lastName,
      'firstName': instance.firstName,
      'userNo': instance.userNo
    };
