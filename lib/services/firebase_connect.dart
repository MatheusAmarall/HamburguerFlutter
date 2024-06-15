import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:helloworld/firebase_options.dart';
 
login(email, password) async{
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  try {
    var auth = FirebaseAuth.instance;
    await auth.signInWithEmailAndPassword(email:email, password:password);
    return true;
  } catch (e) {
    return false;
  }
}
 
register(name, phone, email, address, password) async{
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  try {
    var auth = FirebaseAuth.instance;
    await auth.createUserWithEmailAndPassword(email:email, password:password);

    var db = FirebaseFirestore.instance;
    db.collection('Users').doc(auth.currentUser!.uid).set({
      'name': name,
      'email': email,
      'phone_number': phone,
      'address': address
    });

    return true;
  } catch (e) {
    return false;
  }
}

update(name, phone, address) async{
  var auth = FirebaseAuth.instance;

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  var db = FirebaseFirestore.instance;
  db.collection('Users').doc(auth.currentUser!.uid).set({
    'name': name,
    'email': auth.currentUser!.email,
    'phone_number': phone,
    'address': address
  });
}

send_feedback(message) async{
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  var db = FirebaseFirestore.instance;
  await db.collection('Feedback').doc('1').set({
      'messages': FieldValue.arrayUnion([message]),
  }, SetOptions(merge: true));
}

get_itens() async{
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  var db = FirebaseFirestore.instance;
  var itens = await db.collection('Itens').get();
  print(itens.docs);
  itens.docs.forEach((item) => {
    print(item.data())
  });
  return itens.docs;
}