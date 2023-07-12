import 'dart:developer';

RegExp validationName = RegExp(r'^[A-Z a-z]+$');
String fonlycharvalidation = "Name should not contain any special characters or numbers!";
String lonlycharvalidation = "Name should not contain any special characters or numbers!";
String phoneMessage = "Contact number should be between 6 to 15 digits.";
RegExp validateEmail = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
String emailMessage = "Please enter valid Email ID";
RegExp validatePassword = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,16}$');
String passwordMessage = "Password should be Between 8-16 characters long. And it should contain Atleast One Number, One Special Character,One Uppercase and One Lowercase.";
String mainconfirmpasswordValidation = "New Password & Confirm Password must be same.";
String EmailMessage = "Please enter valid email address.";
bool checkemail(String email) {
  if (validateEmail.hasMatch(email) == true) {
    List data = email.split("@");
    List data1 = data[1].toString().split(".");
    log(data.toString());
    if (data1.length > 2) {
      return false;
    } else {
      return true;
    }
  } else {
    return false;
  }
}

