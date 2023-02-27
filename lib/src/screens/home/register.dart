import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mp_mobile/src/services/authentication.dart';

import '_handleScreen.dart';

class RegisterScreen extends StatefulWidget {

  final HandleScreen isLoginScreen;
  
  const RegisterScreen({super.key, required this.isLoginScreen});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _repassword = TextEditingController();


  void _submit() {
    debugPrint("submit register");
    // Authentication.register();
  }

  @override
  void dispose() {
    super.dispose();
    _name.dispose();
    _email.dispose();
    _password.dispose();
    _repassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Form(
      child: Center(child: 
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Faça o cadastro", style: TextStyle(fontSize: 25)),
              Container(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(),
                    hintText: "Seu nome",
                  ),
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Digite seu email",
                  labelText: "E-mail",
                  border: OutlineInputBorder()
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Senha",
                    hintText: "**********",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Repita a senha",
                    hintText: "**********",
                  ),
                  onEditingComplete: () {
                    if(formKey.currentState!.validate()) {
                   _submit();
                  }
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      widget.isLoginScreen.toggle();
                    },
                    child: Text("Já possui conta?", style: TextStyle(color: Colors.blue)),
                  ),
                  ElevatedButton(
                    onPressed: () => _submit(), 
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.black)),
                    child: Text("Fazer cadastro"),
                  ),
                ],
              )
          ],
        ),
      )),
    );
  }
}