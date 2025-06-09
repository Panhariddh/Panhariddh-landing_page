class Validators {
  static String? validateNotEmpty(String? value, String fieldName) {
    return (value == null || value.trim().isEmpty) ? '$fieldName is required' : null;
  }

  static String? validateEmail(String? value) {
    if (value == null || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || !RegExp(r'^\d{8,15}$').hasMatch(value)) {
      return 'Enter a valid phone number';
    }
    return null;
  }
}