class FormatRunningCount {
  final double _runningCount;
  final bool _halvesEnabled;

  FormatRunningCount(this._runningCount, this._halvesEnabled);

  format() {
    String _runningCountType = 'int';
    String _leadingSymbol = '';
    String _countValue = '';
    String _outputText = '';

    if (_halvesEnabled == true) {
      //* Sets the type to display
      _runningCountType = 'double';
    }
    if (_runningCount > 0) _leadingSymbol = '+';

    if (_runningCountType == 'int') {
      _countValue = _runningCount.toInt().toString();
    } else {
      _countValue = _runningCount.toString();
    }
    _outputText = _leadingSymbol + _countValue;

    return _outputText;
  }
}
