import 'package:dashboard_task/bloc/dashboard/bloc/dashboard_bloc.dart';
import 'package:dashboard_task/core/utils/colors.dart';
import 'package:dashboard_task/data/models/report_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/string.dart';
import '../../../../../core/utils/pdf_service.dart';




class ReportWidget extends StatefulWidget {
  const ReportWidget({Key? key}) : super(key: key);

  @override
  State<ReportWidget> createState() => _ReportWidgetState();
}

class _ReportWidgetState extends State<ReportWidget> {
  @override
  Widget build(BuildContext context) {
    return 
       Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color:darkGrey),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton.icon( 
                    onPressed: (){
                            BlocProvider.of<DashboardBloc>(context).add(PdfReportDownloadEvent());
                          } , 
                            style: ElevatedButton.styleFrom(backgroundColor: lightBlueAccent),
                               icon: const Icon(Icons.print,color: white,), 
                               label: const Text(Strings.report,style: TextStyle(color: white),)),
                ],
              ),
              FittedBox(
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text("Month",style: TextStyle(fontWeight: FontWeight.bold),)),
                    DataColumn(label: Text("Operating Income",style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text("Other Income",style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text("Net Income",style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text("Subcription",style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text("Expense",style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                  rows: reportList.map((income) => DataRow(cells: [
                    DataCell(Text(income.month)),
                    DataCell(Text(income.operatingincome)),
                    DataCell(Text(income.otherincome)),
                    DataCell(Text(income.netincome)),
                    DataCell(Text(income.subcription)),
                    DataCell(Text(income.expense)),
                  ])).toList(),
                ),
              ),
            ],
          ),
        ),
      );
      
    
  }
}