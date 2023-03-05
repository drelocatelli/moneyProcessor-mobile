import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:indexed/indexed.dart';
import 'package:mp_mobile/src/screens/dashboard/partials/resume.dart';
import 'package:mp_mobile/src/screens/partials/__header.dart';
import 'package:mp_mobile/src/services/authentication.dart';
import 'package:mp_mobile/src/services/dto/resume.dart';
import 'package:mp_mobile/src/services/dto/user.dart';
import 'package:mp_mobile/src/services/resume.dart';
import 'package:mp_mobile/src/services/user.dart';
import 'package:shimmer/shimmer.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  bool _isLoading = false;
  
  User? user;

  _refreshUser() async {
    _isLoading = true;
    setState(() {});
    await _getUser();
    _isLoading = false;
    setState(() {});
  }

  _getUser() async {
    final token = await HandleAuthentication.getToken();
    final response = await UserService.get(context, token: token.toString());
    user = response;
    setState(() {
    });
  }

  @override
  void initState() {
    _refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return Header(
      body: _buildLoadingWidget(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText('Bem vindo, ${user?.name}.'),
              SizedBox(height: 100),
              Resume(),
            ],
          ),
        )
      )
    );
  }

  _buildLoadingWidget({required Widget child}) {
    return Indexer(
      children: [
        Indexed(
          index: 2,
          child: Visibility(
            visible: _isLoading,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Color.fromARGB(255, 117, 91, 74),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Trazendo informações, aguarde...", style: TextStyle(color: Colors.white))],
              ),
            ),
          ),
        ),
        RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: () async => _refreshUser(),
          triggerMode: RefreshIndicatorTriggerMode.onEdge,
          backgroundColor: Color.fromARGB(255, 85, 85, 85),
          color: Color.fromARGB(255, 244, 139, 54),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: child,
              )
            ],
          )
        ),
      ],
    );
  }
  
}