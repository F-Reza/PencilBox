import 'package:chat_app/auth/firebase_auth.dart';
import 'package:chat_app/models/user_model.dart';
import 'package:chat_app/pages/profile_page.dart';
import 'package:chat_app/providers/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = 'login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLogin = true, isObscureText = true;
  final formKey = GlobalKey<FormState>();
  String errMsg = '';

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                //mainAxisSize: MainAxisSize.min,
                //mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //const SizedBox(height: 130,),
                  const Text('Chat Room',style: TextStyle(fontSize: 26,fontWeight: FontWeight.w500),),
                  const SizedBox(height: 20,),
                  Image.asset('images/user.jpg',width: 150, height: 150, fit: BoxFit.cover,),
                  const SizedBox(height: 50,),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Email',
                        prefixIcon: const Icon(Icons.email)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password must not be empty!';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
                    controller: passwordController,
                    obscureText: isObscureText,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: 'password',
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(isObscureText
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              isObscureText = !isObscureText;
                            });
                          },
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password must not be empty!';
                      }
                      if (value.length < 6) {
                        return 'Password min 6 character';
                      } else {
                        return null;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          //
                        },
                        child: const Text(
                          'Forget Password?'
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.maxFinite,
                    //height: 40,
                    //color: Colors.blue,
                    decoration: const BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: TextButton(
                      onPressed: () {
                        isLogin = true;
                        authenticate();
                      },
                      child: const Text('Login',style: TextStyle(color: Colors.white),),
                    ),
                  ),
                  Text(errMsg,style: TextStyle(color: Colors.redAccent),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? "),
                      TextButton(
                        onPressed: () {
                          isLogin = false;
                          authenticate();
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.pink),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height:20,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void authenticate()  async{
    if(formKey.currentState!.validate()) {
      bool status;
      try {
        if (isLogin) {
          status = await AuthService.login(
              emailController.text, passwordController.text);
        }
        else {
          status = await AuthService.register(
              emailController.text, passwordController.text);
        }
        if (status) {
          Navigator.pushReplacementNamed(context, ProfilePage.routeName);
          final userModel = UserModel(
              uid: AuthService.user!.uid , 
              email: AuthService.user!.email!);
          if(mounted) {
            await Provider
                .of<UserProvider>(context, listen: false)
                .addUser(userModel);
            Navigator.pushReplacementNamed(context, ProfilePage.routeName);

            print('Login Successfully!');
            Fluttertoast.showToast(
              msg: 'Login Successfully!',
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,);
          }
        }
      }on FirebaseAuthException catch(e) {
        errMsg = e.message!;
        print('User Not Found!');
        Fluttertoast.showToast(
          msg: 'User Not Found!',
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,);
      }
    }
  }



}
