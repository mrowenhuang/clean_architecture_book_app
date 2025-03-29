class Time {
  final time = DateTime.now().hour;

  String timeStatus() {
    if (time >= 6 && time <= 11) {
      return "Good Morning";
    } else if (time >= 12 && time <= 15) {
      return "Good Afternoon";
    } else if (time >= 16 && time <= 18) {
      return "Good Evening";
    } else {
      return "Good Night";
    }
  }
}
