import 'package:flutter/material.dart';
// External package imports
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_datagrid_export/export.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' hide Column, Row;

// Platform specific import
import 'save_file_export/save_file_mobile.dart' if (dart.library.html) 'save_file_export/save_file_web.dart' as helper;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'sadik5397 Data Grid', debugShowCheckedModeBanner: false, theme: ThemeData(useMaterial3: true), home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late EmployeeDataSource employeeDataSource;
  final GlobalKey<SfDataGridState> _key = GlobalKey<SfDataGridState>();

  List<Map<String, String>> columns = [
    {"key": "id", "value": "ID"},
    {"key": "name", "value": "Name"},
    {"key": "designation", "value": "Designation"},
    {"key": "salary", "value": "Salary"},
  ];

  List<Map<String, dynamic>> apiResult = [
    {"id": 10001, "name": "James", "designation": "Project Lead", "salary": 20000},
    {"id": 10002, "name": "Kathryn", "designation": "Manager", "salary": 30000},
    {"id": 10003, "name": "Lara", "designation": "Developer", "salary": 15000},
    {"id": 10004, "name": "Michael", "designation": "Designer", "salary": 15000},
    {"id": 10005, "name": "Martin", "designation": "Developer", "salary": 15000},
    {"id": 10006, "name": "Newberry", "designation": "Developer", "salary": 15000},
    {"id": 10007, "name": "Balnc", "designation": "Developer", "salary": 15000},
    {"id": 10008, "name": "Perry", "designation": "Developer", "salary": 15000},
    {"id": 10009, "name": "Gable", "designation": "Developer", "salary": 15000},
    {"id": 10010, "name": "Grimes", "designation": "Developer", "salary": 15000}
  ];

  Future<void> _exportDataGridToExcel() async {
    final Workbook workbook = _key.currentState!.exportToExcelWorkbook();

    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();

    await helper.saveAndLaunchFile(bytes, 'DataGrid.xlsx');
  }

  Future<void> _exportDataGridToPdf() async {
    final PdfDocument document = _key.currentState!.exportToPdfDocument(fitAllColumnsInOnePage: true);

    final List<int> bytes = document.saveSync();
    await helper.saveAndLaunchFile(bytes, 'DataGrid.pdf');
    document.dispose();
  }

  @override
  void initState() {
    super.initState();
    employeeDataSource = EmployeeDataSource(columns, apiResult); //API Call (apiResult)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Syncfusion Flutter DataGrid'),
          actions: [
            MaterialButton(color: Colors.blue, onPressed: _exportDataGridToExcel, child: const Center(child: Text('Export to Excel', style: TextStyle(color: Colors.white)))),
            const Padding(padding: EdgeInsets.all(20)),
            MaterialButton(color: Colors.blue, onPressed: _exportDataGridToPdf, child: const Center(child: Text('Export to PDF', style: TextStyle(color: Colors.white)))),
          ],
        ),
        body: SfDataGrid(
            key: _key,
            source: employeeDataSource,
            columnWidthMode: ColumnWidthMode.fill,
            columns: List.generate(
                columns.length,
                (index) => GridColumn(
                      columnName: columns[index]["key"] ?? "",
                      autoFitPadding: const EdgeInsets.all(8.0),
                      label: Center(child: Text(columns[index]["value"] ?? "", overflow: TextOverflow.ellipsis)),
                    ))));
  }
}

class EmployeeDataSource extends DataGridSource {
  List<DataGridRow> tableRows = [];

  EmployeeDataSource(List columns, List data) {
    tableRows = List.generate(
        data.length,
        (i) => DataGridRow(cells: List.generate(columns.length, (j) => DataGridCell(columnName: columns[j]["key"], value: data[i][columns[j]["key"]]))
            // cells: [
            //   DataGridCell(columnName: 'id', value: result[i]["id"]),
            //   DataGridCell(columnName: 'name', value: result[i]["name"]),
            //   DataGridCell(columnName: 'designation', value: result[i]["designation"]),
            //   DataGridCell(columnName: 'salary', value: result[i]["salary"]),
            // ],
            ));
  }

  @override
  List<DataGridRow> get rows => tableRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) => DataGridRowAdapter(
          cells: row.getCells().map((cell) {
        switch (cell.columnName) {
          case "id":
            return Center(child: SelectableText(cell.value.toString()));
          case "name":
            return Center(child: SelectableText(cell.value.toString()));
          default:
            return Center(child: SelectableText(cell.value.toString()));
        }
      }).toList());
}
