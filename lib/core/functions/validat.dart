String? validator(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return "$type cannot be empty";
  }
  if (val.length < min) {
    return '$type must be more than $min charater';
  }
  if (val.length > max) {
    return '$type must be less than $max charater';
  }
  return null;
}
