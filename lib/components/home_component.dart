import 'package:flutter/material.dart';
import 'package:helloworld/services/firebase_connect.dart';

class HomeComponent extends StatelessWidget {
  const HomeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: get_itens(),
      builder: (context, AsyncSnapshot snapshot) {
        print(snapshot);
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
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Ação ao clicar no Hamburguer
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
                                "https://png.pngtree.com/png-clipart/20230928/original/pngtree-burger-png-images-png-image_13164947.png",
                                height: 50,
                                width: 50,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Hamburguer",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Ação ao clicar no Bebida
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
                                "https://png.pngtree.com/png-clipart/20230928/original/pngtree-burger-png-images-png-image_13164947.png",
                                height: 50,
                                width: 50,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Bebida",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Ação ao clicar no Pizza
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
                                "https://png.pngtree.com/png-clipart/20230928/original/pngtree-burger-png-images-png-image_13164947.png",
                                height: 50,
                                width: 50,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Pizza",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Populares",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      Row(
                        children: List.generate(snapshot.data.length, (index) {
                          return Container(
                            width: 200,
                            height: 140,
                            color: Colors.blue,
                            margin: EdgeInsets.all(8),
                          );
                        }),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Recomendados",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      Row(
                        children: List.generate(snapshot.data.length, (index) {
                          return Container(
                            width: 200,
                            height: 140,
                            color: Colors.blue,
                            margin: EdgeInsets.all(8),
                          );
                        }),
                      )
                    ],
                  ),
                ),
              ],
            ));
      },
    );
  }
}
