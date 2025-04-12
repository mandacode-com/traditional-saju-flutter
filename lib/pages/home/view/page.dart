import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:repository/repository.dart';
import 'package:saju_mobile_v1/common/widgets/button/primary_button.dart';
import 'package:saju_mobile_v1/common/widgets/layouts/adaptive_column.dart';
import 'package:saju_mobile_v1/common/widgets/layouts/main_background.dart';
import 'package:saju_mobile_v1/pages/home/bloc/bloc.dart';
import 'package:saju_mobile_v1/pages/home/bloc/event.dart';
import 'package:saju_mobile_v1/pages/home/bloc/state.dart';
import 'package:saju_mobile_v1/route_observer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with RouteAware {
  late final HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = HomeBloc(
      authRepository: context.read<AuthRepository>(),
    )..add(const HomeSubscriptionRequested());
  }

  @override
  void dispose() {
    _homeBloc.close();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)! as PageRoute);
    precacheImage(
      const AssetImage('assets/images/oauth_logo/google.png'),
      context,
    );
  }

  @override
  void didPopNext() {
    _homeBloc.add(const HomeSubscriptionRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
      body: BlocProvider<HomeBloc>.value(
        value: _homeBloc,
        child: const MainBackground(
          child: AdaptiveColumn(
            portraitPadding: EdgeInsets.only(
              top: 140,
              left: 20,
              right: 20,
              bottom: 100,
            ),
            spacing: 20,
            forceSpaceBetween: true,
            children: [
              _HomePageTitle(
                title: '정통사주',
                description: '정확하게 들어맞는 정통사주풀이',
              ),
              _PageContent(),
            ],
          ),
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

class _PageContent extends StatelessWidget {
  const _PageContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.formStatus == FormStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state.formStatus == FormStatus.failure) {
          return const Center(
            child: Text('로그인 실패'),
          );
        }

        if (state.isLoggedIn) {
          return const _RouteButtons();
        }

        return const _OauthButtons();
      },
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
            ListTile(
              title: const _ListTitleText(text: '샘플 페이지'),
              onTap: () {
                Navigator.of(context)
                    .pushNamed(AppRoutes.homeSample.toString());
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

class _OauthButtons extends StatelessWidget {
  const _OauthButtons();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10,
      children: [
        _OauthButton(
          image: const AssetImage('assets/images/oauth_logo/google.png'),
          onPressed: () async {
            context.read<HomeBloc>().add(
                  const GoogleLoginRequested(),
                );
          },
          title: '구글로 계속하기',
        ),
      ],
    );
  }
}

class _OauthButton extends StatelessWidget {
  const _OauthButton({
    required this.image,
    required this.onPressed,
    required this.title,
  });

  final AssetImage image;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      background: WidgetStateProperty.all(
        const Color(0xFFFFFFFF),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          ImageIcon(
            image,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ],
      ),
    );
  }
}

class _RouteButtons extends StatelessWidget {
  const _RouteButtons();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20,
      children: [
        _RouteButton(
          onPressed: () {
            context.read<AppRepository>().setTargetRoute(AppRoutes.dailyResult);
            Navigator.pushNamed(context, AppRoutes.userInfoBase.toString());
          },
          title: '오늘의 운세',
        ),
        _RouteButton(
          onPressed: () {
            context
                .read<AppRepository>()
                .setTargetRoute(AppRoutes.yearlyResult);
            Navigator.pushNamed(context, AppRoutes.userInfoBase.toString());
          },
          title: '🐍 2025년 신년운세 🐍',
        ),
      ],
    );
  }
}

class _RouteButton extends StatelessWidget {
  const _RouteButton({
    required this.onPressed,
    required this.title,
  });

  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      background: WidgetStateProperty.all(
        const Color(0xFFFFFFFF),
      ),
      width: double.infinity,
      onPressed: onPressed,
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }
}
