import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  final List<Map<String, dynamic>> memberDetails;

  const ReportPage({Key? key, required this.memberDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reports'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Reports',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              DataTable(
                columnSpacing: 16.0,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                columns: [
                  DataColumn(label: Text('Sl. No.')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Service')),
                  DataColumn(label: Text('Actions')),
                ],
                rows: memberDetails.asMap().entries.map((entry) {
                  int index = entry.key + 1;
                  Map<String, dynamic> member = entry.value;
                  return DataRow(cells: [
                    DataCell(Text('$index')),
                    DataCell(Text(member['name'] ?? '')),
                    DataCell(Text(member['service'] ?? '')),
                    DataCell(
                      ElevatedButton(
                        onPressed: () {
                          // Handle view report button press
                          print('View report for ${member['name']}');
                        },
                        child: Text('View Report'),
                      ),
                    ),
                  ]);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
