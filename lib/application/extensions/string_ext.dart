extension StringExtensions on String {
  String get initials {
    List<String> parts = split(' ');
    if (parts.length > 1) {
      return parts[0][0].toUpperCase() + parts[1][0].toUpperCase();
    }
    return length > 1
        ? substring(0, 2).toUpperCase()
        : padRight(2).substring(0, 2).toUpperCase();
  }
}
