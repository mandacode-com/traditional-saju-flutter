import 'package:byul_mobile/new_year_saju/bloc/member_info_bloc/member_info_bloc.dart';
import 'package:byul_mobile/new_year_saju/view/member_info/member_info_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_year_saju_repository/new_year_saju_repository.dart';

class NewYearSajuMemberInfoPage extends StatelessWidget {
  const NewYearSajuMemberInfoPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const NewYearSajuMemberInfoPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Byuljogak Saju'),
      ),
      body: BlocProvider(
        create: (context) => NewYearSajuMemberInfoBloc(
          newYearSajuRepository: context.read<NewYearSajuRepository>(),
        )..add(const MemberInfoSubscriptionRequested()),
        child: const NewYearSajuMemberInfoForm(),
      ),
    );
  }
}
