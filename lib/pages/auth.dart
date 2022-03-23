import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_shop_app/pages/login.dart';
import 'package:food_shop_app/pages/register.dart';

class Authentification extends StatefulWidget {
  const Authentification({Key? key}) : super(key: key);

  @override
  _AuthentificationState createState() => _AuthentificationState();
}

class _AuthentificationState extends State<Authentification> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: const Color(0xFFf6f5f4),
          appBar: AppBar(
            elevation: 0,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                color: Colors.cyan
              ),
            ),
            title: const Text('iFood',
              style: TextStyle(
              fontSize: 60,
              color: Colors.white,
              fontFamily: 'Lobster'
            ),
            ),
            centerTitle: true,
            bottom: const TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.lock,color: Colors.white,
                    ),
                    text: 'Login',
                  ),
                  Tab(
                    icon: Icon(Icons.person,color: Colors.white,
                    ),
                    text: 'Register',
                  ),
                ],
              indicatorColor: Colors.white38,
              indicatorWeight: 6,
            ),
          ),
          body: Container(
            child: const TabBarView(
              children: [
                LoginPage(),
                RegisterPage()
              ],
            ),
          ),
        )
    );
  }
}
