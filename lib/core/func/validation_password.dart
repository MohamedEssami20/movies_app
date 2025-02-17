String? validationPassword(String? value) {
  if (value!.isEmpty) {
    return "Please enter your password";
  } else if (value.isNotEmpty) {
     if(value.length<8){
       return "Password must be at least 8 characters";
     }
  }
  return null;
}