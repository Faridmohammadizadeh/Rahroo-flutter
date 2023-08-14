import 'package:rahroo/pages/explorePage.dart';
import 'package:rahroo/pages/feedPage.dart';
import 'package:rahroo/pages/profilePage.dart';
import 'package:flutter/material.dart';

// 2
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _homePageState();
  }
}

class _homePageState extends State<HomePage> {
  int _currentPage = 0;

  final List<Widget> _pages = [FeedPage(), ExplorePage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("راهرو"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16.0),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(Icons.add_box_outlined),
            ),
          )
        ],
      ),
      body: _pages[_currentPage],
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
        currentIndex: _currentPage,
        onTap: (_index) {
          setState(() {
            _currentPage = _index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: "تالار",
            icon: Icon(Icons.deck_rounded),
          ),
          BottomNavigationBarItem(
              label: "راهروها", icon: Icon(Icons.crop_portrait_rounded)),
          BottomNavigationBarItem(
              label: "پروفایل", icon: Icon(Icons.account_circle_outlined))
        ]);
  }
}
