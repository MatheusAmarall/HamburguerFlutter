import 'package:flutter/material.dart';
import 'package:helloworld/components/box_product.dart';
import 'package:helloworld/services/firebase_connect.dart';
import 'package:helloworld/views/product_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait<List<Map<String, dynamic>>>([
        get_categorias(),
        get_itens(),
      ]),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (snapshot.hasData) {
          var categorias = snapshot.data![0] as List<Map<String, dynamic>>;
          var itens = snapshot.data![1] as List<Map<String, dynamic>>;

          return Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  color: Colors.yellow,
                  height: 150,
                  width: double.infinity,
                  margin: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Aqui tem as melhores opções!",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: double.infinity,
                        width: 200,
                        child: Image.network(
                          "https://png.pngtree.com/png-clipart/20230928/original/pngtree-burger-png-images-png-image_13164947.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Categorias",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(categorias.length, (index) {
                      var categoria = categorias[index];
                      return GestureDetector(
                        onTap: () {
                          // Ação ao clicar na categoria
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 5.0,
                                spreadRadius: 2.0,
                                offset: Offset(2.0, 2.0),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          width: 120,
                          height: 120,
                          margin: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                categoria['imagem'],
                                height: 50,
                                width: 50,
                              ),
                              SizedBox(height: 10),
                              Text(
                                categoria['nome'],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Produtos",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(itens.length, (index) {
                      var item = itens[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                ProductDetailPage(product: item),
                            ),
                          );
                        },
                        child: BoxProduct(nome: item['nome'], imagem: item['imagem'], localizacao: item['localizacao'], preco: item['preco'],),
                      );
                    }),
                  ),
                )
              ],
            ),
          );
        } else {
          return Center(child: Text("Sem registros encontrados"));
        }
      },
    );
  }
}
