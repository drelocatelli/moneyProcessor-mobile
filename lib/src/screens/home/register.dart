import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '_handleScreen.dart';

class RegisterScreen extends StatefulWidget {

  final HandleScreen isLoginScreen;
  
  const RegisterScreen({super.key, required this.isLoginScreen});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  @override
  Widget build(BuildContext context) {
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
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Seu nome",
                  ),
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Digite seu email",
                  border: OutlineInputBorder()
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "**********",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
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
                    child: Text("Já possui conta?", style: TextStyle(color: Colors.blue)),
                  ),
                  ElevatedButton(
                    onPressed: () {}, 
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