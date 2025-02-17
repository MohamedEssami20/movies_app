String? validationEmail(String? value) {
  RegExp regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  if (value!.isEmpty) {
    return "Please enter your email";
  } else if (value.isNotEmpty) {
    if (regex.hasMatch(value)) {
      return null;
    } else {
      return "Please enter a valid email";
    }
  }
  return null;
}
