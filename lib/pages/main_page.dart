import 'package:flutter/material.dart';
import 'package:wallpaper/pages/home_page.dart';
import 'package:wallpaper/pages/account_page.dart';
import 'package:wallpaper/pages/explore_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _isVisible = true;
  int _curentIndex = 0;
  List<Widget> pages = [];

  @override
  void initState() {
    super.initState();
    pages = [
      MyHomePage(
        onScroll: onScroll,
      ),
      const ExplorePage(),
      const AccountPage(),
    ];
  }

  void onScroll(bool isScroll) {
    setState(() {
      _isVisible = isScroll;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _curentIndex,
        children: pages,
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: _isVisible ? 60 : 0,
        child: Wrap(
          children: [
            BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                fixedColor: Colors.black,
                unselectedItemColor: Colors.grey,
                iconSize: 32,
                currentIndex: _curentIndex,
                onTap: (index) {
                  setState(() {
                    _curentIndex = index;
                  });
                },
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.card_giftcard), label: "Explore"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: "Account")
                ]),
          ],
        ),
      ),
    );
  }
}
