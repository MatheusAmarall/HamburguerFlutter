import 'package:flutter/material.dart';
import 'package:helloworld/components/box_product.dart';
import 'package:helloworld/services/firebase_connect.dart';
import 'package:helloworld/views/product_detail_page.dart';

class CategoryPage extends StatelessWidget {
  var category;

  CategoryPage({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: getCategoryItems(category),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar itens por categoria'));
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
                      var product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailPage(product: product),
                            ),
                          );
                        },
                        child: BoxProduct(
                          nome: product['nome'],
                          localizacao: product['localizacao'],
                          preco: product['preco'],
                          imagem: product['imagem'],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
