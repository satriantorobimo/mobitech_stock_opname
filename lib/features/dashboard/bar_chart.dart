import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:mobile_stock_opname/features/dashboard/class_status.dart';
import 'package:mobile_stock_opname/utility/string_router_util.dart';

class BarsChart extends StatelessWidget {
  final List<Status> data;

  const BarsChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Status, String>> series = [
      charts.Series(
        id: 'Status',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (Status sales, _) => sales.sts,
        measureFn: (Status sales, _) => sales.qty,
        data: data,
      )
    ];

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: charts.BarChart(
        series,
        animate: true,
        selectionModels: [
          charts.SelectionModelConfig(
              changedListener: (charts.SelectionModel model) {
            Navigator.pushNamed(
                context, StringRouterUtil.dailyDetailScreenRoute);
          })
        ],
      ),
    );
  }
}
