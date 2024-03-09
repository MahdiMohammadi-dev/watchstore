String formatTime(int sec) {
  String resultFormat;
  final duration = Duration(seconds: sec);

  int hours = duration.inHours;
  int minutes = duration.inMinutes.remainder(60);
  int seconds = duration.inSeconds.remainder(60);

  if (sec > 3600) {
    resultFormat = "$hours:$minutes:$seconds";
  } else {
    resultFormat = "$minutes:$seconds";
  }

  return resultFormat;
}
