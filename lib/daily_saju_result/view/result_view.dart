import 'package:api/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:models/models.dart';
import 'package:saju/config/config.dart';
import 'package:saju/daily_saju_result/bloc/result_bloc.dart';
import 'package:saju/widgets/circle_with_text.dart';

class DailySajuResultView extends StatelessWidget {
  const DailySajuResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _ResultTitle(
              title: '오늘의 운세',
              subtitle: DateFormat('yyyy.MM.dd (E)', 'ko_KR').format(
                DateTime.now(),
              ),
            ),
            Padding(
              padding:
                  MediaQuery.of(context).orientation == Orientation.landscape
                      ? Config.getLandScapeHorizontalPadding(context).copyWith(
                          top: 40,
                          bottom: 40,
                        )
                      : Config.verticalPagePadding.copyWith(
                          top: 40,
                          bottom: 40,
                        ),
              child: _ResultContent(),
            )
          ],
        ),
      ),
    );
  }
}

class _ResultTitle extends StatelessWidget {
  const _ResultTitle({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/daily_top.jpeg'),
          fit: BoxFit.cover,
          alignment: Alignment(0.0, 0.0),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 14,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                fontFamily: 'MapoFlowerIsland',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ResultContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return context.select((DailySajuResultBloc bloc) =>
            bloc.state.status == DailySajuResultStatus.success)
        ? _SuccessResultContent(
            result: context.read<DailySajuResultBloc>().state.dailySajuResult)
        : _FailureResultContent(error: '운세를 불러오는데 실패했습니다.');
  }
}

class _SuccessResultContent extends StatelessWidget {
  const _SuccessResultContent({required this.result});

  final DailySajuResponse? result;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 50,
      children: [
        _ResultField(
            title: '📇 인적정보',
            child: _MemberInfoItem(
              name: result!.name,
              birthDateTime: result!.birthDateTime,
              gender: result!.gender,
            )),
        _ResultField(
          title: '📝 오늘의 한마디',
          child: _TodayShortMessage(
              todayShortMessage: '"${result!.todayShortMessage}"'),
        ),
        _ResultField(
          title: '🌟 오늘의 총운',
          //child: Text(
          //  result!.totalFortuneMessage,
          //),
          //child: CircleWithText(number: result!.fortuneScore),
          child: Column(
            spacing: 20,
            children: [
              Center(
                child: CircleWithText(
                  number: result!.fortuneScore,
                ),
              ),
              Text(
                result!.totalFortuneMessage,
              ),
            ],
          ),
        ),
        _ResultField(
          title: '🤝 대인관계운',
          child: Text(
            result!.relationship,
          ),
        ),
        _ResultField(
          title: '💎 재물운',
          child: Text(
            result!.wealth,
          ),
        ),
        _ResultField(
          title: '❤️  연애운',
          child: Text(
            result!.romantic,
          ),
        ),
        _ResultField(
          title: '💊 건강운',
          child: Text(
            result!.health,
          ),
        ),
        _ResultField(
          title: '🚨 주의사항',
          child: Text(
            result!.caution,
          ),
        ),
        result!.questionAnswer.isNotEmpty
            ? _ResultField(
                title: '❓ (질문사항)',
                child: Text(
                  result!.questionAnswer,
                ),
              )
            : Container(),
        Row(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: _HomeButton(),
            ),
            Expanded(
              child: _ShareButton(),
            ),
          ],
        ),
      ],
    );
  }
}

class _ResultField extends StatelessWidget {
  const _ResultField({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ],
        ),
        child,
      ],
    );
  }
}

class _ShadowContainer extends StatelessWidget {
  const _ShadowContainer({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: child,
      ),
    );
  }
}

class _TodayShortMessage extends StatelessWidget {
  const _TodayShortMessage({required this.todayShortMessage});

  final String todayShortMessage;

  @override
  Widget build(BuildContext context) {
    return _ShadowContainer(
      child: Center(
        child: Text(
          todayShortMessage,
        ),
      ),
    );
  }
}

class _MemberInfoItem extends StatelessWidget {
  const _MemberInfoItem(
      {required this.name, required this.birthDateTime, required this.gender});

  final String name;
  final DateTime birthDateTime;
  final Gender gender;

  @override
  Widget build(BuildContext context) {
    return _ShadowContainer(
      child: Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
          ),
          Text(
            DateFormat('yyyy/MM/dd HH:mm').format(birthDateTime),
          ),
          Text(
            gender == Gender.male ? '남자' : '여자',
          ),
        ],
      ),
    );
  }
}

class _FailureResultContent extends StatelessWidget {
  const _FailureResultContent({required this.error});

  final String error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            error,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: Text('홈으로'),
          )
        ],
      ),
    );
  }
}

class _HomeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.grey[200]),
        foregroundColor: WidgetStateProperty.all(Colors.grey[800]),
      ),
      onPressed: () {
        Navigator.of(context).popUntil((route) => route.isFirst);
      },
      child: Text('처음으로'),
    );
  }
}

class _ShareButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.black),
        foregroundColor: WidgetStateProperty.all(Colors.grey[100]),
      ),
      onPressed: () {},
      child: Text('공유하기'),
    );
  }
}
