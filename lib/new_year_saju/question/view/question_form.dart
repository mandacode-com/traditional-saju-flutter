part of 'question_page.dart';

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
                'value: ${context.select((NewYearSajuQuestionBloc bloc) => bloc.state.question.value)}'),
            PageNavigationButton(
              page: NewYearSajuResultPage(),
              text: "다음",
            )
          ],
        ));
  }
}

class _QuestionFormInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: UniqueKey(),
      initialValue: context
          .select((NewYearSajuQuestionBloc bloc) => bloc.state.question.value),
    );
  }
}
