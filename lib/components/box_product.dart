import 'package:flutter/material.dart';

class BoxProduct extends StatelessWidget {
  String nome;
  String localizacao;
  String preco;
  String imagem;

  BoxProduct(
      {Key? key,
      required this.nome,
      required this.localizacao,
      required this.preco,
      required this.imagem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      width: 250,
      height: 250,
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            imagem,
            height: 130,
            width: 130,
            fit: BoxFit.cover,
          ),
          Text(
            nome,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            localizacao,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          Text(
            "R\$ ${preco}",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
