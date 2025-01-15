import 'package:byul_mobile/new_year_saju/member_info/view/member_info_page.dart';
import 'package:byul_mobile/themes/page_navigation_button_theme.dart';
import 'package:byul_mobile/widgets/page_navigation_button.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key, required this.title});

  final String title;

  static final EdgeInsets padding =
      const EdgeInsets.symmetric(vertical: 120, horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Builder(builder: (BuildContext context) {
        return FloatingActionButton(
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
          elevation: 0,
          hoverElevation: 0,
          highlightElevation: 0,
          focusElevation: 0,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          splashColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          child: const Icon(Icons.menu),
        );
      }),
      endDrawer: const MainPageDrawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: padding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const MainPageTitle(
                    title: '별조각', description: '오늘 당신의 별은 어떻게 움직일까요?'),
                const Spacer(),
                const MainPageNavigation(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MainPageTitle extends StatelessWidget {
  const MainPageTitle(
      {super.key, required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(title,
            style: TextStyle(
                fontFamily: 'Hakgyoansim',
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: const Color.fromRGBO(0, 0, 0, 1))),
        const SizedBox(height: 20),
        Text(
          description,
          style: TextStyle(
            fontFamily: 'MapoFlowerIsland',
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: const Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
      ],
    );
  }
}

class MainPageNavigation extends StatelessWidget {
  const MainPageNavigation({super.key});

  final Color buttonBackgroundColor = const Color.fromRGBO(255, 255, 255, 0.8);
  final Size buttonMinimumSize = const Size(double.infinity, 50);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PageNavigationButton(
          page: NewYearSajuMemberInfoPage(),
          text: '오늘의 운세',
          theme: ObscurePageNavigationButtonTheme(),
        ),
        const SizedBox(height: 20),
        PageNavigationButton(
          page: NewYearSajuMemberInfoPage(),
          text: '🐍 2025년 신년운세 🐍',
          theme: ObscurePageNavigationButtonTheme(),
        ),
      ],
    );
  }
}

class MainPageDrawer extends StatelessWidget {
  const MainPageDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child: Text('별조각 사주'),
          ),
          ListTile(
            title: const Text('오늘의 운세'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('🐍 2025년 신년운세 🐍'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
