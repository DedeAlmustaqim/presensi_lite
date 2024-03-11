class PartDayConverter {
  String partDayToString(int partDay) {
    if (partDay == 1) {
      return "Check In";
    } else if (partDay == 2) {
      return "Check Out";
    } else if (partDay == 3) {
      return "Full Time";
    } else {
      return "Unknown"; // Teks default jika nilai tidak dikenali
    }
  }
}
