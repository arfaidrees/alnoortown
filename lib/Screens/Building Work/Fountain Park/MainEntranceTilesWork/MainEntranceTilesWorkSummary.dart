import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MainEntranceTilesWorkSummary extends StatefulWidget {
  final List<Map<String, dynamic>> containerDataList;

    MainEntranceTilesWorkSummary({Key? key, required this.containerDataList})
      : super(key: key);

  @override
  State<MainEntranceTilesWorkSummary> createState() => _MainEntranceTilesWorkSummaryState();
}

class _MainEntranceTilesWorkSummaryState extends State<MainEntranceTilesWorkSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon:   Icon(Icons.arrow_back, color: Color(0xFFC69840)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title:   Text(
          'Main Entrance Tiles Work Summary',
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFFC69840)),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding:   EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columnSpacing: 16.0,
            headingRowColor: MaterialStateProperty.all(  Color(0xFFC69840)),
            border:   TableBorder(
              horizontalInside: BorderSide(color: Color(0xFFC69840), width: 1.0),
              verticalInside: BorderSide(color: Color(0xFFC69840), width: 1.0),
            ),
            columns:  [
              DataColumn(label: Text('start_date'.tr(), style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text('end_date'.tr(), style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text('status'.tr(), style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text('date'.tr(), style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text('time'.tr(), style: TextStyle(fontWeight: FontWeight.bold))),
            ],
            rows: widget.containerDataList.map((entry) {
              DateTime timestamp = DateTime.parse(entry['timestamp']);
              return DataRow(cells: [
                DataCell(Text(entry['startDate'] != null
                    ? DateFormat('d MMM yyyy').format(DateTime.parse(entry['startDate']))
                    : '')),
                DataCell(Text(entry['endDate'] != null
                    ? DateFormat('d MMM yyyy').format(DateTime.parse(entry['endDate']))
                    : '')),
                DataCell(Text(entry['status'] ?? '')),
                DataCell(Text(DateFormat('d MMM yyyy').format(timestamp))), // Date
                DataCell(Text(DateFormat('h:mm a').format(timestamp))), // Time
              ]);
            }).toList(),
          ),
        ),
      ),
    );
  }
}