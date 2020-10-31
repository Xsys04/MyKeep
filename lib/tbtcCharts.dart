import 'KChartSeries.dart';
import 'package:fl_animated_linechart/chart/area_line_chart.dart';
import 'package:fl_animated_linechart/common/pair.dart';
import 'package:fl_animated_linechart/fl_animated_linechart.dart';
import 'package:flutter/material.dart';

class Charts with KChartSeries {
 Widget getChart(Map<String, dynamic> data) {
    Map<DateTime, double> line1 = createLine1(data);

    LineChart chart;

    chart = AreaLineChart.fromDateTimeMaps([line1], [Colors.black54], [''],
        gradients: [Pair(Colors.white, Colors.black12)]);

    return Container(
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: AnimatedLineChart(
                  chart,
                  key: UniqueKey(),
                ), //Unique key to force animations
              )),
            ]),
    );
  }
}
