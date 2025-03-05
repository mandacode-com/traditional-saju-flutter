import 'package:saju/config/config.dart';
import 'package:saju/base_info/member_info/view/member_info_page.dart';
import 'package:saju/daily_saju_result/view/result_page.dart';
import 'package:saju/themes/page_navigation_button_theme.dart';
import 'package:saju/widgets/page_navigation_button.dart';
import 'package:flutter/material.dart';
import 'package:saju/yearly_saju_result/view/result_page.dart';

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
              padding:
                  MediaQuery.of(context).orientation == Orientation.landscape
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
                        title: '정통사주', description: '정확하게 들어맞는 정통사주풀이'),
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
      spacing: 10,
      children: <Widget>[
        Text(title,
            style: TextStyle(
                fontFamily: 'SSRock',
                fontWeight: FontWeight.normal,
                fontSize: 40,
                color: const Color.fromRGBO(0, 0, 0, 1))),
        Text(
          description,
          style: TextStyle(
            fontFamily: 'MapoFlowerIsland',
            fontWeight: FontWeight.bold,
            fontSize: 16,
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
          page: UserInfoPage(targetPage: DailySajuResultPage()),
          text: '오늘의 운세',
          theme: ObscurePageNavigationButtonTheme(),
        ),
        const SizedBox(height: 20),
        PageNavigationButton(
          page: UserInfoPage(targetPage: YearlySajuResultPage()),
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
        fontFamily: 'NanumSquareNeo',
        fontWeight: FontWeight.w800,
        fontSize: 14,
      ),
    );
  }
}
