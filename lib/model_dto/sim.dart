class Sim{
  double _masterSIM;
  double _masterSIMPassword;
  double _registeredSIM;
  double _slaveSIM;
  double _slaveSIMPassword;

  Sim(
      this._masterSIM,
      this._masterSIMPassword,
      this._registeredSIM,
      this._slaveSIM,
      this._slaveSIMPassword
      );

  double get masterSIM => _masterSIM;

  set masterSIM(double value) {
    _masterSIM = value;
  }

  @override
  String toString() {
    return 'Sim{_masterSIM: $_masterSIM, _masterSIMPassword: $_masterSIMPassword, _registeredSIM: $_registeredSIM, _slaveSIM: $_slaveSIM, _slaveSIMPassword: $_slaveSIMPassword}';
  }

  double get masterSIMPassword => _masterSIMPassword;

  set masterSIMPassword(double value) {
    _masterSIMPassword = value;
  }

  double get registeredSIM => _registeredSIM;

  set registeredSIM(double value) {
    _registeredSIM = value;
  }

  double get slaveSIM => _slaveSIM;

  set slaveSIM(double value) {
    _slaveSIM = value;
  }

  double get slaveSIMPassword => _slaveSIMPassword;

  set slaveSIMPassword(double value) {
    _slaveSIMPassword = value;
  }

}