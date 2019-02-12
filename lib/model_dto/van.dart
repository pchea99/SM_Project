class Van{
  String _driverName;
  String _driverID;
  String _plaqueNumber;

  Van(
      this._driverName,
      this._driverID,
      this._plaqueNumber
      );

  String get plaqueNumber => _plaqueNumber;

  set plaqueNumber(String value) {
    _plaqueNumber = value;
  }

  String get driverID => _driverID;

  set driverID(String value) {
    _driverID = value;
  }

  String get driverName => _driverName;

  set driverName(String value) {
    _driverName = value;
  }

  @override
  String toString() {
    return 'Van{_driverName: $_driverName, _driverID: $_driverID, _plaqueNumber: $_plaqueNumber}';
  }

}