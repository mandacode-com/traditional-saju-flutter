part of 'member_info_page.dart';

class YearlySajuMemberInfoForm extends StatelessWidget {
  const YearlySajuMemberInfoForm({super.key});

  static const double _fieldItemSpacing = 20;

  @override
  Widget build(BuildContext context) {
    return BlocListener<YearlySajuMemberInfoBloc, YearlySajuMemberInfoState>(
      listener: (context, state) {},
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: Config.formSpacing,
          children: <Widget>[
            Column(
              spacing: Config.formFieldSpacing,
              children: [
                _Label(text: '성별'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: _fieldItemSpacing,
                  children: [
                    _GenderSelectButton(genderType: Gender.male),
                    _GenderSelectButton(genderType: Gender.female),
                  ],
                ),
              ],
            ),
            Column(
              spacing: Config.formFieldSpacing,
              children: [
                _Label(text: '생년월일(양력)'),
                _BirthDateButton(),
              ],
            ),
            Column(
              spacing: Config.formFieldSpacing,
              children: [
                _Label(text: '태어난 시각'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: _fieldItemSpacing,
                  children: [
                    _BirthHourButton(),
                    _BirthMinuteButton(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextCheckBox(
                      text: "시간 모름",
                      value: context.select((YearlySajuMemberInfoBloc bloc) =>
                          bloc.state.birthTimeDisabled),
                      onChanged: (value) => context
                          .read<YearlySajuMemberInfoBloc>()
                          .add(MemberInfoBirthTimeDisabledChanged(
                              value ?? false)),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Label extends StatelessWidget {
  const _Label({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
        )
      ],
    );
  }
}

class _GenderSelectButton extends StatelessWidget {
  const _GenderSelectButton({required this.genderType});

  final Gender genderType;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            foregroundColor: context.select(
                        (YearlySajuMemberInfoBloc bloc) => bloc.state.gender) ==
                    genderType
                ? ButtonColor.white
                : ButtonColor.black,
            backgroundColor: context.select(
                        (YearlySajuMemberInfoBloc bloc) => bloc.state.gender) ==
                    genderType
                ? ButtonColor.black
                : ButtonColor.white),
        onPressed: () => context
            .read<YearlySajuMemberInfoBloc>()
            .add(MemberInfoGenderChanged(genderType)),
        child: Text(genderType == Gender.male ? '남자' : '여자'),
      ),
    );
  }
}

class _BirthDateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime? birthDate = context
        .select((YearlySajuMemberInfoBloc bloc) => bloc.state.birthDate.value);
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                foregroundColor: ButtonColor.black,
                backgroundColor: ButtonColor.white),
            onPressed: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              ).then((value) => value ?? DateTime.now());
              if (context.mounted) {
                context
                    .read<YearlySajuMemberInfoBloc>()
                    .add(MemberInfoBirthDateChanged(date));
              }
            },
            child: birthDate == null
                ? const Text('생년월일')
                : Text(
                    '${birthDate.year}년 ${birthDate.month}월 ${birthDate.day}일'),
          ),
        ),
      ],
    );
  }
}

class _TimeSelectButton<T> extends StatelessWidget {
  const _TimeSelectButton({
    required this.value,
    required this.onChanged,
    required this.items,
  });

  final T value;
  final void Function(T?) onChanged;
  final List<DropdownMenuItem<T>> items;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomDropdownButton<T>(
        value: value,
        onChanged: onChanged,
        items: items,
        disabled: context.select(
            (YearlySajuMemberInfoBloc bloc) => bloc.state.birthTimeDisabled),
      ),
    );
  }
}

class _BirthHourButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _TimeSelectButton<int>(
      value: context.select(
          (YearlySajuMemberInfoBloc bloc) => bloc.state.birthHour.value),
      onChanged: (value) => context
          .read<YearlySajuMemberInfoBloc>()
          .add(MemberInfoBirthHourChanged(value ?? 0)),
      items: List.generate(24, (index) => index)
          .map((hour) => DropdownMenuItem<int>(
                value: hour,
                child: Center(
                  child: Text('$hour시', textAlign: TextAlign.center),
                ),
              ))
          .toList(),
    );
  }
}

class _BirthMinuteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _TimeSelectButton<int>(
      value: context.select(
          (YearlySajuMemberInfoBloc bloc) => bloc.state.birthMinute.value),
      onChanged: (value) => context
          .read<YearlySajuMemberInfoBloc>()
          .add(MemberInfoBirthMinuteChanged(value ?? 0)),
      items: List.generate(60, (index) => index)
          .map((minute) => DropdownMenuItem<int>(
                value: minute,
                child: Center(
                  child: Text('$minute분', textAlign: TextAlign.center),
                ),
              ))
          .toList(),
    );
  }
}
