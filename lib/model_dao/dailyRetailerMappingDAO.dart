import 'package:sm_app/model_dto/address.dart';

class DailyRetailerMappingDAO{
  String _date;
  String _anotherRetailer;
  String _teamNo;
  String _latitude;
  String _longtitude;
  Address _address;
  String _retailerName;
  String _retailerPhone;

  DailyRetailerMappingDAO(){
   address = new Address();
  }

  DailyRetailerMappingDAO.fromJson(Map json){
    teamNo = json['team_no'];
    anotherRetailer = json['another_retailer'];
    date = json['date'];
    address.province = json['province'];
    address.district = json['district'];
    address.commune = json['commune'];
    address.village = json['village'];
    latitude = json['tatitude'];
    longtitude = json['longtitude'];
    retailerName = json['retailer_name'];
    retailerPhone = json['retailer_phone'];
  }

  Map<String, dynamic> toJson() => {
    'team_no': teamNo,
    'date': date,
    'another_retailer': anotherRetailer,
    'province': address.province,
    'district': address.district,
    'commune': address.commune,
    'village': address.village,
    'tatitude': latitude,
    'longtitude': longtitude,
    'retailer_name': retailerName,
    'retailer_phone': retailerPhone
  };

  String get retailerName => _retailerName;

  set retailerName(String value) {
    _retailerName = value;
  }

  String get date => _date;

  set date(String value) {
    _date = value;
  }

  String get anotherRetailer => _anotherRetailer;

  set anotherRetailer(String value) {
    _anotherRetailer = value;
  }

  Address get address => _address;

  set address(Address value) {
    _address = value;
  }

  String get longtitude => _longtitude;

  set longtitude(String value) {
    _longtitude = value;
  }

  String get latitude => _latitude;

  set latitude(String value) {
    _latitude = value;
  }

  String get teamNo => _teamNo;

  set teamNo(String value) {
    _teamNo = value;
  }

  String get retailerPhone => _retailerPhone;

  set retailerPhone(String value) {
    _retailerPhone = value;
  }


}