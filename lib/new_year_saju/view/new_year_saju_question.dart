import 'package:byul_mobile/new_year_saju/bloc/new_year_saju_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewYearSajuQuestion extends StatelessWidget {
  const NewYearSajuQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewYearSajuBloc, NewYearSajuState>(
      listener: (context, state) {},
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 8),
            _QuestionForm(),
          ],
        ),
      ),
    );
  }
}

class _QuestionForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: '질문을 입력하세요',
      ),
      onChanged: (text) {
        context.read<NewYearSajuBloc>().add(NewYearSajuQuestionChanged(text));
      },
    );
  }
}
