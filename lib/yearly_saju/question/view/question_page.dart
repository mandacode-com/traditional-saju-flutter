import 'package:saju/config/config.dart';
import 'package:saju/yearly_saju/question/bloc/question_bloc.dart';
import 'package:saju/yearly_saju/question/bloc/question_state.dart';
import 'package:saju/yearly_saju/result/view/result_page.dart';
import 'package:saju/themes/button_color.dart';
import 'package:saju/themes/page_navigation_button_theme.dart';
import 'package:saju/widgets/page_back_button.dart';
import 'package:saju/widgets/page_info_text.dart';
import 'package:saju/widgets/page_navigation_button.dart';
import 'package:saju/widgets/text_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yearly_saju_repository/yearly_saju_repository.dart';

part 'question_form.dart';

class YearlySajuQuestionPage extends StatelessWidget {
  const YearlySajuQuestionPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const YearlySajuQuestionPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => YearlySajuQuestionBloc(
          yearlySajuRepository: context.read<YearlySajuRepository>(),
        )..add(const QuestionSubscriptionRequested()),
        child: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return _PortraitLayout();
            } else {
              return _LandscapeLayout();
            }
          },
        ),
      ),
    );
  }
}

class _PortraitLayout extends StatelessWidget {
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
            const YearlySajuQuestionForm(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: Config.bottomNavigationPadding,
        child: _NextPageNavigationButton(),
      ),
    );
  }
}

class _LandscapeLayout extends StatelessWidget {
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
            const YearlySajuQuestionForm(),
              _NextPageNavigationButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _NextPageNavigationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageNavigationButton(
      theme: DarkPageNavigationButtonTheme(),
      page: YearlySajuResultPage(),
      text: "다음으로",
    );
  }
}
