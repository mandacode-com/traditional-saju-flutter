import 'package:byul_mobile/new_year_saju/question/bloc/question_bloc.dart';
import 'package:byul_mobile/new_year_saju/question/bloc/question_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_year_saju_repository/new_year_saju_repository.dart';

part 'question_form.dart';

class NewYearSajuQuestionPage extends StatelessWidget {
  const NewYearSajuQuestionPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const NewYearSajuQuestionPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question page'),
      ),
      body: BlocProvider(
        create: (context) => NewYearSajuQuestionBloc(
          newYearSajuRepository: context.read<NewYearSajuRepository>(),
        )..add(const QuestionSubscriptionRequested()),
        child: const QuestionForm(),
      ),
    );
  }
}
