import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:traditional_saju/src/di/service_locator.dart';
import 'package:traditional_saju/src/domain/user/value/dating_status.dart';
import 'package:traditional_saju/src/domain/user/value/dating_status_ext.dart';
import 'package:traditional_saju/src/domain/user/value/job_status.dart';
import 'package:traditional_saju/src/domain/user/value/job_status_ext.dart';
import 'package:traditional_saju/src/infrastructure/storage/user_storage_service.dart';
import 'package:traditional_saju/src/presentation/common/widgets/button/page_back_button.dart';
import 'package:traditional_saju/src/presentation/common/widgets/button/primary_button.dart';
import 'package:traditional_saju/src/presentation/common/widgets/form/form_input.dart';
import 'package:traditional_saju/src/presentation/common/widgets/form/form_label.dart';
import 'package:traditional_saju/src/presentation/common/widgets/form/text_checkbox.dart';
import 'package:traditional_saju/src/presentation/common/widgets/layouts/adaptive_column.dart';
import 'package:traditional_saju/src/presentation/common/widgets/layouts/page_description.dart';
import 'package:traditional_saju/src/presentation/features/user/bloc/user_info_bloc.dart';
import 'package:traditional_saju/src/presentation/features/user/bloc/user_info_event.dart';
import 'package:traditional_saju/src/presentation/features/user/bloc/user_info_state.dart';

class UserInfoDetailPage extends StatelessWidget {
  const UserInfoDetailPage({super.key, this.bloc, this.targetFortune});

  static const routeName = 'user-info-detail';
  final UserInfoBloc? bloc;
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
      body: BlocProvider.value(
        value: bloc ??
            (UserInfoBloc(
              userStorage: getIt<UserStorageService>(),
            )..add(const UserInfoLoadRequested())),
        child: BlocListener<UserInfoBloc, UserInfoState>(
          listener: (context, state) {
            if (state.status == UserInfoStatus.submitted) {
              // Navigate to the appropriate fortune page after successful submission
              if (targetFortune != null) {
                context.go('/$targetFortune');
              } else {
                context.go('/');
              }
            }
          },
          child: const Center(
            child: AdaptiveColumn(
              forceSpaceBetween: true,
              children: [
                PageDescription(
                  title: '추가 정보를 입력해주세요.',
                  subtitle: '더 정확한 운세를 위해 필요합니다.',
                ),
                _UserInfoDetailForm(),
                _SubmitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _UserInfoDetailForm extends StatelessWidget {
  const _UserInfoDetailForm();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoBloc, UserInfoState>(
      builder: (context, state) {
        return Column(
          spacing: 40,
          children: [
            _FormItem(
              label: '연애상태',
              child: Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _DatingStatusSelectionButton(
                    datingStatus: DatingStatus.single,
                  ),
                  _DatingStatusSelectionButton(
                    datingStatus: DatingStatus.dating,
                  ),
                  _DatingStatusSelectionButton(
                    datingStatus: DatingStatus.married,
                  ),
                ],
              ),
            ),
            _FormItem(
              label: '구직상태',
              child: Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _JobStatusSelectionButton(jobStatus: JobStatus.student),
                  _JobStatusSelectionButton(jobStatus: JobStatus.unemployed),
                  _JobStatusSelectionButton(jobStatus: JobStatus.employed),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextCheckBox(
                  text: '이 정보 저장하기',
                  value: state.permanent,
                  onChanged: (value) => context.read<UserInfoBloc>().add(
                        UserInfoPermanentChanged(permanent: value ?? false),
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

class _DatingStatusSelectionButton extends StatelessWidget {
  const _DatingStatusSelectionButton({required this.datingStatus});

  final DatingStatus datingStatus;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoBloc, UserInfoState>(
      builder: (context, state) {
        return Expanded(
          child: FormInput(
            onPressed: () => context.read<UserInfoBloc>().add(
                  UserInfoDatingStatusChanged(datingStatus),
                ),
            isActive: state.datingStatus == datingStatus,
            child: Center(child: Text(datingStatus.textKor)),
          ),
        );
      },
    );
  }
}

class _JobStatusSelectionButton extends StatelessWidget {
  const _JobStatusSelectionButton({required this.jobStatus});

  final JobStatus jobStatus;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoBloc, UserInfoState>(
      builder: (context, state) {
        return Expanded(
          child: FormInput(
            onPressed: () => context.read<UserInfoBloc>().add(
                  UserInfoJobStatusChanged(jobStatus),
                ),
            isActive: state.jobStatus == jobStatus,
            child: Center(child: Text(jobStatus.textKor)),
          ),
        );
      },
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoBloc, UserInfoState>(
      builder: (context, state) {
        return PrimaryButton(
          width: double.infinity,
          onPressed: () {
            context.read<UserInfoBloc>().add(const UserInfoSubmitted());
          },
          child: state.status == UserInfoStatus.loading
              ? const CircularProgressIndicator()
              : const Text('완료'),
        );
      },
    );
  }
}
