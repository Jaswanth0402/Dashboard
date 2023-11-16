import 'package:dashboard_task/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  final List<ChartData> chartData = [
    ChartData(
      "Jan",
      3,
    ),
    ChartData(
      "Feb",
      2,
    ),
    ChartData(
      "Mar",
      4,
    ),
    ChartData(
      "Apr",
      0.5,
    ),
    ChartData(
      "May",
      1,
    ),
    ChartData(
      "Jun",
      1.5,
    ),
    ChartData(
      "Jul",
      2,
    ),
    ChartData(
      "Aug",
      1,
    ),
    ChartData(
      "Sep",
      2.8,
    ),
    ChartData(
      "Oct",
      1.5,
    ),
    ChartData(
      "Nov",
      5,
    ),
    ChartData(
      "Dec",
      2,
    ),
    

  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      
      child: Column(
        children: [

          SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            backgroundColor: white,
            
            series: [
              StackedColumnSeries(
                  dataSource: chartData,
                  xValueMapper: (ChartData ch, _) => ch.x,
                  yValueMapper: (ChartData ch, _) => ch.y1,
                  
            width: 0.3,
            
            color: darkGrey
            // // borderRadius:const BorderRadius.all(Radius.circular(10)
            // ),
              ),

            ],
          ),
          // const SizedBox(height: 10,),
          // const Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text("Y-axis - hours of study"),
          //     Text("X-axis - Day of month"),
          //   ],
          // ),
        ],
      ),
    );
  }
}

class ChartData {
  final String x;
  final double y1;

  ChartData(this.x, this.y1);
}