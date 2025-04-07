import 'package:flutter/material.dart';
import 'package:saju_mobile_v1/common/widgets/layouts/adaptive_column.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Builder(
        builder: (BuildContext context) {
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
        },
      ),
      endDrawer: _MainPageDrawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      backgroundColor: const Color(0xFFFDFBF3),
      body: Center(
        child: AdaptiveColumn(
          spacing: 60,
          children: [
            const _HomePageTitle(
              title: '정통사주',
              description: '정확하게 들어맞는 정통사주풀이',
            ),
            Column(
              spacing: 40,
              children: [
                ItemButton(
                  title: '🐍 2025년 신년운세 🐍',
                  onPressed: () {},
                  image: const AssetImage('assets/images/item_logo/yearly.png'),
                  price: 4900,
                ),
                ItemButton(
                  title: '오늘의 운세',
                  onPressed: () {},
                  image: const AssetImage('assets/images/item_logo/daily.png'),
                  price: 0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _HomePageTitle extends StatelessWidget {
  const _HomePageTitle({required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'SSRock',
            fontWeight: FontWeight.normal,
            fontSize: 40,
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
        Text(
          description,
          style: const TextStyle(
            fontFamily: 'MapoFlowerIsland',
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class ItemButton extends StatelessWidget {
  ItemButton({
    required this.title,
    required this.onPressed,
    required this.price,
    required this.image,
    super.key,
  });

  final String title;
  final VoidCallback onPressed;
  final int price;
  final AssetImage image;

  final BorderRadius _borderRadius = BorderRadius.circular(10);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                ClipRRect(
                  borderRadius: _borderRadius,
                  child: Image(
                    image: image,
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                    height: 200,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontFamily: 'NanumSquareNeo',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    _PriceTag(price: price),
                  ],
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              borderRadius: _borderRadius,
              child: InkWell(
                borderRadius: _borderRadius,
                splashColor: Colors.white.withValues(alpha: 0.2),
                highlightColor: Colors.black.withValues(alpha: 0.2),
                onTap: onPressed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PriceTag extends StatelessWidget {
  const _PriceTag({required this.price});

  final int price;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromRGBO(100, 100, 100, 1),
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
      alignment: Alignment.center,
      constraints: const BoxConstraints(
        minWidth: 70,
      ),
      child: Text(
        price == 0
            ? '무료'
            : '₩${price.toString().replaceAllMapped(
                  RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
                  (Match m) => '${m[1]},',
                )}',
        style: const TextStyle(
          color: Color.fromRGBO(100, 100, 100, 1),
          fontFamily: 'NanumSquareNeo',
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
      ),
    );
  }
}

class _MainPageDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
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
      style: const TextStyle(
        fontFamily: 'NanumSquareNeo',
        fontWeight: FontWeight.w800,
        fontSize: 14,
      ),
    );
  }
}
