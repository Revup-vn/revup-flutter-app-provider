import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:revup_core/core.dart';

import '../../l10n/l10n.dart';

class AnalyticsView extends StatelessWidget {
  const AnalyticsView({super.key});

  @override
  Widget build(BuildContext context) {
    final testDataY = [
      200000,
      400000,
      100000,
      600000,
      800000,
      900000,
      0,
      400000,
      600000,
      1000000,
      100000,
      700000
    ];
    final dataY = [2, 1, 3, 4, 1, 1, 0, 2, 3, 2, 1, 2];
    final monthYear = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            '${l10n.totalIncome} :',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Center(
            child: AutoSizeText(
              context.formatMoney(1000000),
              style: Theme.of(context).textTheme.labelLarge,
            ),
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
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  lineTouchData: LineTouchData(
                    enabled: true,
                    touchTooltipData: LineTouchTooltipData(
                      getTooltipItems: (touchedSpots) => touchedSpots
                          .map(
                            (e) => LineTooltipItem(
                              context.formatMoney(e.y.toInt()),
                              const TextStyle(),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  maxY: (testDataY.reduce(max) + 1000000).toDouble(),
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
                  lineBarsData: [
                    LineChartBarData(
                      isCurved: true,
                      spots: testDataY
                          .asMap()
                          .entries
                          .map<FlSpot>(
                            (e) => FlSpot(
                              e.key.toDouble(),
                              testDataY[e.key].toDouble(),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
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
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  lineTouchData: LineTouchData(
                    enabled: true,
                    touchTooltipData: LineTouchTooltipData(
                      getTooltipItems: (touchedSpots) => touchedSpots
                          .map(
                            (e) => LineTooltipItem(
                              e.y.toInt().toString(),
                              const TextStyle(),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  maxY: (dataY.reduce(max) + 10).toDouble(),
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
                    bottomTitles: AxisTitles(
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
                  lineBarsData: [
                    LineChartBarData(
                      isCurved: true,
                      spots: testDataY
                          .asMap()
                          .entries
                          .map<FlSpot>(
                            (e) => FlSpot(
                              e.key.toDouble(),
                              dataY[e.key].toDouble(),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
