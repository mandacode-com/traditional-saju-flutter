import 'package:saju/yearly_saju_result/bloc/result_bloc.dart';
import 'package:saju/yearly_saju_result/view/result_view.dart';
import 'package:saju/widgets/wating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yearly_saju_repository/yearly_saju_repository.dart';

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
          yearlySajuRepository: context.read<YearlySajuRepository>(),
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
          (bloc.state.status != YearlySajuResultStatus.loading) &&
                  (bloc.state.status != YearlySajuResultStatus.initial)
              ? YearlySajuResultView()
              : Wating(
                  duration: Duration(milliseconds: 3000),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "운명을 해석중입나다...\n"
                      "잠시만 기다려주세요. 자세한 풀이를 위해 노력중입니다.",
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
