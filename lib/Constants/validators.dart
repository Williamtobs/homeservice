
class Validators {

  String? validateEmail(String? pass1) {
    RegExp emailValid = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (!(pass1!.isNotEmpty)) {
      return 'Enter email address';
    }
    if (!emailValid.hasMatch(pass1)) {
      return 'Email not correct';
    }
    return null;
  }

  String? validateTextField(String? value) {
    if (!(value!.isNotEmpty)) {
      return 'Field must not be empty';
    }
    return null;
  }

  String? validatePassword(String? pass1) {
    RegExp hasUpper = RegExp(r'[A-Z]');
    RegExp hasLower = RegExp(r'[a-z]');
    RegExp hasDigit = RegExp(r'\d');
    RegExp hasPunct = RegExp(r'[_!@#\$&*~-]');
    if (!RegExp(r'.{6,}').hasMatch(pass1!)) {
      return 'Passwords must have at least 8 characters';
    }
    if (!hasUpper.hasMatch(pass1)) {
      return 'Passwords must have at least one uppercase character';
    }
    if (!hasLower.hasMatch(pass1)) {
      return 'Passwords must have at least one lowercase character';
    }
    if (!hasDigit.hasMatch(pass1)) {
      return 'Passwords must have at least one number';
    }
    if (!hasPunct.hasMatch(pass1)) {
      return 'Passwords need at least one special character like !@#\$&*~-';
    }
    return null;
  }
}