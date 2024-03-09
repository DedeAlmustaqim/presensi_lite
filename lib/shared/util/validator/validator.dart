class Validator {
  static String? rule(
    String? value, {
    bool required = false,
  }) {
    if (required && value!.isEmpty) {
      return "This field is required";
    }
    return null;
  }

  static String? required(
    dynamic value, {
    String? fieldName,
  }) {
    if (value == null) {
      return "Kolom ini Wajib disi";
    }

    if (value is String || value == null) {
      if (value.toString() == "null") return "Kolom ini Wajib disi";
      if (value.isEmpty) return "Kolom ini Wajib disi";
    }

    if (value is List) {
      if (value.isEmpty) return "Kolom ini Wajib disi";
    }
    return null;
  }

  static String? email(String? value) {
    if (value!.isEmpty) return "Kolom ini Wajib disid";

    final bool isValidEmail = RegExp(
            "^[a-zA-Z0-9.a-zA-Z0-9.!#\$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+")
        .hasMatch(value);

    if (!isValidEmail) {
      return "This field is not in a valid email format";
    }
    return null;
  }

  static String? number(String? value) {
    if (value!.isEmpty) return "This field is required";

    final bool isNumber = RegExp(r"^[0-9]+$").hasMatch(value);
    if (!isNumber) {
      return "This field is not in a valid number format";
    }
    return null;
  }

  static String? atLeastOneitem(List<Map<String, dynamic>> items) {
    var checkedItems = items.where((i) => i["checked"] == true).toList();
    if (checkedItems.isEmpty) {
      return "Anda harus memilih salah satu";
    }
    return null;
  }
}
