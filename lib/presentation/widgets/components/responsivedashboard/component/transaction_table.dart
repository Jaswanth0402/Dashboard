
import 'package:dashboard_task/core/utils/colors.dart';
import 'package:dashboard_task/data/constant%20data/table_data.dart';
import 'package:dashboard_task/data/models/table_model.dart';
import 'package:flutter/material.dart';

class TransactionTable extends StatelessWidget {
  const TransactionTable({super.key});

  @override
  Widget build(BuildContext context) {
  return SizedBox(
    width: double.infinity,
    child: DataTable(
        columns: const [
          DataColumn(
              label: Text(
            "Number",
            style: TextStyle(
                color:lightBlack, fontWeight: FontWeight.bold),
          )),
          DataColumn(
              label: Text(
            "Date",
            style: TextStyle(
                color: lightBlack, fontWeight: FontWeight.bold),
          )),
          DataColumn(
              label: Text("Client name",
                  style: TextStyle(
                      color:lightBlack, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text("Amount",
                  style: TextStyle(
                      color: lightBlack, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text("Status",
                  style: TextStyle(
                      color: lightBlack, fontWeight: FontWeight.bold))),
        ],
        rows: List.generate(
            tableData.length,
            (index) => coursesDataRow(
                  tableData[index],
                ))),
  );
}

DataRow coursesDataRow(TableData transactionInfo) {
  return DataRow(cells: [
    DataCell(Text(transactionInfo.number)),
    DataCell(Text(transactionInfo.date)),
    DataCell(Text(transactionInfo.Clientname)),
    DataCell(Text(transactionInfo.amount)),
    DataCell(Text(transactionInfo.status,
        style: TextStyle(
          color:
              transactionInfo.status == "success" ?green :purple,
        ))),
  ]);
}
  }


