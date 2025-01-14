part of 'member_info_page.dart';

class NewYearSajuMemberInfoForm extends StatelessWidget {
  const NewYearSajuMemberInfoForm({super.key});

  static final EdgeInsets padding =
      const EdgeInsets.symmetric(vertical: 120, horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewYearSajuMemberInfoBloc, NewYearSajuMemberInfoState>(
        listener: (context, state) {},
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: padding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _MaleSelectButton(),
                    _FemaleSelectButton(),
                  ],
                ),
                const SizedBox(height: 8),
                _BirthDateButton(),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _BirthHourButton(),
                    _BirthMinuteButton(),
                  ],
                ),
                const SizedBox(height: 8),
                PageNavigationButton(
                  page: NewYearSajuQuestionPage(),
                  theme: DarkPageNavigationButtonTheme(),
                  text: "다음",
                )
              ],
            ),
          ),
        ));
  }
}

class GenderSelectButton extends StatelessWidget {
  const GenderSelectButton({super.key, required this.genderType});

  final GenderType genderType;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          foregroundColor: context.select((NewYearSajuMemberInfoBloc bloc) =>
                      bloc.state.gender.value) ==
                  genderType
              ? Colors.white
              : Colors.black,
          backgroundColor: context.select((NewYearSajuMemberInfoBloc bloc) =>
                      bloc.state.gender.value) ==
                  genderType
              ? Colors.black
              : Colors.grey),
      onPressed: () => context
          .read<NewYearSajuMemberInfoBloc>()
          .add(MemberInfoGenderChanged(genderType)),
      child: genderType == GenderType.unknown
          ? const Text('성별')
          : Text(genderType == GenderType.male ? '남자' : '여자'),
    );
  }
}

class _MaleSelectButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GenderSelectButton(genderType: GenderType.male);
  }
}

class _FemaleSelectButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GenderSelectButton(genderType: GenderType.female);
  }
}

class _BirthDateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime? birthDate = context
        .select((NewYearSajuMemberInfoBloc bloc) => bloc.state.birthDate.value);
    return ElevatedButton(
        onPressed: () async {
          final date = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
          ).then((value) => value ?? DateTime.now());
          if (context.mounted) {
            context
                .read<NewYearSajuMemberInfoBloc>()
                .add(MemberInfoBirthDateChanged(date));
          }
        },
        child: birthDate == null
            ? const Text('생년월일')
            : Text('${birthDate.year}년 ${birthDate.month}월 ${birthDate.day}일'));
  }
}

class _BirthHourButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: context.select(
          (NewYearSajuMemberInfoBloc bloc) => bloc.state.birthHour.value),
      onChanged: (value) => context
          .read<NewYearSajuMemberInfoBloc>()
          .add(MemberInfoBirthHourChanged(value ?? 0)),
      items: List.generate(24, (index) => index)
          .map((hour) => DropdownMenuItem<int>(
                value: hour,
                child: Text('$hour시'),
              ))
          .toList(),
    );
  }
}

class _BirthMinuteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: context.select(
          (NewYearSajuMemberInfoBloc bloc) => bloc.state.birthMinute.value),
      onChanged: (value) => context
          .read<NewYearSajuMemberInfoBloc>()
          .add(MemberInfoBirthMinuteChanged(value ?? 0)),
      items: List.generate(60, (index) => index)
          .map((minute) => DropdownMenuItem<int>(
                value: minute,
                child: Text('$minute분'),
              ))
          .toList(),
    );
  }
}
