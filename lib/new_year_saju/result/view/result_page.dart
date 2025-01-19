import 'package:byul_mobile/new_year_saju/result/bloc/result_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_year_saju_repository/new_year_saju_repository.dart';

class NewYearSajuResultPage extends StatelessWidget {
  const NewYearSajuResultPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const NewYearSajuResultPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Byuljogak Saju'),
      ),
      body: BlocProvider(
        create: (context) => NewYearSajuResultBloc(
          newYearSajuRepository: context.read<NewYearSajuRepository>(),
        )..add(const ResultSubscriptionRequested()),
        child: _ResultPageContent(),
      ),
    );
  }
}

class _ResultPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return context.select(
      (NewYearSajuResultBloc bloc) =>
          bloc.state.status == NewYearSajuResultStatus.success
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("success"),
                      ElevatedButton(
                        onPressed: () => context
                            .read<NewYearSajuResultBloc>()
                            .add(const ClearResultPressed()),
                        child: const Text('Clear'),
                      ),
                    ],
                  ),
                )
              : const Center(child: CircularProgressIndicator()),
    );
  }
}
