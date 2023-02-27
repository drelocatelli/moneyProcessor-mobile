class FormController {

  static String? validate({required String value, required String errorMsg}) {
    if(value.isEmpty || value == null) {
      return errorMsg;
    }

    return null;
  }

  static String? validateEmail({required String value, required String errorMsg}) {
    final bool emailValid = 
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value);

    if(!emailValid) {
      return errorMsg;
    }

    return null;
  }

  static String? size({required String value, required int min, required int max, required String errorMsg}) {
    if(value.length < min || value.length > max) {
      return errorMsg;
    }

    return null;
  }

}