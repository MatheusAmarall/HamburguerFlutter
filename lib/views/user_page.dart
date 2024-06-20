import 'package:flutter/material.dart';
import 'package:helloworld/services/firebase_connect.dart';
import '../components/my_input.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late Future<Map<String, dynamic>> _userInfoFuture;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _userInfoFuture = _getUserInfo();
  }

  Future<Map<String, dynamic>> _getUserInfo() async {
    Map<String, dynamic> userInfo = await getUserInfo();

    nameController.text = userInfo['name'] ?? '';
    phoneController.text = userInfo['phone_number'] ?? '';
    addressController.text = userInfo['address'] ?? '';

    return userInfo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>>(
        future: _userInfoFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar informações do usuário'));
          }

          return Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'NeedFood',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 40),
                MyInput(
                  controller: nameController,
                  placeholder: 'Username',
                  type: false,
                  enabled: true,
                ),
                MyInput(
                  controller: phoneController,
                  placeholder: 'Telefone',
                  type: false,
                  enabled: true,
                ),
                MyInput(
                  controller: addressController,
                  placeholder: 'Endereço',
                  type: false,
                  enabled: true,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    update_user(
                      nameController.text,
                      phoneController.text,
                      addressController.text,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Usuário alterado com sucesso!')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text('Salvar'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}