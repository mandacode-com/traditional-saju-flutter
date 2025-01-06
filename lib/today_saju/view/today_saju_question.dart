import 'package:byul_mobile/today_saju/bloc/today_saju_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodaySajuQuestion extends StatelessWidget {
  const TodaySajuQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TodaySajuBloc, TodaySajuState>(
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
        context.read<TodaySajuBloc>().add(TodaySajuQuestionChanged(text));
      },
    );
  }
}
