import 'package:flutter/material.dart';
import 'package:helloworld/services/firebase_connect.dart';
import 'package:helloworld/views/login_page.dart';
import '../components/my_input.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController addressController = TextEditingController();

    limpa_campos() {
      nameController.text = "";
      phoneController.text = "";
      addressController.text = "";
    };

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'NeedFood',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 40),
          Text(
            'Edição usuário',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          MyInput(
            controller: nameController,
            placeholder: 'Username',
            type: false,
            enabled: true
          ),
          MyInput(
            controller: phoneController,
            placeholder: 'Telefone',
            type: false,
            enabled: true
          ),
          MyInput(
            controller: addressController,
            placeholder: 'Endereço',
            type: false,
            enabled: true
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: (){
              update(nameController.text, phoneController.text, addressController.text);
              limpa_campos();
            }, 
            style: ElevatedButton.styleFrom(
              minimumSize: Size(450, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text('Salvar'),
          ),
        ],
      ),
    );
  }
}