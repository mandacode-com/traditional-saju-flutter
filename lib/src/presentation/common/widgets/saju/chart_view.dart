import 'package:flutter/material.dart';
import 'package:traditional_saju/src/domain/saju/entity/chart.dart';
import 'package:traditional_saju/src/domain/saju/value/earthly_branch.dart';
import 'package:traditional_saju/src/domain/saju/value/five_element.dart';
import 'package:traditional_saju/src/domain/saju/value/heavenly_stem.dart';

/// Widget to display Saju chart with heavenly stems and earthly branches
class ChartView extends StatelessWidget {
  const ChartView({required this.chart, super.key});

  final Chart chart;

  static const List<String> _columns = ['', '연주', '월주', '일주', '시주'];
  static const String undefinedHour = '없음';

  static String convertHeavenlyStem(HeavenlyStem stem) {
    switch (stem) {
      case HeavenlyStem.gap:
        return '갑(甲)';
      case HeavenlyStem.eul:
        return '을(乙)';
      case HeavenlyStem.byeong:
        return '병(丙)';
      case HeavenlyStem.jeong:
        return '정(丁)';
      case HeavenlyStem.mu:
        return '무(戊)';
      case HeavenlyStem.gi:
        return '기(己)';
      case HeavenlyStem.gyeong:
        return '경(庚)';
      case HeavenlyStem.sin:
        return '신(辛)';
      case HeavenlyStem.im:
        return '임(壬)';
      case HeavenlyStem.gye:
        return '계(癸)';
    }
  }

  static String convertEarthlyBranch(EarthlyBranch branch) {
    switch (branch) {
      case EarthlyBranch.ja:
        return '자(子)';
      case EarthlyBranch.chuk:
        return '축(丑)';
      case EarthlyBranch.inn:
        return '인(寅)';
      case EarthlyBranch.myo:
        return '묘(卯)';
      case EarthlyBranch.jin:
        return '진(辰)';
      case EarthlyBranch.sa:
        return '사(巳)';
      case EarthlyBranch.o:
        return '오(午)';
      case EarthlyBranch.mi:
        return '미(未)';
      case EarthlyBranch.sin:
        return '신(申)';
      case EarthlyBranch.yu:
        return '유(酉)';
      case EarthlyBranch.sul:
        return '술(戌)';
      case EarthlyBranch.hae:
        return '해(亥)';
    }
  }

  static String convertFiveElement(FiveElement element) {
    switch (element) {
      case FiveElement.mok:
        return '목(木)';
      case FiveElement.hwa:
        return '화(火)';
      case FiveElement.to:
        return '토(土)';
      case FiveElement.geum:
        return '금(金)';
      case FiveElement.su:
        return '수(水)';
    }
  }

  @override
  Widget build(BuildContext context) {
    return DataTable(
      headingTextStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
      decoration: const BoxDecoration(),
      dataTextStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
      columnSpacing: 20,
      columns: _columns
          .map(
            (e) => DataColumn(
              headingRowAlignment: MainAxisAlignment.center,
              label: Text(e, textAlign: TextAlign.center),
            ),
          )
          .toList(growable: false),
      rows: [
        DataRow(
          cells: [
            const DataCell(_DataCellTitle(text: '천간')),
            DataCell(
              _DataCellItem(
                text: convertHeavenlyStem(chart.heavenly.stems.year),
              ),
            ),
            DataCell(
              _DataCellItem(
                text: convertHeavenlyStem(chart.heavenly.stems.month),
              ),
            ),
            DataCell(
              _DataCellItem(
                text: convertHeavenlyStem(chart.heavenly.stems.day),
              ),
            ),
            DataCell(
              _DataCellItem(
                text: chart.heavenly.stems.hour == null
                    ? undefinedHour
                    : convertHeavenlyStem(chart.heavenly.stems.hour!),
              ),
            ),
          ],
        ),
        DataRow(
          cells: [
            const DataCell(_DataCellTitle(text: '오행')),
            DataCell(
              _DataCellItem(
                text: convertFiveElement(chart.heavenly.fiveElements.year),
              ),
            ),
            DataCell(
              _DataCellItem(
                text: convertFiveElement(chart.heavenly.fiveElements.month),
              ),
            ),
            DataCell(
              _DataCellItem(
                text: convertFiveElement(chart.heavenly.fiveElements.day),
              ),
            ),
            DataCell(
              _DataCellItem(
                text: chart.heavenly.fiveElements.hour == null
                    ? undefinedHour
                    : convertFiveElement(chart.heavenly.fiveElements.hour!),
              ),
            ),
          ],
        ),
        DataRow(
          cells: [
            const DataCell(_DataCellTitle(text: '지지')),
            DataCell(
              _DataCellItem(
                text: convertEarthlyBranch(chart.earthly.branches.year),
              ),
            ),
            DataCell(
              _DataCellItem(
                text: convertEarthlyBranch(chart.earthly.branches.month),
              ),
            ),
            DataCell(
              _DataCellItem(
                text: convertEarthlyBranch(chart.earthly.branches.day),
              ),
            ),
            DataCell(
              _DataCellItem(
                text: chart.earthly.branches.hour == null
                    ? undefinedHour
                    : convertEarthlyBranch(chart.earthly.branches.hour!),
              ),
            ),
          ],
        ),
        DataRow(
          cells: [
            const DataCell(_DataCellTitle(text: '오행')),
            DataCell(
              _DataCellItem(
                text: convertFiveElement(chart.earthly.fiveElements.year),
              ),
            ),
            DataCell(
              _DataCellItem(
                text: convertFiveElement(chart.earthly.fiveElements.month),
              ),
            ),
            DataCell(
              _DataCellItem(
                text: convertFiveElement(chart.earthly.fiveElements.day),
              ),
            ),
            DataCell(
              _DataCellItem(
                text: chart.earthly.fiveElements.hour == null
                    ? undefinedHour
                    : convertFiveElement(chart.earthly.fiveElements.hour!),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _DataCellTitle extends StatelessWidget {
  const _DataCellTitle({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(fontWeight: FontWeight.w600),
    );
  }
}

class _DataCellItem extends StatelessWidget {
  const _DataCellItem({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, textAlign: TextAlign.center);
  }
}
