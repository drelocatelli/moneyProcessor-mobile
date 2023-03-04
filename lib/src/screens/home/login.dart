import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../services/authentication.dart';
import '_handleScreen.dart';

class LoginScreen extends StatefulWidget {
  final HandleScreen isLoginScreen;
  
  const LoginScreen({super.key, required this.isLoginScreen});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>(debugLabel: 'login');
  final TextEditingController _login = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _saveLogin = true;

  void _submit() {
    print('submit login');
    final form = _formKey.currentState;

    if(form != null && form.validate()) {
      Authentication.login(context, login: _login.text, password: _password.text, saveLogin: _saveLogin);
      form.save();
    }
  }

  void _toggleSaveLogin() {
    _saveLogin = !_saveLogin;
    setState(() {
    });
  }

  @override
  void dispose() {
    super.dispose();
    _login.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return  Form(
      key: _formKey,
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
                   _submit();
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
                  onTap: () => _toggleSaveLogin(),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Row(
                      children: [
                        Checkbox(
                          activeColor: Colors.black,
                          onChanged: (bool? value) => _toggleSaveLogin(), 
                          value: _saveLogin,
                        ),
                        Text("Manter conectado")
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                      _submit();
                  }, 
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.black)),
                  child: Text("Logar"),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                widget.isLoginScreen.toggle();
              },
              child: Text("Ainda não possui conta?", style: TextStyle(color: Colors.blue)),
            ),
          ],
        ),
      ),
    );
  }
}