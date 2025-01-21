import 'package:byul_mobile/config/config.dart';
import 'package:byul_mobile/new_year_saju/question/bloc/question_bloc.dart';
import 'package:byul_mobile/new_year_saju/question/bloc/question_state.dart';
import 'package:byul_mobile/new_year_saju/result/view/result_page.dart';
import 'package:byul_mobile/themes/button_color.dart';
import 'package:byul_mobile/themes/page_navigation_button_theme.dart';
import 'package:byul_mobile/widgets/bottom_page_navigation_button.dart';
import 'package:byul_mobile/widgets/page_back_button.dart';
import 'package:byul_mobile/widgets/page_info_text.dart';
import 'package:byul_mobile/widgets/page_navigation_button.dart';
import 'package:byul_mobile/widgets/text_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_year_saju_repository/new_year_saju_repository.dart';

part 'question_form.dart';

class NewYearSajuQuestionPage extends StatefulWidget {
  const NewYearSajuQuestionPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const NewYearSajuQuestionPage(),
    );
  }

  @override
  State<NewYearSajuQuestionPage> createState() =>
      _NewYearSajuQuestionPageState();
}

class _NewYearSajuQuestionPageState extends State<NewYearSajuQuestionPage> {
  final ScrollController _scrollController = ScrollController();

  bool isBottom = false;

  _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent - 40 &&
        !_scrollController.position.outOfRange) {
      setState(() {
        isBottom = true;
      });
    } else {
      setState(() {
        isBottom = false;
      });
    }
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        isBottom = _scrollController.position.maxScrollExtent <= 0;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
      body: BlocProvider(
        create: (context) => NewYearSajuQuestionBloc(
          newYearSajuRepository: context.read<NewYearSajuRepository>(),
        )..add(const QuestionSubscriptionRequested()),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: MediaQuery.of(context).orientation == Orientation.landscape
                ? Config.getLandScapeHorizontalPadding(context).copyWith(
                    top: 40,
                    bottom: 40,
                  )
                : const EdgeInsets.all(20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: const PageInfoText(
                      title: "특히 궁금한 내용이 있나요?",
                      description: "당신의 고민에 대한 명쾌한 해답을 드립니다."),
                ),
                const QuestionForm(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AnimatedBuilder(
        animation: _scrollController,
        builder: (context, child) {
          return BottomPageNavigationButton(
            opacity: MediaQuery.of(context).orientation == Orientation.portrait
                ? 1
                : isBottom
                    ? 1
                    : 0,
            child: child,
          );
        },
        child: _BottomNavigationBar(),
      ),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).orientation == Orientation.landscape
          ? Config.getLandScapeHorizontalPadding(context).copyWith(
              top: 20,
              bottom: 20,
            )
          : const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: PageNavigationButton(
        theme: DarkPageNavigationButtonTheme(),
        page: NewYearSajuResultPage(),
        text: "완료",
      ),
    );
  }
}
