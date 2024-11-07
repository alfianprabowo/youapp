extension FormValidator on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp = RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }
}

//  bool isEmailValid(String email) { 
//     return RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$').hasMatch(email);
//   }

//   _validateEmail(String value) {
//     if (value.isEmpty) {
//       setState(() {
//         _emailErrorText = 'Email is required';
//       });
//     } else if (!isEmailValid(value)) {
//       setState(() {
//         _emailErrorText = 'Enter a valid email address';
//       });
//     } else {
//       setState(() {
//         _emailErrorText = "";
//       });
//     }
//   }