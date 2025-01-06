import 'package:byul_mobile/new_year_saju/bloc/new_year_saju_bloc.dart';
import 'package:byul_mobile/new_year_saju/view/new_year_saju_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_year_saju_repository/new_year_saju_repository.dart';

class NewYearSajuPage extends StatelessWidget {
  const NewYearSajuPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const NewYearSajuPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Byuljogak Saju'),
      ),
      body: BlocProvider(
        create: (context) => NewYearSajuBloc(
          newYearSajuRepository: context.read<NewYearSajuRepository>(),
        )..add(const NewYearSajuSubscriptionRequested()),
        child: const NewYearSajuForm(),
      ),
    );
  }
}
