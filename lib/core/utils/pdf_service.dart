import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui';

import 'package:dashboard_task/data/models/report_model.dart';

import 'package:syncfusion_flutter_pdf/pdf.dart';

class PdfService {
  Future<void> printCustomersPdf(List<ReportModel> data) async {
    //Create a new PDF document
    PdfDocument document = PdfDocument();
    PdfGrid grid = PdfGrid();

    //Define number of columns in table
    grid.columns.add(count: data.length-6);
    //Add header to the grid
    grid.headers.add(1);
    //Add the rows to the grid
    PdfGridRow header = grid.headers[0];
    header.cells[0].value = "Month";
    header.cells[1].value = "Operating Income";
    header.cells[2].value = "Others Income";
    header.cells[3].value = "Net Income";
    header.cells[4].value = "Subcription";
    header.cells[5].value = "Expense";
    //Add header style
    header.style = PdfGridCellStyle(
      backgroundBrush: PdfBrushes.lightGray,
      textBrush: PdfBrushes.black,
      font: PdfStandardFont(PdfFontFamily.timesRoman, 5),
    );

    //Add rows to grid
    for (final reportList in data) {
      PdfGridRow row = grid.rows.add();
      row.cells[0].value = reportList.month;
      row.cells[1].value = reportList.operatingincome;
      row.cells[2].value = reportList.otherincome;
      row.cells[3].value = reportList.netincome;
      row.cells[4].value = reportList.subcription;
      row.cells[5].value = reportList.expense;
    }
    //Add rows style
    grid.style = PdfGridStyle(
      cellPadding: PdfPaddings(left: 5, right: 5, top: 4, bottom: 5),
      backgroundBrush: PdfBrushes.white,
      textBrush: PdfBrushes.black,
      font: PdfStandardFont(PdfFontFamily.timesRoman, 5),
    );

    //Draw the grid
    grid.draw(
        page: document.pages.add(), bounds: const Rect.fromLTWH(0, 0, 0, 0));
    List<int> bytes = await document.save();
    
    //Download document
    AnchorElement(
        href:
            "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}")
      ..setAttribute("download", "report.pdf")
      ..click();
   
    //Dispose the document
    document.dispose();
     
  }
}