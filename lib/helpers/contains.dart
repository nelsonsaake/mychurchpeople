bool contains(String? s1, String? s2) {
  if (s1 == null || s2 == null) return false;
  return s1.toLowerCase().contains(s2.toLowerCase());
}
