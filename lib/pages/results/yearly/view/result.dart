import 'package:api/models/yearly_saju/yearly_saju_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:models/models.dart';
import 'package:saju_mobile_v1/common/widgets/layouts/adaptive_column.dart';
import 'package:saju_mobile_v1/pages/results/yearly/bloc/bloc.dart';
import 'package:saju_mobile_v1/pages/results/yearly/view/chart.dart';

class YearlySajuResult extends StatelessWidget {
  const YearlySajuResult({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveColumn(
      portraitPadding: EdgeInsets.zero,
      landscapePadding: EdgeInsets.zero,
      spacing: 40,
      children: [
        const _ResultTitle(title: '2025 신년운세'),
        _ResultContent(),
      ],
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
      padding: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/yearly_top.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}

class _ResultContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return context.select(
      (YearlySajuResultBloc bloc) =>
          bloc.state.formStatus == FormStatus.success,
    )
        ? _SuccessResultContent(
            result:
                context.read<YearlySajuResultBloc>().state.yearlySajuResponse,
          )
        : const _FailureResultContent(error: '운세를 불러오는데 실패했습니다.');
  }
}

class _SuccessResultContent extends StatelessWidget {
  const _SuccessResultContent({required this.result});

  final YearlySajuResponse? result;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, bottom: 60),
      child: Column(
        spacing: 50,
        children: [
          _ResultField(
            title: '📇 인적정보',
            child: _MemberInfoItem(
              name: result!.name,
              birthDateTime: result!.birthDateTime,
              gender: result!.gender,
            ),
          ),
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
              result!.description.caution,
            ),
          ),
          if (result!.description.questionAnswer != null &&
              result!.description.questionAnswer!.isNotEmpty)
            _ResultField(
              title: '❓ (질문사항)',
              child: Text(
                result!.description.questionAnswer!,
              ),
            )
          else
            Container(),
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
      ),
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
          children: [
            Text(
              title,
              style: const TextStyle(
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
  const _MemberInfoItem({
    required this.name,
    required this.birthDateTime,
    required this.gender,
  });

  final String name;
  final DateTime birthDateTime;
  final Gender gender;

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
        padding: const EdgeInsets.symmetric(vertical: 16),
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
              gender == Gender.male ? '남자' : '여자',
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
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: const Text('홈으로'),
          ),
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
      child: const Text('처음으로'),
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
      child: const Text('공유하기'),
    );
  }
}
