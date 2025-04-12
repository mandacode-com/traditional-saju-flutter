import 'package:flutter/material.dart';
import 'package:models/models.dart';

class ChartView extends StatelessWidget {
  const ChartView({required this.chart, super.key});

  final Chart chart;

  static const List<String> _columns = [
    '',
    '연주',
    '월주',
    '일주',
    '시주',
  ];

  static String convertHevenlyStem(HeavenlyStem stem) {
    switch (stem) {
      case HeavenlyStem.gyeong:
        return '경(庚)';
      case HeavenlyStem.byeong:
        return '병(丙)';
      case HeavenlyStem.jeong:
        return '정(丁)';
      case HeavenlyStem.gye:
        return '계(癸)';
      case HeavenlyStem.sin:
        return '신(辛)';
      case HeavenlyStem.eul:
        return '을(乙)';
      case HeavenlyStem.gap:
        return '갑(甲)';
      case HeavenlyStem.im:
        return '임(壬)';
      case HeavenlyStem.mu:
        return '무(戊)';
      case HeavenlyStem.gi:
        return '기(己)';
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
      case EarthlyBranch.yu:
        return '유(巳)';
      case EarthlyBranch.sin:
        return '신(午)';
      case EarthlyBranch.hae:
        return '해(未)';
      case EarthlyBranch.o:
        return '오(申)';
      case EarthlyBranch.mi:
        return '미(酉)';
      case EarthlyBranch.sul:
        return '술(戌)';
      case EarthlyBranch.sa:
        return '사(亥)';
    }
  }

  static String convertFiveElement(FiveElement element) {
    switch (element) {
      case FiveElement.to:
        return '토(土)';
      case FiveElement.su:
        return '수(水)';
      case FiveElement.mok:
        return '목(木)';
      case FiveElement.hwa:
        return '화(火)';
      case FiveElement.geum:
        return '금(金)';
    }
  }

  static String undefinedHour = '없음';

  @override
  Widget build(BuildContext context) {
    return DataTable(
      headingTextStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
      decoration: const BoxDecoration(),
      dataTextStyle: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
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
            const DataCell(
              _DataCellTitle(text: '천간'),
            ),
            DataCell(
              _DataCellItem(
                text: convertHevenlyStem(chart.heavenly.stems.year),
              ),
            ),
            DataCell(
              _DataCellItem(
                text: convertHevenlyStem(chart.heavenly.stems.month),
              ),
            ),
            DataCell(
              _DataCellItem(
                text: convertHevenlyStem(chart.heavenly.stems.day),
              ),
            ),
            DataCell(
              _DataCellItem(
                text: chart.heavenly.stems.hour == null
                    ? undefinedHour
                    : convertHevenlyStem(chart.heavenly.stems.hour!),
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
    return Text(
      text,
      textAlign: TextAlign.center,
    );
  }
}
