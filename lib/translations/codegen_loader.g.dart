// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> en = {
    "key_password": "Password",
    "key_password_error": "Create a password",
    "key_email": "Email",
    "key_please_enter_valid_email": "Please Fill Email Address",
    "key_name": " Name",
    "key_first_name": "पहला नाम",
    "key_enter_name": "कृपया हमें अपना नाम बताएं",
    "key_next": "Next",
    "key_sign_up": "Sign Up",
    "key_create_an_account": "Create an account",
    "key_phone_number": "Phone Number",
    "key_phone_number_error": "Please tell us your phone number",
    "key_profession": "select a profession",
    "key_registration_succesfull": "Registration Sucessfull",
    "key_already_have_account": "Already Have An Account? Log In Here",
  };
  static const Map<String, dynamic> hi = {
    "key_password": "पारण शब्द",
    "key_password_error": "एक पासवर्ड बनाएं",
    "key_email": "ईमेल",
    "key_please_enter_valid_email": "अपना ईमेल पता भरें",
    "key_name": " नाम",
    "key_first_name": "पहला नाम",
    "key_enter_name": "कृपया हमें अपना नाम बताएं",
    "key_next": "आगामी",
    "key_sign_up": "साइन अप करें",
    "key_create_an_account": "खाता बनाएं",
    "key_phone_number": "फ़ोन नंबर",
    "key_phone_number_error": "कृपया हमें अपना फोन नंबर बताएं",
    "key_profession": "एक पेशा चुनें",
    "key_registration_succesfull": "सफल पंजीकरण",
    "key_already_have_account": "पहले से ही एक खाता है? यहां लॉगिन करें"
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "en": en,
    "hi": hi
  };
}
