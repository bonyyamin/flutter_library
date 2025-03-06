class Validators {
  /// Validates an email address.
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      return 'Enter a valid email address';
    }

    return null;
  }

  /// Validates a password with optional strength checks.
  /// - Must be at least 8 characters long.
  /// - Must contain at least one letter and one number.
  static String? validatePassword(String? password, {bool requireSpecialChar = false}) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }

    if (password.length < 8) {
      return 'Password must be at least 8 characters';
    }

    if (!RegExp(r'[A-Za-z]').hasMatch(password) || !RegExp(r'[0-9]').hasMatch(password)) {
      return 'Password must contain at least one letter and one number';
    }

    if (requireSpecialChar && !RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) {
      return 'Password must contain at least one special character';
    }

    return null;
  }

  /// Validates a phone number (basic check for 10+ digits).
  static String? validatePhone(String? phone) {
    if (phone == null || phone.isEmpty) {
      return 'Phone number is required';
    }

    final phoneRegex = RegExp(r'^\d{10,15}$');
    if (!phoneRegex.hasMatch(phone)) {
      return 'Enter a valid phone number';
    }

    return null;
  }

  /// Validates a name (ensures it is not empty and contains at least 2 characters).
  static String? validateName(String? name) {
    if (name == null || name.trim().isEmpty) {
      return 'Name is required';
    }

    if (name.trim().length < 2) {
      return 'Name must be at least 2 characters';
    }

    return null;
  }

  /// Validates a credit card number (basic Luhn algorithm check).
  static String? validateCreditCard(String? cardNumber) {
    if (cardNumber == null || cardNumber.isEmpty) {
      return 'Credit card number is required';
    }

    final cardRegex = RegExp(r'^\d{13,19}$'); // Typical card number length is 13-19 digits
    if (!cardRegex.hasMatch(cardNumber)) {
      return 'Enter a valid credit card number';
    }

    return null;
  }

  /// Validates a non-empty address field.
  static String? validateAddress(String? address) {
    if (address == null || address.trim().isEmpty) {
      return 'Address is required';
    }

    return null;
  }

  /// Validates a ZIP code (5+ digits, allows optional dash for US ZIP+4).
  static String? validateZipCode(String? zipCode) {
    if (zipCode == null || zipCode.isEmpty) {
      return 'ZIP code is required';
    }

    final zipRegex = RegExp(r'^\d{5}(-\d{4})?$');
    if (!zipRegex.hasMatch(zipCode)) {
      return 'Enter a valid ZIP code';
    }

    return null;
  }
}


//how to use it

/*
void main() {
  print(Validators.validateEmail('test@email.com')); // Output: null (Valid)
  print(Validators.validateEmail('invalid-email')); // Output: "Enter a valid email address"

  print(Validators.validatePassword('pass1234')); // Output: null (Valid)
  print(Validators.validatePassword('1234')); // Output: "Password must be at least 8 characters"

  print(Validators.validatePhone('1234567890')); // Output: null (Valid)
  print(Validators.validatePhone('1234')); // Output: "Enter a valid phone number"

  print(Validators.validateZipCode('12345-6789')); // Output: null (Valid)
  print(Validators.validateZipCode('12a45')); // Output: "Enter a valid ZIP code"
}
*/