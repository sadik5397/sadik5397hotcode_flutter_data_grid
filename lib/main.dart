import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

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
        ),
        body: SfDataGrid(
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
            return Center(child: Text(cell.value.toString()));
          case "name":
            return Center(child: Text(cell.value.toString()));
          default:
            return Center(child: Text(cell.value.toString()));
        }
      }).toList());
}
