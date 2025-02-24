import 'package:repository/repository.dart';
import 'package:saju/config/config.dart';
import 'package:saju/base_info/question/bloc/question_bloc.dart';
import 'package:saju/base_info/question/bloc/question_state.dart';
import 'package:saju/themes/button_color.dart';
import 'package:saju/themes/page_navigation_button_theme.dart';
import 'package:saju/widgets/page_back_button.dart';
import 'package:saju/widgets/page_info_text.dart';
import 'package:saju/widgets/page_navigation_button.dart';
import 'package:saju/widgets/text_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'question_form.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key, required this.targetPage});

  final Widget targetPage;

  static Route<void> route({
    required Widget targetPage,
  }) {
    return MaterialPageRoute<void>(
      builder: (_) => QuestionPage(targetPage: targetPage),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => QuestionBloc(
          userInfoRepository: context.read<UserInfoRepository>(),
        )..add(const QuestionSubscriptionRequested()),
        child: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return _PortraitLayout(targetPage: targetPage);
            } else {
              return _LandscapeLayout(targetPage: targetPage);
            }
          },
        ),
      ),
    );
  }
}

class _PortraitLayout extends StatelessWidget {
  const _PortraitLayout({required this.targetPage});

  final Widget targetPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: PageBackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: Config.verticalPagePadding,
        child: Column(
          spacing: Config.pageInfoTextSpacingVertical,
          children: [
            const PageInfoText(
                title: "특히 궁금한 내용이 있나요?",
                description: "당신의 고민에 대한 명쾌한 해답을 드립니다."),
            const QuestionForm(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: Config.bottomNavigationPadding,
        child: _NextPageNavigationButton(targetPage: targetPage),
      ),
    );
  }
}

class _LandscapeLayout extends StatelessWidget {
  const _LandscapeLayout({required this.targetPage});

  final Widget targetPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: PageBackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: Config.getLandScapeHorizontalPadding(context).copyWith(
            top: Config.horizontalPagePadding.top,
            bottom: Config.horizontalPagePadding.bottom,
          ),
          child: Column(
            spacing: Config.pageInfoTextSpacingHorizontal,
            children: [
              const PageInfoText(
                  title: "특히 궁금한 내용이 있나요?",
                  description: "당신의 고민에 대한 명쾌한 해답을 드립니다."),
              const QuestionForm(),
              _NextPageNavigationButton(targetPage: targetPage),
            ],
          ),
        ),
      ),
    );
  }
}

class _NextPageNavigationButton extends StatelessWidget {
  const _NextPageNavigationButton({required this.targetPage});

  final Widget targetPage;

  @override
  Widget build(BuildContext context) {
    return PageNavigationButton(
      theme: DarkPageNavigationButtonTheme(),
      page: targetPage,
      text: "다음으로",
    );
  }
}
