import '../battery_alert.dart';

class TimeFormatter {
  static String formatTime(DateTime time) {
    return DateFormat('HH:mm:ss').format(time);
  }

  static String formatDate(DateTime date) {
    return DateFormat('MMM d').format(date);
  }

  static String formatDuration(Duration duration) {
    return "${duration.inHours}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}";
  }
}
