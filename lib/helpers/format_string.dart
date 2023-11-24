String paragraph(List ls, [String separator = "\n"]) {
  return ls.map((v) => "$v").join(separator);
}

String string(List ls, [String separator = " "]) {
  return ls.map((v) => "$v").join(separator);
}
