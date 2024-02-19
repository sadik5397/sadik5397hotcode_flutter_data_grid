import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
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
  final DataGridController dataGridController = DataGridController();

  int rowsPerPage = 20;
  List<Map<String, String>> columns = [
    {"key": "id", "value": "ID"},
    {"key": "name", "value": "Mame"},
    {"key": "designation", "value": "Designation"},
    {"key": "salary", "value": "Salary"},
    {"key": "action", "value": "Action"},
  ];

  List<Map<String, dynamic>> apiResult = [
    {"id": 10011, "name": "John", "designation": "Developer", "salary": 15000},
    {"id": 10012, "name": "Emily", "designation": "Designer", "salary": 15000},
    {"id": 10013, "name": "Oliver", "designation": "Developer", "salary": 15000},
    {"id": 10014, "name": "Charlotte", "designation": "Manager", "salary": 30000},
    {"id": 10015, "name": "William", "designation": "Developer", "salary": 15000},
    {"id": 10016, "name": "Amelia", "designation": "Developer", "salary": 15000},
    {"id": 10017, "name": "James", "designation": "Project Lead", "salary": 20000},
    {"id": 10018, "name": "Sophia", "designation": "Developer", "salary": 15000},
    {"id": 10019, "name": "Benjamin", "designation": "Developer", "salary": 15000},
    {"id": 10020, "name": "Mia", "designation": "Developer", "salary": 15000},
    {"id": 10021, "name": "Elijah Elijah Elijah Elijah Elijahlijah Elijah Elijah Elijahlijah Elijah Elijah Elijahlijah Elijah Elijah Elijah", "designation": "Developer", "salary": 15000},
    {"id": 10022, "name": "Harper", "designation": "Developer", "salary": 15000},
    {"id": 10023, "name": "Lucas", "designation": "Designer", "salary": 15000},
    {"id": 10024, "name": "Evelyn", "designation": "Developer", "salary": 15000},
    {"id": 10025, "name": "Alexander", "designation": "Developer", "salary": 15000},
    {"id": 10026, "name": "Abigail", "designation": "Manager", "salary": 30000},
    {"id": 10027, "name": "Henry", "designation": "Developer", "salary": 15000},
    {"id": 10028, "name": "Avery", "designation": "Developer", "salary": 15000},
    {"id": 10029, "name": "Daniel", "designation": "Developer", "salary": 15000},
    {"id": 10030, "name": "Sofia", "designation": "Developer", "salary": 15000},
    {"id": 10031, "name": "Jackson", "designation": "Developer", "salary": 15000},
    {"id": 10032, "name": "Scarlett", "designation": "Developer", "salary": 15000},
    {"id": 10033, "name": "Sebastian", "designation": "Developer", "salary": 15000},
    {"id": 10034, "name": "Chloe", "designation": "Developer", "salary": 15000},
    {"id": 10035, "name": "Jack", "designation": "Developer", "salary": 15000},
    {"id": 10036, "name": "Zoe", "designation": "Developer", "salary": 15000},
    {"id": 10037, "name": "Caleb", "designation": "Developer", "salary": 15000},
    {"id": 10038, "name": "Madison", "designation": "Developer", "salary": 15000},
    {"id": 10039, "name": "Levi", "designation": "Developer", "salary": 15000},
    {"id": 10040, "name": "Victoria", "designation": "Developer", "salary": 15000},
    {"id": 10041, "name": "Wyatt", "designation": "Developer", "salary": 15000},
    {"id": 10042, "name": "Riley", "designation": "Developer", "salary": 15000},
    {"id": 10043, "name": "Grayson", "designation": "Developer", "salary": 15000},
    {"id": 10044, "name": "Nora", "designation": "Developer", "salary": 15000},
    {"id": 10045, "name": "Liam", "designation": "Developer", "salary": 15000},
    {"id": 10046, "name": "Hannah", "designation": "Developer", "salary": 15000},
    {"id": 10047, "name": "Landon", "designation": "Developer", "salary": 15000},
    {"id": 10048, "name": "Lily", "designation": "Developer", "salary": 15000},
    {"id": 10049, "name": "Luke", "designation": "Developer", "salary": 15000},
    {"id": 10050, "name": "Aria", "designation": "Developer", "salary": 15000},
    {"id": 10051, "name": "Owen", "designation": "Developer", "salary": 15000},
    {"id": 10052, "name": "Ella", "designation": "Developer", "salary": 15000},
    {"id": 10053, "name": "Connor", "designation": "Developer", "salary": 15000},
    {"id": 10054, "name": "Aurora", "designation": "Developer", "salary": 15000},
    {"id": 10055, "name": "Carter", "designation": "Developer", "salary": 15000},
    {"id": 10056, "name": "Grace", "designation": "Developer", "salary": 15000},
    {"id": 10057, "name": "Jayden", "designation": "Developer", "salary": 15000},
    {"id": 10058, "name": "Penelope", "designation": "Developer", "salary": 15000},
    {"id": 10059, "name": "Gabriel", "designation": "Developer", "salary": 15000},
    {"id": 10060, "name": "Hazel", "designation": "Developer", "salary": 15000},
    {"id": 10061, "name": "Leah", "designation": "Developer", "salary": 15000},
    {"id": 10062, "name": "Julian", "designation": "Developer", "salary": 15000},
    {"id": 10063, "name": "Stella", "designation": "Developer", "salary": 15000},
    {"id": 10064, "name": "Isaac", "designation": "Developer", "salary": 15000},
    {"id": 10065, "name": "Violet", "designation": "Developer", "salary": 15000},
    {"id": 10066, "name": "Mateo", "designation": "Developer", "salary": 15000},
    {"id": 10067, "name": "Nova", "designation": "Developer", "salary": 15000},
    {"id": 10068, "name": "Mason", "designation": "Developer", "salary": 15000},
    {"id": 10069, "name": "Ellie", "designation": "Developer", "salary": 15000},
    {"id": 10070, "name": "Lincoln", "designation": "Developer", "salary": 15000},
    {"id": 10071, "name": "Willow", "designation": "Developer", "salary": 15000},
    {"id": 10072, "name": "Eli", "designation": "Developer", "salary": 15000},
    {"id": 10073, "name": "Piper", "designation": "Developer", "salary": 15000},
    {"id": 10074, "name": "Christopher", "designation": "Developer", "salary": 15000},
    {"id": 10075, "name": "Aria", "designation": "Developer", "salary": 15000},
    {"id": 10076, "name": "Juliet", "designation": "Developer", "salary": 15000},
    {"id": 10077, "name": "Josiah", "designation": "Developer", "salary": 15000},
    {"id": 10078, "name": "Natalie", "designation": "Developer", "salary": 15000},
    {"id": 10079, "name": "Dylan", "designation": "Developer", "salary": 15000},
    {"id": 10080, "name": "Aurora", "designation": "Developer", "salary": 15000},
    {"id": 10081, "name": "Miles", "designation": "Developer", "salary": 15000},
    {"id": 10082, "name": "Bella", "designation": "Developer", "salary": 15000},
    {"id": 10083, "name": "Jeremiah", "designation": "Developer", "salary": 15000},
    {"id": 10084, "name": "Luna", "designation": "Developer", "salary": 15000},
    {"id": 10085, "name": "Hudson", "designation": "Developer", "salary": 15000},
    {"id": 10086, "name": "Aaliyah", "designation": "Developer", "salary": 15000},
    {"id": 10087, "name": "Asher", "designation": "Developer", "salary": 15000},
    {"id": 10088, "name": "Emilia", "designation": "Developer", "salary": 15000},
    {"id": 10089, "name": "Micah", "designation": "Developer", "salary": 15000},
    {"id": 10090, "name": "Gianna", "designation": "Developer", "salary": 15000},
    {"id": 10091, "name": "Ryan", "designation": "Developer", "salary": 15000},
    {"id": 10092, "name": "Mila", "designation": "Developer", "salary": 15000},
    {"id": 10093, "name": "Nathan", "designation": "Developer", "salary": 15000},
    {"id": 10094, "name": "Eleanor", "designation": "Developer", "salary": 15000},
    {"id": 10095, "name": "Ezra", "designation": "Developer", "salary": 15000},
    {"id": 10096, "name": "Maya", "designation": "Developer", "salary": 15000},
    {"id": 10097, "name": "Theodore", "designation": "Developer", "salary": 15000},
    {"id": 10098, "name": "Everly", "designation": "Developer", "salary": 15000},
    {"id": 10099, "name": "Josiah", "designation": "Developer", "salary": 15000},
    {"id": 10100, "name": "Layla", "designation": "Developer", "salary": 15000},
    {"id": 10101, "name": "Harrison", "designation": "Developer", "salary": 15000},
    {"id": 10102, "name": "Isla", "designation": "Developer", "salary": 15000},
    {"id": 10103, "name": "Christian", "designation": "Developer", "salary": 15000},
    {"id": 10104, "name": "Lillian", "designation": "Developer", "salary": 15000},
    {"id": 10105, "name": "David", "designation": "Developer", "salary": 15000},
    {"id": 10106, "name": "Adeline", "designation": "Developer", "salary": 15000},
    {"id": 10107, "name": "Asher", "designation": "Developer", "salary": 15000},
    {"id": 10108, "name": "Camila", "designation": "Developer", "salary": 15000},
    {"id": 10109, "name": "Isaiah", "designation": "Developer", "salary": 15000},
    {"id": 10110, "name": "Sophie", "designation": "Developer", "salary": 15000}
  ];

  Future<void> exportDataGridToExcel() async {
    final Workbook workbook = _key.currentState!.exportToExcelWorkbook();

    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();

    await helper.saveAndLaunchFile(bytes, 'DataGrid.xlsx');
  }

  Future<void> exportDataGridToPdf() async {
    final PdfDocument document = _key.currentState!.exportToPdfDocument(fitAllColumnsInOnePage: true);

    final List<int> bytes = document.saveSync();
    await helper.saveAndLaunchFile(bytes, 'DataGrid.pdf');
    document.dispose();
  }

  Future<void> logSelectedItems() async {
    List selectedRows = dataGridController.selectedRows;
    var selected = selectedRows.map((row) {
      List keys = row.getCells().map((cell) => cell.columnName).toList();
      List values = row.getCells().map((cell) => cell.value).toList();
      return Map.fromIterables(keys, values);
    }).toList();
    print(selected);
  }

  @override
  void initState() {
    super.initState();
    employeeDataSource = EmployeeDataSource(columns, apiResult); //API Call (apiResult)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Syncfusion Flutter DataGrid'), actions: [
          MaterialButton(color: Colors.blue, onPressed: exportDataGridToExcel, child: const Text('Export to Excel', style: TextStyle(color: Colors.white))),
          const Padding(padding: EdgeInsets.all(20)),
          MaterialButton(color: Colors.blue, onPressed: exportDataGridToPdf, child: const Text('Export to PDF', style: TextStyle(color: Colors.white))),
          const Padding(padding: EdgeInsets.all(20)),
          MaterialButton(color: Colors.blue, onPressed: logSelectedItems, child: const Text('Log Selected', style: TextStyle(color: Colors.white)))
        ]),
        body: Column(children: <Widget>[
          Expanded(
              child: SfDataGridTheme(
            data: SfDataGridThemeData(headerColor: Colors.blueAccent.shade100.withOpacity(.25)),
            child: SfDataGrid(
                columnWidthMode: ColumnWidthMode.fill,
                showCheckboxColumn: true,
                allowSorting: true,
                allowFiltering: true,
                selectionMode: SelectionMode.multiple,
                controller: dataGridController,
                gridLinesVisibility: GridLinesVisibility.both,
                headerGridLinesVisibility: GridLinesVisibility.both,
                rowsPerPage: rowsPerPage,
                key: _key,
                showSortNumbers: true,
                // onCellTap: (data) => print(apiResult[data.rowColumnIndex.rowIndex - 1][data.column.columnName]),
                source: employeeDataSource,
                columns: List.generate(
                    columns.length,
                    (index) => GridColumn(
                          columnName: columns[index]["key"] ?? "",
                          autoFitPadding: const EdgeInsets.all(8.0),
                          label: Center(child: Text(columns[index]["value"] ?? "", style: const TextStyle(fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis)),
                        ))),
          )),
          SfDataPager(
              delegate: employeeDataSource,
              availableRowsPerPage: List.generate(6, (index) => (index + 1) * 10),
              pageCount: employeeDataSource.rows.length / rowsPerPage,
              onRowsPerPageChanged: (int? rowsPerPage) => setState(() => rowsPerPage = rowsPerPage!))
        ]));
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
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map((cell) {
      switch (cell.columnName) {
        case "id":
          return Center(child: Text(cell.value.toString()));
        case "name":
          return Center(child: Text(cell.value.toString()));
        case "action":
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Wrap(alignment: WrapAlignment.end, children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.edit), color: Colors.blueAccent),
                IconButton(onPressed: () {}, icon: const Icon(Icons.delete), color: Colors.redAccent),
                IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_rounded), color: Colors.purpleAccent)
              ]));
        default:
          return Center(child: Text(cell.value.toString()));
      }
    }).toList());
  }
}
