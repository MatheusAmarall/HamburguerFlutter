import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/services/firebase_connect.dart';
import 'package:helloworld/views/home_page.dart';
import 'package:helloworld/views/register_page.dart';
import '../components/my_input.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    authenticate() async {
      var auth = await login(emailController.text, passwordController.text);
      if (auth == true) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Usuário ou senha incorretos.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Text(
                'NeedFood',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              Text(
                'Login',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              MyInput(
                controller: emailController,
                placeholder: 'Email',
                type: false,
                enabled: true
              ),
              MyInput(
                controller: passwordController,
                placeholder: 'Password',
                type: true,
                enabled: true
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                },
                child: Text('Esqueceu a senha?'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  authenticate();
                  
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(450, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text('Entrar'),
              ),
              Spacer(),
              RichText(
                text: TextSpan(
                  text: 'Não possui conta? ',
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Registre-se',
                      style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => RegisterPage()),
                          );
                        },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}