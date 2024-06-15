import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/services/firebase_connect.dart';
import 'package:helloworld/views/login_page.dart';
import '../components/my_input.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController repeatPasswordController = TextEditingController();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'NeedFood',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 40),
          Text(
            'Registro',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          MyInput(
            controller: nameController,
            placeholder: 'Name',
            type: false,
            enabled: true
          ),
          MyInput(
            controller: emailController,
            placeholder: 'Email',
            type: false,
            enabled: true
          ),
          MyInput(
            controller: phoneController,
            placeholder: 'Phone',
            type: false,
            enabled: true
          ),
          MyInput(
            controller: addressController,
            placeholder: 'Address',
            type: false,
            enabled: true
          ),
          MyInput(
            controller: passwordController,
            placeholder: 'Password',
            type: true,
            enabled: true
          ),
          MyInput(
            controller: repeatPasswordController,
            placeholder: 'Repeat Password',
            type: true,
            enabled: true
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: (){
              register(nameController.text, phoneController.text, emailController.text, addressController.text, passwordController.text);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
            }, 
            style: ElevatedButton.styleFrom(
              minimumSize: Size(450, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text('Registrar'),
          ),
          SizedBox(height: 20),
          RichText(
            text: TextSpan(
              text: 'Já possui conta? ',
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: 'Logar',
                  style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}