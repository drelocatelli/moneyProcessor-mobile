class IRegister {
  String name;
  String email;
  String password;
  String password_confirmation;

  IRegister({
    required this.name, 
    required this.email, 
    required this.password, 
    required this.password_confirmation
  });
  
}