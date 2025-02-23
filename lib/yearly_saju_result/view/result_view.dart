import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:saju/config/config.dart';
import 'package:saju/yearly_saju_result/bloc/result_bloc.dart';
import 'package:saju/yearly_saju_result/view/chart_view.dart';
import 'package:saju_api/saju_api.dart';

class YearlySajuResultView extends StatelessWidget {
  const YearlySajuResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _ResultTitle(title: '2025 신년운세'),
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
  const _ResultTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/saju_result_top.png'),
          fit: BoxFit.cover,
          alignment: Alignment(0.0, 0.0),
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _ResultContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return context.select((YearlySajuResultBloc bloc) =>
            bloc.state.status == YearlySajuResultStatus.success)
        ? _SuccessResultContent(
            result: context.read<YearlySajuResultBloc>().state.yearlySajuResult)
        : _FailureResultContent(error: '운세를 불러오는데 실패했습니다.');
  }
}

class _SuccessResultContent extends StatelessWidget {
  const _SuccessResultContent({required this.result});

  final YearlySajuResult? result;

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
          title: '🔍 사주원국표 / 오행분석',
          child: Center(
            child: ChartView(
              chart: result!.chart,
            ),
          ),
        ),
        _ResultField(
          title: '🌟 신년운세 총운',
          child: Text(
            result!.description.general,
          ),
        ),
        _ResultField(
          title: '🤝 대인관계운',
          child: Text(
            result!.description.relationship,
          ),
        ),
        _ResultField(
          title: '💎 재물운',
          child: Text(
            result!.description.career,
          ),
        ),
        _ResultField(
          title: '❤️ 연애운',
          child: Text(
            result!.description.romantic,
          ),
        ),
        _ResultField(
          title: '💊 건강운',
          child: Text(
            result!.description.health,
          ),
        ),
        _ResultField(
          title: '🏢 직장운',
          child: Text(
            result!.description.career,
          ),
        ),
        _ResultField(
          title: '🍀 운을 높이는 법',
          child: Text(
            result!.description.waysToImprove,
          ),
        ),
        _ResultField(
          title: '🚨 올해의 주의사항',
          child: Text(
            result!.description.waysToAvoidBadLuck,
          ),
        ),
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

class _MemberInfoItem extends StatelessWidget {
  const _MemberInfoItem(
      {required this.name, required this.birthDateTime, required this.gender});

  final String name;
  final DateTime birthDateTime;
  final ApiGenderType gender;

  static const textStyle = TextStyle(
    fontSize: 14,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: textStyle,
            ),
            Text(
              DateFormat('yyyy/MM/dd HH:mm').format(birthDateTime),
              style: textStyle,
            ),
            Text(
              gender == ApiGenderType.male ? '남자' : '여자',
              style: textStyle,
            ),
          ],
        ),
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
