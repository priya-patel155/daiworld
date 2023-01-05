import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../../core/constants/app_Color.dart';
import '../../models/GetSearchModel.dart';
import 'dart:io';

class Exceldownlode extends StatefulWidget {
  List<GetSearchModel>? getserchmodel = [];
  Exceldownlode({Key? key, this.getserchmodel}) : super(key: key);

  @override
  State<Exceldownlode> createState() => _ExceldownlodeState();
}

class _ExceldownlodeState extends State<Exceldownlode> {
  String? filePath;

  exportDataToExcel() async {
    var excel = Excel.createExcel();
    final sheet = excel.sheets[excel.getDefaultSheet() as String];
    sheet!.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 0)).value =
        "Stock Id";
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 0)).value =
        "Certi No";
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 0)).value =
        "Cts";
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: 0)).value =
        "Shape";
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: 0)).value =
        "Color";
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 5, rowIndex: 0)).value =
        "Polish";
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 6, rowIndex: 0)).value =
        "Clarity";
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 6, rowIndex: 0)).value =
        "Symm";
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 6, rowIndex: 0)).value =
        "Cut";
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 6, rowIndex: 0)).value =
        "Fls";

    for (int i = 0; i < widget.getserchmodel!.length; i++) {
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: i + 1))
          .value = widget.getserchmodel![i].iUserid;
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: i + 1))
          .value = widget.getserchmodel![i].certiNo;
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: i + 1))
          .value = widget.getserchmodel![i].cts;
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: i + 1))
          .value = widget.getserchmodel![i].shape;
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: i + 1))
          .value = widget.getserchmodel![i].color;
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 5, rowIndex: i + 1))
          .value = widget.getserchmodel![i].polish;
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 6, rowIndex: i + 1))
          .value = widget.getserchmodel![i].clarity;
    }

    List<int>? fileBytes = excel.save();

    /* if (fileBytes != null) {
      File(join(outputFile))
        ..createSync(recursive: true)
        ..writeAsBytesSync(fileBytes);
    }*/
    var dir = await getApplicationDocumentsDirectory();
    File file = File("${dir.path}/" + "Invoice_Report.xlsx");
    //  print(dir.path);
    File urlFile = await file.writeAsBytes(fileBytes!);
    // print(urlFile.absolute.path);
    filePath = urlFile.absolute.path;
    print("filePath $filePath");
    if (filePath != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Download Successfully')));

      await file.writeAsBytes(fileBytes);
      filePath = file.absolute.path;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          color: CustomTheme.primarycolor,
          onPressed: exportDataToExcel,
          child: Text(
            'export xls',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
