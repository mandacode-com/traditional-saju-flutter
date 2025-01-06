import 'package:byul_mobile/today_saju/bloc/today_saju_bloc.dart';
import 'package:byul_mobile/today_saju/view/today_saju_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodaySajuPage extends StatelessWidget {
  const TodaySajuPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const TodaySajuPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Byuljogak Saju'),
      ),
      body: BlocProvider(
        create: (context) => TodaySajuBloc(),
        child: const TodaySajuForm(),
      ),
    );
  }
}
