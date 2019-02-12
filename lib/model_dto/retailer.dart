class Retailer{
  String _retailerName;
  String _retailerPhone;

  Retailer(
      this._retailerName,
      this._retailerPhone
      );

  String get retailerPhone => _retailerPhone;

  set retailerPhone(String value) {
    _retailerPhone = value;
  }

  String get retailerName => _retailerName;

  set retailerName(String value) {
    _retailerName = value;
  }

  @override
  String toString() {
    return 'Retailer{_retailerName: $_retailerName, _retailerPhone: $_retailerPhone}';
  }

}