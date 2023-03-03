import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mp_mobile/src/services/authentication.dart';
import '../../../variables.dart';

class Header extends StatefulWidget {
  final Widget body;

  const Header({super.key, required this.body});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final _currentRoute = Modular.to.path; 

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    HandleAuthentication.handlePermission();
    _isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: _currentRoute.startsWith('/dashboard') ? _dashboardActions() : [],
        backgroundColor: Color.fromARGB(255, 31, 31, 31),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(Variables.title),
          ],
        ),
      ),
      body: _isLoading ? _loadingScreen() : widget.body,
    );
  }

  Widget _loadingScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            backgroundColor: Color.fromARGB(255, 56, 201, 181),
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  List<Widget> _dashboardActions() {
    return [
      IconButton(onPressed: () => HandleAuthentication.destroyToken(), icon: Icon(Icons.logout))
    ];
  }
  
}