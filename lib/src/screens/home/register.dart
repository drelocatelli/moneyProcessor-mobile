import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mp_mobile/src/controllers/FormController.dart';
import 'package:mp_mobile/src/services/authentication.dart';
import 'package:mp_mobile/src/services/dto/register.dart';

import '_handleScreen.dart';

class RegisterScreen extends StatefulWidget {

  final HandleScreen isLoginScreen;
  
  const RegisterScreen({super.key, required this.isLoginScreen});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final _formKey = GlobalKey<FormState>(debugLabel: 'register');
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _repassword = TextEditingController();


  void _submit() {
    debugPrint("submit register");
    final form = _formKey.currentState;

    if(form!.validate()) {
      debugPrint(_name.text);
      Authentication.register(
        IRegister(
          name: _name.text, 
          email: _email.text, 
          password: _password.text,
          password_confirmation: _repassword.text)
      );
    }
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

    return Form(
      key: _formKey,
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
                  controller: _name,
                  validator: (value) => FormController.validate(value: value.toString(), errorMsg: "O campo nome é obrigatório"),
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(),
                    hintText: "Seu nome",
                  ),
                ),
              ),
              TextFormField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                validator: (value) => FormController.validateEmail(value: value.toString(), errorMsg: "Informe um e-mail válido"),
                decoration: const InputDecoration(
                  hintText: "Digite seu email",
                  labelText: "E-mail",
                  border: OutlineInputBorder()
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  controller: _password,
                  obscureText: true,
                  validator: (value) => FormController.size(value: value.toString(), min: 5, max: 15, errorMsg: "A senha deve conter entre 5 e 15 caracteres"),
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
                  controller: _repassword,
                  obscureText: true,
                  validator: (value) => FormController.validate(value: value.toString(), errorMsg: "O campo não pode ser nulo"),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Repita a senha",
                    hintText: "**********",
                  ),
                  onEditingComplete: () {
                    _submit();
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
                    onPressed: () {
                      _submit();
                    }, 
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