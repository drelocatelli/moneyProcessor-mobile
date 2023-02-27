import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../services/authentication.dart';
import '_handleScreen.dart';

class LoginScreen extends StatefulWidget {
  final HandleScreen isLoginScreen;
  
  const LoginScreen({super.key, required this.isLoginScreen});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _login = TextEditingController();
  final TextEditingController _password = TextEditingController();

  void _submit() {
    print('submit login');
    Authentication.login(context, login: _login.text, password: _password.text);
  }

  @override
  void dispose() {
    super.dispose();
    _login.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    
    return Form(
      key: formKey,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Faça o login", style: TextStyle(fontSize: 25)),
            Container(height: 20),
            TextFormField(
              controller: _login,
              decoration: const InputDecoration(
                hintText: "Digite seu email",
                border: OutlineInputBorder()
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                controller: _password,
                obscureText: true,
                onEditingComplete: () {
                  if(formKey.currentState!.validate()) {
                   _submit();
                  }
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "**********",
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                   widget.isLoginScreen.toggle();
                  },
                  child: Text("Ainda não possui conta?", style: TextStyle(color: Colors.blue)),
                ),
                ElevatedButton(
                  onPressed: () {
                    if(formKey.currentState!.validate()) {
                      _submit();
                    }
                  }, 
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.black)),
                  child: Text("Fazer login"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}