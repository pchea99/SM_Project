class Remark{
  String _agentPerformance;
  String _visitedLocation;
  String _systemIssue;
  String _otherIssue;

  Remark(
      this._agentPerformance,
      this._visitedLocation,
      this._systemIssue,
      this._otherIssue
      );

  String get otherIssue => _otherIssue;

  set otherIssue(String value) {
    _otherIssue = value;
  }

  String get systemIssue => _systemIssue;

  set systemIssue(String value) {
    _systemIssue = value;
  }

  String get visitedLocation => _visitedLocation;

  set visitedLocation(String value) {
    _visitedLocation = value;
  }

  String get agentPerformance => _agentPerformance;

  set agentPerformance(String value) {
    _agentPerformance = value;
  }

  @override
  String toString() {
    return 'Remark{_agentPerformance: $_agentPerformance, _visitedLocation: $_visitedLocation, _systemIssue: $_systemIssue, _otherIssue: $_otherIssue}';
  }

}