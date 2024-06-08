import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pages = [
    Container(
        color: Colors.purple,
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                height: 150,
                margin: EdgeInsets.all(20),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white),
                    height: 100,
                    margin: EdgeInsets.all(20),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white),
                    height: 100,
                    margin: EdgeInsets.all(20),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white),
                    height: 100,
                    margin: EdgeInsets.all(20),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white),
                    height: 100,
                    margin: EdgeInsets.all(20),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white),
                    height: 130,
                    margin: EdgeInsets.all(20),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white),
                    height: 130,
                    margin: EdgeInsets.all(20),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white),
                    height: 130,
                    margin: EdgeInsets.all(20),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white),
                    height: 130,
                    margin: EdgeInsets.all(20),
                  ),
                ),
              ],
            )
          ],
        )),
    Container(
        color: Colors.purple,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.white),
              width: double.infinity,
              height: 200,
              margin: EdgeInsets.all(20),
            ),
            Column(
              children: [
                Container(
                  child: (Text("Titulo",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ))),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  child: (Text("Lorem",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ))),
                )
              ],
            ),
          ],
        )),
  ];

  int selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "NeedFood",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                onPressed: () {
                },
                icon: Icon(Icons.search, color: Colors.black),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.white,
          child: Icon(Icons.shopping_cart, color: Colors.black),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
          currentIndex: selectedPage,
          onTap: (int index) {
            setState(() => selectedPage = index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Favoritos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.emoji_emotions),
              label: 'Feedback',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.phone),
              label: 'Usuário',
            ),
          ],
          showUnselectedLabels: true,
        ),
        body: pages[selectedPage],
      );
  }
}
