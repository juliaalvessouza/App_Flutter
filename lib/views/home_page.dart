import 'package:app_flutter/views/favorite_screen.dart';
import 'package:app_flutter/views/meat_screen.dart';
import 'package:app_flutter/views/profile_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final PageController pageController = PageController();
int currentPage = 0;

class _HomePageState extends State<HomePage> {
  //criar métodos para navegar

  void onTap(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: const [MeatScreen(), FavoriteScreen(), ProfileScreen()],
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTap,
          currentIndex: currentPage,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favorite"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_4_outlined), label: "Profile"),
          ]),
    );
  }
}
