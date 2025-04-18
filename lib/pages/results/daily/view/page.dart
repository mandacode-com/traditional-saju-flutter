import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:repository/repository.dart';
import 'package:saju_mobile_v1/common/widgets/form/custom_alert_dialog.dart';
import 'package:saju_mobile_v1/common/widgets/layouts/wating_screen.dart';
import 'package:saju_mobile_v1/pages/results/daily/bloc/bloc.dart';
import 'package:saju_mobile_v1/pages/results/daily/bloc/event.dart';
import 'package:saju_mobile_v1/pages/results/daily/view/result.dart';

class DailySajuResultPage extends StatelessWidget {
  const DailySajuResultPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const DailySajuResultPage());
  }

  @override
  Widget build(BuildContext context) {
    return PopScope<void>(
      canPop: false,
      onPopInvokedWithResult: (didPop, Object? result) async {
        if (!didPop) {
          await showDialog<bool>(
            context: context,
            builder:
                (context) => CustomAlertDialog(
                  title: '처음으로 돌아가시겠습니까?',
                  content: '결과는 자동으로 저장됩니다.',
                  confirmText: '예',
                  cancelText: '아니오',
                  onConfirm: () {
                    Navigator.of(context).pop(true);
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  onCancel: () {
                    Navigator.of(context).pop(false);
                  },
                ),
          );
        }
      },
      child: Scaffold(
        body: BlocProvider(
          create:
              (context) => DailySajuResultBloc(
                sajuRepository: context.read<SajuRepository>(),
              )..add(const DailyResultSubscriptionRequested()),
          child: _ResultPageContent(),
        ),
      ),
    );
  }
}

class _ResultPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return context.select(
      (DailySajuResultBloc bloc) =>
          (bloc.state.formStatus != FormStatus.loading) &&
                  (bloc.state.formStatus != FormStatus.initial)
              ? const DailySajuResult()
              : WatingScreen(
                duration: const Duration(milliseconds: 3000),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    '운명을 해석중입나다...\n'
                    '잠시만 기다려주세요.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      foreground:
                          Paint()
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
