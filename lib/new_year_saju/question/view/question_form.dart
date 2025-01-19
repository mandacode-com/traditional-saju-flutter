part of 'question_page.dart';

class QuestionForm extends StatelessWidget {
  const QuestionForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewYearSajuQuestionBloc, NewYearSajuQuestionState>(
      listener: (context, state) {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 20),
        child: Column(
          children: [
            _QuestionFormInput(),
            Row(
              children: [
                Checkbox(
                  value: context.select((NewYearSajuQuestionBloc bloc) =>
                      bloc.state.questionDisabled),
                  onChanged: (value) => context
                      .read<NewYearSajuQuestionBloc>()
                      .add(QuestionDisabledChanged(value ?? false)),
                ),
                Text('없음'),
              ],
            ),
            PageNavigationButton(
              theme: DarkPageNavigationButtonTheme(),
              page: NewYearSajuResultPage(),
              text: "완료",
            )
          ],
        ),
      ),
    );
  }
}

class _QuestionFormInput extends StatelessWidget {
  final BorderRadius borderRadius = BorderRadius.circular(10);

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      style: TextStyle(
        color: ButtonColor.black,
        fontSize: 12,
      ),
      minLines: 1,
      maxLines: 5,
      maxLength: 100,
      decoration: InputDecoration(
        filled: true,
        fillColor: ButtonColor.white,
        contentPadding: EdgeInsets.all(30),
        hintText: '100자 이내로 입력해주세요',
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ButtonColor.black),
          borderRadius: borderRadius,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: borderRadius,
        ),
      ),

      // disable the input field if the checkbox is checked
      readOnly: context.select(
          (NewYearSajuQuestionBloc bloc) => bloc.state.questionDisabled),

      // update the state when the input field changes
      onChanged: (value) =>
          context.read<NewYearSajuQuestionBloc>().add(QuestionChanged(value)),
    );
  }
}
