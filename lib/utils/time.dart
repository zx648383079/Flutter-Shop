class Time {
  static DateTime timestampTo(String time) {
    return DateTime.parse(time);
  }

  static int secondDiffer(DateTime now, DateTime time) {
    return time.difference(now).inSeconds;
  }

  static String formatAgo(DateTime time, DateTime now) {
    var diff = time.difference(now);
    if (diff.inSeconds < 1) {
      return '刚刚';
    }
    if (diff.inSeconds < 60) {
      return "${diff.inSeconds}秒前";
    }
    if (diff.inMinutes < 60) {
      return "${diff.inMinutes}分钟前";
    }
    if (diff.inHours < 24) {
      return time.day == now.day
          ? "${diff.inMinutes}小时前"
          : "${time.month.toString().padLeft(2, '0')}-${time.day.toString().padLeft(2, '0')}";
    }
    if (time.year == now.year) {
      return "${time.month.toString().padLeft(2, '0')}-${time.day.toString().padLeft(2, '0')}";
    }
    return "${time.year.toString()}-${time.month.toString().padLeft(2, '0')}-${time.day.toString().padLeft(2, '0')}";
  }
}
