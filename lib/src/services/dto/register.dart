// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class IRegister {
  late String name;
  late String email;
  late String password;
  late String password_confirmation;

  IRegister({
    required this.name, 
    required this.email, 
    required this.password, 
    required this.password_confirmation
  });

  IRegister.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    password_confirmation = json['password_confirmation'];
  }
  

  Map<String, dynamic> toJSON() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': password_confirmation,
    };
  }
}
