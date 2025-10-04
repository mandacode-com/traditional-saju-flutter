import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:traditional_saju/src/di/service_locator.dart';
import 'package:traditional_saju/src/domain/user/value/gender.dart';
import 'package:traditional_saju/src/domain/user/value/gender_ext.dart';
import 'package:traditional_saju/src/infrastructure/storage/user_storage_service.dart';
import 'package:traditional_saju/src/presentation/common/widgets/button/page_back_button.dart';
import 'package:traditional_saju/src/presentation/common/widgets/button/primary_button.dart';
import 'package:traditional_saju/src/presentation/common/widgets/form/custom_dropdown_button.dart';
import 'package:traditional_saju/src/presentation/common/widgets/form/form_input.dart';
import 'package:traditional_saju/src/presentation/common/widgets/form/form_label.dart';
import 'package:traditional_saju/src/presentation/common/widgets/form/text_checkbox.dart';
import 'package:traditional_saju/src/presentation/common/widgets/layouts/adaptive_column.dart';
import 'package:traditional_saju/src/presentation/common/widgets/layouts/page_description.dart';
import 'package:traditional_saju/src/presentation/features/user/bloc/user_info_bloc.dart';
import 'package:traditional_saju/src/presentation/features/user/bloc/user_info_event.dart';
import 'package:traditional_saju/src/presentation/features/user/bloc/user_info_state.dart';

class UserInfoBasePage extends StatelessWidget {
  const UserInfoBasePage({super.key, this.targetFortune});

  static const routeName = 'user-info-base';
  final String? targetFortune;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: PageBackButton(
          onPressed: () => context.pop(),
        ),
      ),
      body: BlocProvider(
        create: (_) => UserInfoBloc(
          userStorage: getIt<UserStorageService>(),
        )..add(const UserInfoLoadRequested()),
        child: Center(
          child: AdaptiveColumn(
            forceSpaceBetween: true,
            children: [
              const PageDescription(
                title: '정보를 입력해주세요.',
                subtitle: '당신의 운명을 알기 위한 첫 단계입니다.',
              ),
              const _UserInfoBaseForm(),
              _NextPageButton(targetFortune: targetFortune),
            ],
          ),
        ),
      ),
    );
  }
}

class _UserInfoBaseForm extends StatelessWidget {
  const _UserInfoBaseForm();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoBloc, UserInfoState>(
      builder: (context, state) {
        return Column(
          spacing: 30,
          children: [
            _FormItem(
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
                  value: state.timeUnknown,
                  onChanged: (value) => context.read<UserInfoBloc>().add(
                        UserInfoTimeUnknownChanged(timeUnknown: value ?? false),
                      ),
                ),
              ],
            ),
          ],
        );
      },
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
    return BlocBuilder<UserInfoBloc, UserInfoState>(
      builder: (context, state) {
        return Expanded(
          child: FormInput(
            isActive: state.gender == gender,
            onPressed: () => context.read<UserInfoBloc>().add(
                  UserInfoGenderChanged(gender),
                ),
            child: Center(child: Text(gender.textKor)),
          ),
        );
      },
    );
  }
}

class _BirthDateSelector extends StatelessWidget {
  const _BirthDateSelector();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoBloc, UserInfoState>(
      builder: (context, state) {
        return FormInput(
          forceTextActive: true,
          onPressed: () async {
            final selectedDate = await showDatePicker(
              context: context,
              locale: const Locale('ko', 'KR'),
              initialDate: state.birthDate ?? DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (selectedDate != null && context.mounted) {
              context.read<UserInfoBloc>().add(
                    UserInfoBirthDateChanged(selectedDate),
                  );
            }
          },
          child: state.birthDate == null
              ? Text(
                  '생년월일을 선택해주세요.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.grey[600]),
                )
              : Text(
                  '${state.birthDate!.year}년 '
                  '${state.birthDate!.month}월 '
                  '${state.birthDate!.day}일',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
        );
      },
    );
  }
}

class _BirthHourSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoBloc, UserInfoState>(
      builder: (context, state) {
        return Expanded(
          child: CustomDropdownButton<int>(
            value: state.birthHour,
            onChanged: (value) => context.read<UserInfoBloc>().add(
                  UserInfoBirthHourChanged(value ?? 0),
                ),
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
            disabled: state.timeUnknown,
          ),
        );
      },
    );
  }
}

class _BirthMinuteSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoBloc, UserInfoState>(
      builder: (context, state) {
        return Expanded(
          child: CustomDropdownButton<int>(
            value: state.birthMinutes,
            onChanged: (value) => context.read<UserInfoBloc>().add(
                  UserInfoBirthMinutesChanged(value ?? 0),
                ),
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
            disabled: state.timeUnknown,
          ),
        );
      },
    );
  }
}

class _NextPageButton extends StatelessWidget {
  const _NextPageButton({this.targetFortune});

  final String? targetFortune;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoBloc, UserInfoState>(
      builder: (context, state) {
        return PrimaryButton(
          disabled: !state.isBaseInfoValid,
          width: double.infinity,
          onPressed: () {
            final bloc = context.read<UserInfoBloc>();
            // Pass both the bloc and target fortune type
            context.pushNamed(
              'user-info-detail',
              extra: {'bloc': bloc, 'targetFortune': targetFortune},
            );
          },
          child: const Text('다음으로'),
        );
      },
    );
  }
}
