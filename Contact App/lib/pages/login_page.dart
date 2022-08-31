import 'package:contact/auth/auth_prefs.dart';
import 'package:contact/pages/contact_list.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('images/person.png',
                width: 200,height: 200,fit: BoxFit.cover,
              ),
              const SizedBox(height: 10,),
              const Text('Login Page',style: TextStyle(fontSize: 24),),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email)
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: passwordController,
                obscureText: isObscure,
                decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                  suffix: IconButton(
                      onPressed: (){
                        setState(() {
                          isObscure =! isObscure;
                        });
                      },
                      icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
                  ),
                ),
              ),
              const SizedBox(height: 25,),
              Container(
                width: 100,
                height: 35,
                decoration: const BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.all(
                        Radius.circular(10.0)
                    ),
                ),
                child: TextButton(
                    onPressed: (){
                      setLoginStatus(true).then((value) => 
                          Navigator.pushReplacementNamed
                            (context, ContactList.routeName));
                    },
                    child: const Text('LOGIN')
                ),
              ),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
