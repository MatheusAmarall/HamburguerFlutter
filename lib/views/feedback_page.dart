import 'package:flutter/material.dart';
import 'package:helloworld/services/firebase_connect.dart';
import '../components/my_input.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController messageController = TextEditingController();

    limpa_campos() {
      messageController.text = "";
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
            'Feedback',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          MyInput(
            controller: messageController,
            placeholder: 'Message',
            type: false,
            enabled: true,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: (){
              send_feedback(messageController.text);
              limpa_campos();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Feedback enviado com sucesso!')),
              );
            }, 
            style: ElevatedButton.styleFrom(
              minimumSize: Size(450, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text('Enviar'),
          ),
        ],
      ),
    );
  }
}