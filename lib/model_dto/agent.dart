class Agent{
  String _agentNo;
  String _agentNameKh;
  String _agentNameEn;

  Agent(
      this._agentNo,
      this._agentNameKh,
      this._agentNameEn
      );

  String get agentNameEn => _agentNameEn;

  set agentNameEn(String value) {
    _agentNameEn = value;
  }

  String get agentNameKh => _agentNameKh;

  set agentNameKh(String value) {
    _agentNameKh = value;
  }

  String get agentNo => _agentNo;

  set agentNo(String value) {
    _agentNo = value;
  }

  @override
  String toString() {
    return 'Agent{_agentNo: $_agentNo, _agentNameKh: $_agentNameKh, _agentNameEn: $_agentNameEn}';
  }
}