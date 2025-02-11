import 'package:saju/config/config.dart';
import 'package:saju/yearly_saju/member_info/view/member_info_page.dart';
import 'package:saju/themes/page_navigation_button_theme.dart';
import 'package:saju/widgets/page_navigation_button.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
          foregroundColor: Colors.black,
          child: const Icon(Icons.menu),
        );
      }),
      endDrawer: _MainPageDrawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: MediaQuery.of(context).orientation ==
                      Orientation.landscape
                  ? Config.getLandScapeHorizontalPadding(context).copyWith(
                      top: 40,
                      bottom: 40,
                    )
                    : Config.verticalHomePadding,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _MainPageTitle(
                        title: '별조각', description: '오늘 당신의 별은 어떻게 움직일까요?'),
                    Spacer(),
                    _MainPageNavigation(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MainPageTitle extends StatelessWidget {
  const _MainPageTitle({required this.title, required this.description});

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
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 0.1
              ..color = Colors.black,
            fontFamily: 'MapoFlowerIsland',
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class _MainPageNavigation extends StatelessWidget {
  final Color buttonBackgroundColor = const Color.fromRGBO(255, 255, 255, 0.8);
  final Size buttonMinimumSize = const Size(double.infinity, 50);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PageNavigationButton(
          page: YearlySajuMemberInfoPage(),
          text: '오늘의 운세',
          theme: ObscurePageNavigationButtonTheme(),
        ),
        const SizedBox(height: 20),
        PageNavigationButton(
          page: YearlySajuMemberInfoPage(),
          text: '🐍 2025년 신년운세 🐍',
          theme: ObscurePageNavigationButtonTheme(),
        ),
      ],
    );
  }
}

class _MainPageDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              title: const _ListTitleText(text: '구매내역'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const _ListTitleText(text: '문의하기'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const _ListTitleText(text: '다른 운세가 궁금하면?'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ListTitleText extends StatelessWidget {
  const _ListTitleText({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.right,
      style: TextStyle(
        fontFamily: 'MapoFlowerIsland',
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );
  }
}
