import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
 
login_user(email, password) async{
  try {
    var auth = FirebaseAuth.instance;
    await auth.signInWithEmailAndPassword(email:email, password:password);
    return true;
  } catch (e) {
    return false;
  }
}
 
register_user(name, phone, email, address, password) async{
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

update_user(name, phone, address) async{
  var auth = FirebaseAuth.instance;

  var db = FirebaseFirestore.instance;
  db.collection('Users').doc(auth.currentUser!.uid).set({
    'name': name,
    'email': auth.currentUser!.email,
    'phone_number': phone,
    'address': address
  });
}

send_feedback(message) async{
  var db = FirebaseFirestore.instance;
  await db.collection('Feedback').doc('1').set({
      'messages': FieldValue.arrayUnion([message]),
  }, SetOptions(merge: true));
}

Future<List<Map<String, dynamic>>> get_categorias() async {
  var db = FirebaseFirestore.instance;
  var categorias = await db.collection('Categorias').get();

  var retorno = await Future.wait(categorias.docs.map((doc) async {
    var data = doc.data();

    return {
      'nome': data['nome'] ?? '',
      'imagem': data['imagem']
    };
  }).toList());

  return retorno;
}

Future<List<Map<String, dynamic>>> get_itens() async {
  var db = FirebaseFirestore.instance;
  var itens = await db.collection('Itens').get();

  var retorno = await Future.wait(itens.docs.map((doc) async {
    var data = doc.data();

    return {
      'nome': data['nome'] ?? '',
      'imagem': data['imagem'],
      'localizacao': data['localizacao'] ?? '',
      'preco': data['preco']?.toString() ?? '0',
      'descricao': data['descricao'] ?? '',
      'categoria': data['categoria'] ?? ''
    };
  }).toList());

  return retorno;
}

Future<String> addOrRemoveFavorite(Map<String, dynamic> product) async {
  var auth = FirebaseAuth.instance;
  var db = FirebaseFirestore.instance;

  try {
    var userDoc = await db.collection('Users').doc(auth.currentUser!.uid).get();
    List favorites = userDoc.data()?['favorites'] ?? [];

    if (favorites.any((item) => item['nome'] == product['nome'])) {
      await db.collection('Users').doc(auth.currentUser!.uid).update({
        'favorites': FieldValue.arrayRemove([product])
      });
      return 'Produto removido dos favoritos';
    } else {
      await db.collection('Users').doc(auth.currentUser!.uid).update({
        'favorites': FieldValue.arrayUnion([product])
      });
      return 'Produto adicionado aos favoritos';
    }
  } catch (e) {
    return 'Erro ao atualizar favoritos: $e';
  }
}

Future<bool> checkIsFavorite(Map<String, dynamic> product) async {
  var auth = FirebaseAuth.instance;
  var db = FirebaseFirestore.instance;
  var userDoc = await db.collection('Users').doc(auth.currentUser!.uid).get();
  List favorites = userDoc.data()?['favorites'] ?? [];

  return favorites.any((item) => item['nome'] == product['nome']);
}

Future<String> addToCart(Map<String, dynamic> product) async {
  var auth = FirebaseAuth.instance;
  var db = FirebaseFirestore.instance;

  try {
    var userDoc = await db.collection('Users').doc(auth.currentUser!.uid).get();
    List cart = userDoc.data()?['cart'] ?? [];

    if (cart.any((item) => item['nome'] == product['nome'])) {
      return 'Produto já está no carrinho';
    } else {
      await db.collection('Users').doc(auth.currentUser!.uid).update({
        'cart': FieldValue.arrayUnion([product])
      });
      return 'Produto adicionado ao carrinho';
    }
  } catch (e) {
    return 'Erro ao atualizar carrinho: $e';
  }
}

Future<List<Map<String, dynamic>>> getCartItems() async {
  var auth = FirebaseAuth.instance;
  var db = FirebaseFirestore.instance;

  try {
    var userDoc = await db.collection('Users').doc(auth.currentUser!.uid).get();
    List cart = userDoc.data()?['cart'] ?? [];

    List<Map<String, dynamic>> products = cart.map((item) {
      return {
        'nome': item['nome'] ?? '',
        'imagem': item['imagem'] ?? '',
        'localizacao': item['localizacao'] ?? '',
        'preco': item['preco']?.toString() ?? '0',
      };
    }).toList();

    return products;
  } catch (e) {
    print('Erro ao obter itens do carrinho: $e');
    return [];
  }
}

Future<List<Map<String, dynamic>>> getFavorites() async {
  var auth = FirebaseAuth.instance;
  var db = FirebaseFirestore.instance;

  try {
    var userDoc = await db.collection('Users').doc(auth.currentUser!.uid).get();
    List favorites = userDoc.data()?['favorites'] ?? [];

    List<Map<String, dynamic>> products = favorites.map((item) {
      return {
        'nome': item['nome'] ?? '',
        'imagem': item['imagem'] ?? '',
        'localizacao': item['localizacao'] ?? '',
        'preco': item['preco']?.toString() ?? '0',
      };
    }).toList();

    return products;
  } catch (e) {
    print('Erro ao obter itens do carrinho: $e');
    return [];
  }
}