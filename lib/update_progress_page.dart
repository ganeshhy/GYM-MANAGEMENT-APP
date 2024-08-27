import 'package:flutter/material.dart';

class UpdateProgressPage extends StatefulWidget {
  final Map<String, dynamic> memberDetails;

  UpdateProgressPage({required this.memberDetails});

  @override
  _UpdateProgressPageState createState() => _UpdateProgressPageState();
}

class _UpdateProgressPageState extends State<UpdateProgressPage> {
  late TextEditingController _currentWeightController;
  late TextEditingController _currentBodyTypeController;
  late TextEditingController _progressNotesController;

  @override
  void initState() {
    super.initState();
    _currentWeightController = TextEditingController(
        text: widget.memberDetails['current_weight']?.toString() ?? '');
    _currentBodyTypeController = TextEditingController(
        text: widget.memberDetails['current_body_type'] ?? '');
    _progressNotesController = TextEditingController();
  }

  @override
  void dispose() {
    _currentWeightController.dispose();
    _currentBodyTypeController.dispose();
    _progressNotesController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    // Implement save changes functionality here
    print('Current Weight: ${_currentWeightController.text}');
    print('Current Body Type: ${_currentBodyTypeController.text}');
    print('Progress Notes: ${_progressNotesController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Customer\'s Progress'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Update Customer\'s Progress',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Table(
              columnWidths: {
                0: IntrinsicColumnWidth(),
                1: FlexColumnWidth(),
              },
              border: TableBorder.all(color: Colors.grey),
              children: [
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Member\'s Fullname:',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.memberDetails['name'] ?? '',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'HealthStatus',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.memberDetails['health_status'] ?? '',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                // TableRow(
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Text(
                //         'Initial Weight (KG):',
                //         style: TextStyle(fontSize: 16),
                //       ),
                //     ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Text(
                    //     widget.memberDetails['initial_weight']
                    //         ?.toString() ??
                    //         '',
                    //     style: TextStyle(fontSize: 16),
                    //   ),
                    // ),
                //   ],
                // ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Intial weight:', // Label for the text area
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _progressNotesController,
                        maxLines: null, // Allow multiple lines of text
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Intial wight',
                        ),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Current Weight (KG):',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _currentWeightController,
                        decoration:
                        InputDecoration(border: OutlineInputBorder()),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                // TableRow(
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Text(
                //         'Initial Body Type:',
                //         style: TextStyle(fontSize: 16),
                //       ),
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Text(
                //         widget.memberDetails['initial_body_type'] ?? '',
                //         style: TextStyle(fontSize: 16),
                //       ),
                //     ),
                //   ],
                // ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Current Body Type:',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _currentBodyTypeController,
                        decoration:
                        InputDecoration(border: OutlineInputBorder()),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: _saveChanges,
                child: Text('Save Changes'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
