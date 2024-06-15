import 'package:flutter/material.dart';

class RequestsPage extends StatelessWidget {
  RequestsPage({Key? key}) : super(key: key);

  final List<Product> products = [
    Product(
      'https://png.pngtree.com/png-clipart/20230928/original/pngtree-burger-png-images-png-image_13164947.png',
      'Hambúrguer',
      'Restaurante XYZ',
      15.99,
    ),
    Product(
      'https://png.pngtree.com/png-clipart/20230928/original/pngtree-burger-png-images-png-image_13164947.png',
      'Sanduíche de Frango',
      'Restaurante ABC',
      12.50,
    ),
    Product(
      'https://png.pngtree.com/png-clipart/20230928/original/pngtree-burger-png-images-png-image_13164947.png',
      'Sanduíche de Frango',
      'Restaurante ABC',
      12.50,
    ),
    Product(
      'https://png.pngtree.com/png-clipart/20230928/original/pngtree-burger-png-images-png-image_13164947.png',
      'Sanduíche de Frango',
      'Restaurante ABC',
      12.50,
    ),
    // Adicione mais produtos conforme necessário
  ];

  void buy() {
    // Lógica de compra
  }

  @override
  Widget build(BuildContext context) {
    double total = products.fold(0, (sum, item) => sum + item.price);

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
                  childAspectRatio: 1
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          product.imagePath,
                          fit: BoxFit.contain,
                          height: 150,
                        ),
                        SizedBox(height: 10),
                        Text(
                          product.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          product.location,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          'R\$ ${product.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Total: R\$ ${total.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: buy,
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text('Comprar'),
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}

class Product {
  final String imagePath;
  final String title;
  final String location;
  final double price;

  Product(this.imagePath, this.title, this.location, this.price);
}