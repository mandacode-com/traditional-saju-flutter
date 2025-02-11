part of 'question_page.dart';

class YearlySajuQuestionForm extends StatelessWidget {
  const YearlySajuQuestionForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<YearlySajuQuestionBloc, YearlySajuQuestionState>(
      listener: (context, state) {},
      child: Column(
        spacing: Config.formFieldSpacing,
        children: [
          _QuestionFormInput(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextCheckBox(
                text: "딱히 없음",
                value: context.select((YearlySajuQuestionBloc bloc) =>
                    bloc.state.questionDisabled),
                onChanged: (value) =>
                    context.read<YearlySajuQuestionBloc>().add(
                          QuestionDisabledChanged(value ?? false),
                        ),
              ),
            ],
          ),
        ],
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
      readOnly: context
          .select((YearlySajuQuestionBloc bloc) => bloc.state.questionDisabled),

      // update the state when the input field changes
      onChanged: (value) =>
          context.read<YearlySajuQuestionBloc>().add(QuestionChanged(value)),
    );
  }
}
