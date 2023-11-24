String formatDuration(int? duration) {
  if (duration == null) return "";
  return Duration(seconds: duration).inHours.toString();
}
