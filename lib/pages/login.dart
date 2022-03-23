import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_shop_app/pages/widget/customTextField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Image.asset('assets/images/seller.png',height: 270,),
            ),
          ),
          Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: emailController,
                    data: Icons.email,
                    hintText: 'Email',
                    isObsecre: false,
                    //enabled: false,
                  ),
                  CustomTextField(
                    controller: passwordController,
                    data: Icons.lock,
                    hintText: 'Password',
                    isObsecre: true,
                    //enabled: false,
                  ),
                  ElevatedButton(
                    child: const Text('Sign Up',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.cyan,
                        padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 10)
                    ), onPressed: () =>print('clicked'),
                  ),
                  SizedBox(height: 30,)
                ],
              )
          ),
        ],
      ),
    );
  }
}
