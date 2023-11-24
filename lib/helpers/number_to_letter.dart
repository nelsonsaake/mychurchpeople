String numberToLetter(int? number) {
  int v = number ?? 1;

  if (v <= 0) {
    throw ArgumentError("Number must be greater than 0");
  }

  int base = 'a'.codeUnitAt(0) - 1;
  String letters = '';

  while (v > 0) {
    int remainder = (v) % 26;
    letters = String.fromCharCode(base + remainder) + letters;
    v = (v - remainder) ~/ 26;
  }

  return letters.toUpperCase();
}
