import 'package:byul_mobile/new_year_saju/bloc/question_bloc/question_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionForm extends StatelessWidget {
  const QuestionForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewYearSajuQuestionBloc, NewYearSajuQuestionState>(
        listener: (context, state) {},
        child: Column(
          children: [
            _QuestionFormInput(),
            Text(
                'value: ${context.select((NewYearSajuQuestionBloc bloc) => bloc.state.question.value)}')
          ],
        ));
  }
}

class _QuestionFormInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) =>
          context.read<NewYearSajuQuestionBloc>().add(QuestionChanged(value)),
    );
  }
}
