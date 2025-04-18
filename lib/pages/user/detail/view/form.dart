import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:saju_mobile_v1/common/widgets/button/text_check_box.dart';
import 'package:saju_mobile_v1/common/widgets/form/form_input.dart';
import 'package:saju_mobile_v1/common/widgets/form/form_label.dart';
import 'package:saju_mobile_v1/pages/user/detail/bloc/bloc.dart';
import 'package:saju_mobile_v1/pages/user/detail/bloc/event.dart';
import 'package:saju_mobile_v1/pages/user/detail/bloc/state.dart';

class UserInfoDetailForm extends StatelessWidget {
  const UserInfoDetailForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserInfoDetailBloc, UserInfoDetailState>(
      listener: (context, state) {},
      child: Column(
        spacing: 40,
        children: [
          const _FormItem(
            label: '연애상태',
            child: Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _DatingStatusSelectionButton(datingStatus: DatingStatus.single),
                _DatingStatusSelectionButton(datingStatus: DatingStatus.dating),
                _DatingStatusSelectionButton(
                  datingStatus: DatingStatus.married,
                ),
              ],
            ),
          ),
          const _FormItem(
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
                value: context.select(
                  (UserInfoDetailBloc bloc) => bloc.state.permanent,
                ),
                onChanged:
                    (value) => context.read<UserInfoDetailBloc>().add(
                      UserInfoDetailPermanentChanged(permanent: value ?? false),
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

class _DatingStatusSelectionButton extends StatelessWidget {
  const _DatingStatusSelectionButton({required this.datingStatus});

  final DatingStatus datingStatus;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FormInput(
        onPressed:
            () => context.read<UserInfoDetailBloc>().add(
              UserInfoDetailDatingChanged(datingStatus),
            ),
        isActive: context.select(
          (UserInfoDetailBloc bloc) => bloc.state.datingStatus == datingStatus,
        ),
        child: Center(child: Text(datingStatus.textKor)),
      ),
    );
  }
}

class _JobStatusSelectionButton extends StatelessWidget {
  const _JobStatusSelectionButton({required this.jobStatus});

  final JobStatus jobStatus;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FormInput(
        onPressed:
            () => context.read<UserInfoDetailBloc>().add(
              UserInfoDetailJobChanged(jobStatus),
            ),
        isActive: context.select(
          (UserInfoDetailBloc bloc) => bloc.state.jobStatus == jobStatus,
        ),
        child: Center(child: Text(jobStatus.textKor)),
      ),
    );
  }
}
