import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:helloworld/firebase_options.dart';
 
login(email, password) async{
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  try {
    var auth = FirebaseAuth.instance;
    await auth.signInWithEmailAndPassword(email:email, password:password);
    print('ok');
    return true;
  } catch (e) {
    print('Error');
    return false;
  }
}
 
register(name, phone, email, password) async{
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  var db = FirebaseFirestore.instance;
  db.collection('Users').doc('1').set({
    'name': name,
    'email': email,
    'phone_number': phone
  });
 
  try {
    var auth = FirebaseAuth.instance;
    await auth.createUserWithEmailAndPassword(email:email, password:password);
    print('ok');
    return true;
  } catch (e) {
    print('Error');
    return false;
  }
}