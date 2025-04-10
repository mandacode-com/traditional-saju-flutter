import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:repository/repository.dart';
import 'package:saju_mobile_v1/common/widgets/layouts/wating_screen.dart';
import 'package:saju_mobile_v1/pages/results/yearly/bloc/bloc.dart';
import 'package:saju_mobile_v1/pages/results/yearly/bloc/event.dart';
import 'package:saju_mobile_v1/pages/results/yearly/view/result.dart';

class YearlySajuResultPage extends StatelessWidget {
  const YearlySajuResultPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const YearlySajuResultPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => YearlySajuResultBloc(
          sajuRepository: context.read<SajuRepository>(),
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
      (YearlySajuResultBloc bloc) =>
          (bloc.state.formStatus != FormStatus.loading) &&
                  (bloc.state.formStatus != FormStatus.initial)
              ? const YearlySajuResult()
              : WatingScreen(
                  duration: const Duration(milliseconds: 3000),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      '운명을 해석중입나다...\n'
                      '잠시만 기다려주세요. 자세한 풀이를 위해 노력중입니다.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 0.1
                          ..color = Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontFamily: 'MapoFlowerIsland',
                        height: 2.5,
                      ),
                    ),
                  ),
                ),
    );
  }
}
