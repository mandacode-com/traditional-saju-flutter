import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:saju_mobile_v1/common/widgets/button/custom_dropdown_button.dart';
import 'package:saju_mobile_v1/common/widgets/button/text_check_box.dart';
import 'package:saju_mobile_v1/common/widgets/form/form_input.dart';
import 'package:saju_mobile_v1/common/widgets/form/form_label.dart';
import 'package:saju_mobile_v1/pages/user/base/bloc/bloc.dart';
import 'package:saju_mobile_v1/pages/user/base/bloc/event.dart';
import 'package:saju_mobile_v1/pages/user/base/bloc/state.dart';

class UserInfoBaseForm extends StatelessWidget {
  const UserInfoBaseForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserInfoBaseBloc, UserInfoBaseState>(
      listener: (context, state) {},
      child: Column(
        spacing: 30,
        children: [
          const _FormItem(
            label: '성별',
            child: Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _GenderSelectorButton(gender: Gender.male),
                _GenderSelectorButton(gender: Gender.female),
              ],
            ),
          ),
          const _FormItem(
            label: '생년월일(양력)',
            child: _BirthDateSelector(),
          ),
          _FormItem(
            label: '태어난 시각',
            child: Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _BirthHourSelector(),
                _BirthMinuteSelector(),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextCheckBox(
                text: '시간 모름',
                value: context.select(
                  (UserInfoBaseBloc bloc) => bloc.state.timeDisabled,
                ),
                onChanged: (value) => context.read<UserInfoBaseBloc>().add(
                      UserInfoBaseTimeDisabledChanged(
                        timeDisabled: value ?? false,
                      ),
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FormItem extends StatelessWidget {
  const _FormItem({required this.label, required this.child});

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        FormLabel(label: label),
        Row(children: [Expanded(child: child)]),
      ],
    );
  }
}

class _GenderSelectorButton extends StatelessWidget {
  const _GenderSelectorButton({required this.gender});

  final Gender gender;

  @override
  Widget build(BuildContext context) {
    final currentGender = context.select(
      (UserInfoBaseBloc bloc) => bloc.state.gender,
    );
    return Expanded(
      child: FormInput(
        isActive: currentGender == gender,
        onPressed: () => context
            .read<UserInfoBaseBloc>()
            .add(UserInfoBaseGenderChanged(gender)),
        child: Center(child: Text(gender.textKor)),
      ),
    );
  }
}

class _BirthDateSelector extends StatelessWidget {
  const _BirthDateSelector();

  @override
  Widget build(BuildContext context) {
    final birthDateTime = context.select(
      (UserInfoBaseBloc bloc) => bloc.state.birthDate,
    );
    return FormInput(
      forceTextActive: true,
      onPressed: () async {
        final selectedDate = await showDatePicker(
          context: context,
          locale: const Locale('ko', 'KR'),
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (selectedDate != null && context.mounted) {
          context.read<UserInfoBaseBloc>().add(
                UserInfoBaseBirthDateChanged(selectedDate),
              );
        }
      },
      child: birthDateTime.value == null
          ? Text(
              '생년월일을 선택해주세요.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
            )
          : Text(
              '${birthDateTime.value!.year}년 '
              '${birthDateTime.value!.month}월 '
              '${birthDateTime.value!.day}일',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
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
          (UserInfoBaseBloc bloc) => bloc.state.timeDisabled,
        ),
      ),
    );
  }
}

class _BirthHourSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _TimeSelectButton<int>(
      value: context.select(
        (UserInfoBaseBloc bloc) => bloc.state.birthHour.value,
      ),
      onChanged: (value) => context
          .read<UserInfoBaseBloc>()
          .add(UserInfoBaseBirthHourChanged(value ?? 0)),
      items: List.generate(24, (index) => index)
          .map(
            (hour) => DropdownMenuItem<int>(
              value: hour,
              child: Center(
                child: Text('$hour시', textAlign: TextAlign.center),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _BirthMinuteSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _TimeSelectButton<int>(
      value: context.select(
        (UserInfoBaseBloc bloc) => bloc.state.birthMinutes.value,
      ),
      onChanged: (value) => context
          .read<UserInfoBaseBloc>()
          .add(UserInfoBaseBirthMinutesChanged(value ?? 0)),
      items: List.generate(60, (index) => index)
          .map(
            (minute) => DropdownMenuItem<int>(
              value: minute,
              child: Center(
                child: Text('$minute분', textAlign: TextAlign.center),
              ),
            ),
          )
          .toList(),
    );
  }
}
