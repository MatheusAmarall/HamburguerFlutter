import 'package:flutter/material.dart';
import '../components/home_component.dart';
import './feedback_page.dart';
import './user_page.dart';
import './requests_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pages = [
    SingleChildScrollView(child: HomeComponent()),
    RequestsPage(),
    FeedbackPage(),
    UserPage(),
  ];

  int selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 20,
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
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favoritos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Feedback',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Usuário',
            ),
          ],
          showUnselectedLabels: true,
        ),
        body: pages[selectedPage],
      );
  }
}
