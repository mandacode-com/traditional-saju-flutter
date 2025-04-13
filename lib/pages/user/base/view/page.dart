import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:repository/repository.dart';
import 'package:saju_mobile_v1/common/widgets/button/page_back_button.dart';
import 'package:saju_mobile_v1/common/widgets/button/primary_button.dart';
import 'package:saju_mobile_v1/common/widgets/layouts/adaptive_column.dart';
import 'package:saju_mobile_v1/common/widgets/layouts/page_description.dart';
import 'package:saju_mobile_v1/pages/user/base/bloc/bloc.dart';
import 'package:saju_mobile_v1/pages/user/base/bloc/event.dart';
import 'package:saju_mobile_v1/pages/user/base/bloc/state.dart';
import 'package:saju_mobile_v1/pages/user/base/view/form.dart';

class UserInfoBasePage extends StatelessWidget {
  const UserInfoBasePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const UserInfoBasePage());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: PageBackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: BlocProvider(
          create: (context) => UserInfoBaseBloc(
            userRepository: context.read<UserRepository>(),
          )..add(const UserInfoBaseSubscriptionRequested()),
          child: const Center(
            child: AdaptiveColumn(
              forceSpaceBetween: true,
              children: [
                PageDiscription(
                  title: '정보를 입력해주세요.',
                  subtitle: '당신의 운명을 알기 위한 첫 단계입니다.',
                ),
                UserInfoBaseForm(),
                _NextPageButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NextPageButton extends StatelessWidget {
  const _NextPageButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoBaseBloc, UserInfoBaseState>(
      builder: (context, state) {
        final isValid = state.birthDate.isValid;
        return PrimaryButton(
          disabled: !isValid,
          width: double.infinity,
          onPressed: () {
            context.read<UserInfoBaseBloc>().add(
                  const UserInfoBaseSubscriptionRequested(),
                );
            Navigator.of(context).pushNamed(
              AppRoutes.userInfoDetail.toString(),
            );
          },
          child: const Text('다음으로'),
        );
      },
    );
  }
}
