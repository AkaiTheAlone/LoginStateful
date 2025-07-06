mixin ValidationsMixins {
String? validateEmail(String? value) {
        //return null if the input is valid
        //return a string if the input is invalid

        //this wasn't necessary until dart 2.12, where null safety was introduced
        if (value == null || value.isEmpty) {
          return "Please enter your email address.";
        }
        if (!value.contains("@") || value.isEmpty) {
          return "Please enter a valid email address.";
        }
        return null; //input is valid
  } 
String? validatePassword(String? value) {
        if (value == null || value.isEmpty) 
        {
          return "Please enter your password.";
        }
        if (value.length < 6) 
        {
          return "Password must be at least 6 characters long.";
        }
        return null; //input is valid
  }
}