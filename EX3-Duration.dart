class customDuration {
  int _duration; // stored in milliseconds

  customDuration.hour(int hours) : _duration = hours * 3600000;
  customDuration.minute(int minutes): _duration = minutes*60000;
  int get milliseconds => _duration;

}