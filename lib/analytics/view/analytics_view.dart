import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:revup_core/core.dart';

import '../../l10n/l10n.dart';

class AnalyticsView extends StatelessWidget {
  const AnalyticsView(
    this.testDataY,
    this.dataY,
    this.total, {
    super.key,
  });
  final List<int> testDataY;
  final List<int> dataY;
  final int total;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final monthYear = [
      l10n.janLabel,
      l10n.febLabel,
      l10n.marLabel,
      l10n.aprLabel,
      l10n.mayLabel,
      l10n.junLabel,
      l10n.julLabel,
      l10n.augLabel,
      l10n.sepLabel,
      l10n.octLabel,
      l10n.novLabel,
      l10n.decLabel,
    ];

    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            '${l10n.totalIncome} :',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: AutoSizeText(
              context.formatMoney(total),
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          AutoSizeText(
            '${l10n.incomeAnalytics} :',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                right: 15,
                bottom: 30,
              ),
              child: dataY.fold<int>(
                        0,
                        (previousValue, element) => previousValue + element,
                      ) !=
                      0
                  ? BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceAround,
                        borderData: FlBorderData(show: false),
                        gridData: FlGridData(show: false),
                        barTouchData: BarTouchData(
                          enabled: true,
                          touchTooltipData: BarTouchTooltipData(
                            getTooltipItem:
                                (group, groupIndex, rod, rodIndex) =>
                                    BarTooltipItem(
                              context
                                  .formatMoney(group.barRods.first.toY.toInt()),
                              const TextStyle(),
                            ),
                          ),
                        ),
                        maxY: testDataY.reduce(max) * 1.2,
                        minY: testDataY.reduce(min).toDouble(),
                        titlesData: FlTitlesData(
                          show: true,
                          topTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                            ),
                          ),
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                            ),
                          ),
                          bottomTitles: AxisTitles(
                            axisNameWidget: Text(
                              l10n.incomePerMonthLabel,
                            ),
                            axisNameSize: 30,
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) => SideTitleWidget(
                                space: 4,
                                axisSide: meta.axisSide,
                                child: Text(
                                  monthYear[value.toInt()],
                                  style: const TextStyle(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        barGroups: testDataY
                            .asMap()
                            .entries
                            .map<BarChartGroupData>(
                              (e) => BarChartGroupData(
                                x: e.key,
                                barRods: [
                                  BarChartRodData(
                                    toY: e.value.toDouble(),
                                    borderRadius: BorderRadius.zero,
                                  )
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    )
                  : Container(),
            ),
          ),
          AutoSizeText(
            '${l10n.transitionAnalytics} :',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                right: 15,
                bottom: 30,
              ),
              child: dataY.fold<int>(
                        0,
                        (previousValue, element) => previousValue + element,
                      ) !=
                      0
                  ? BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceAround,
                        borderData: FlBorderData(show: false),
                        gridData: FlGridData(show: false),
                        barTouchData: BarTouchData(
                          enabled: true,
                          touchTooltipData: BarTouchTooltipData(
                            getTooltipItem:
                                (group, groupIndex, rod, rodIndex) =>
                                    BarTooltipItem(
                              context
                                  .formatMoney(group.barRods.first.toY.toInt()),
                              const TextStyle(),
                            ),
                          ),
                        ),
                        maxY: (dataY.reduce(max) * 1.2).ceilToDouble(),
                        minY: dataY.reduce(min).toDouble(),
                        titlesData: FlTitlesData(
                          show: true,
                          topTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                            ),
                          ),
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) => Text(
                                (value * 2).toInt().toString(),
                                style: const TextStyle(),
                              ),
                            ),
                          ),
                          bottomTitles: AxisTitles(
                            axisNameWidget: Text(l10n.transPerMonthLabel),
                            axisNameSize: 30,
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) => SideTitleWidget(
                                space: 4,
                                axisSide: meta.axisSide,
                                child: Text(
                                  monthYear[value.toInt()],
                                  style: const TextStyle(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        barGroups: dataY
                            .asMap()
                            .entries
                            .map<BarChartGroupData>(
                              (e) => BarChartGroupData(
                                x: e.key,
                                barRods: [
                                  BarChartRodData(
                                    toY: e.value.toDouble(),
                                    borderRadius: BorderRadius.zero,
                                  )
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    )
                  : Container(),
            ),
          ),
        ],
      ),
    );
  }
}
