class Date {
  static String formatDate(List<String> date) {
    final sDate = {
      "dd": date[2],
      "mm": date[1],
      "yy": date[0],
    };
    return "${sDate["dd"]}/${sDate["mm"]}/${sDate["yy"]}";
  }

  static int calcDateDiff(List<String> start, List<String> end) {
    final startDate = DateTime(int.parse(start[0]), int.parse(start[1]), int.parse(start[2]));
    final endDate = DateTime(int.parse(end[0]), int.parse(end[1]), int.parse(end[2]));
    final difference = endDate.difference(startDate).inDays;

    return difference;
  }
}