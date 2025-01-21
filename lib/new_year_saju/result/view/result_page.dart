import 'package:byul_mobile/new_year_saju/result/bloc/result_bloc.dart';
import 'package:byul_mobile/new_year_saju/result/view/result_view.dart';
import 'package:byul_mobile/widgets/wating.dart';
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
              ? ResultView(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("success"),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .popUntil((route) => route.isFirst);
                            },
                            child: Text("홈으로")),
                      ],
                    ),
                  ),
                )
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
