class customDuration {
  int _duration = 0; // stored in milliseconds

  customDuration();
  customDuration.fromHour(int hours) : _duration = hours * 3600000;
  customDuration.fromMinute(int minutes): _duration = minutes*60000;
  customDuration.fromSecond(int seconds): _duration = seconds*1000;
  customDuration.fromMilliseconds(int milliseconds): _duration = milliseconds;
  int get milliseconds => _duration;

  bool operator >(customDuration other) => _duration > other._duration;

  customDuration operator + (customDuration other){
    var newDuration = customDuration();
    newDuration._duration= this._duration + other._duration;
    return newDuration;
  }
  customDuration operator - (customDuration other){
    var newDuration = customDuration();
    newDuration._duration= this._duration - other._duration;
    return newDuration;
  }
}

void main() {
  var d1 = customDuration.fromHour(2);       // 2 hours
  var d2 = customDuration.fromMinute(90);    // 90 minutes

  // comparison using overloaded >
  if (d1 > d2) {
    print('d1 is greater');
  } else {
    print('d2 is greater or equal');
  }

  // arithmetic using overloaded + and -
  var sum = d1 + d2;
  var diff = d1 - d2;

  print('d1 ms: ${d1.milliseconds}');
  print('d2 ms: ${d2.milliseconds}');
  print('sum ms: ${sum.milliseconds}');
  print('diff ms: ${diff.milliseconds}');
}