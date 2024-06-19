import 'package:flutter/material.dart';
import 'package:helloworld/components/box_product.dart';
import 'package:helloworld/services/firebase_connect.dart';

class FavoritesPage extends StatelessWidget {
  FavoritesPage({Key? key}) : super(key: key);

  void buy() {}

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
          future: getFavorites(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(
                  child: Text('Erro ao carregar os favoritos'));
            }
            List<Map<String, dynamic>> products = snapshot.data ?? [];

            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.all(2),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 1,
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return BoxProduct(
                            nome: product['nome'],
                            localizacao: product['localizacao'],
                            preco: product['preco'],
                            imagem: product['imagem']);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
  }
}
