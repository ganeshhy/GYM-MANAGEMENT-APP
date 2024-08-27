import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  final String memberFullname;
  final String dateOfLastPayment;
  final int amountPerMonth;
  final String selectedService;
  final int plan;
  final int totalAmount;

  const PaymentPage({
    Key? key,
    required this.memberFullname,
    required this.dateOfLastPayment,
    required this.amountPerMonth,
    required this.selectedService,
    required this.plan,
    required this.totalAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment Details',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 4,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey[50]!, Colors.blueGrey[200]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow('Member\'s Full Name', memberFullname),
                  _buildDetailRow('Date of Last Payment', dateOfLastPayment),
                  _buildDetailRow('Amount per Month', '\$$amountPerMonth'),
                  _buildDetailRow('Selected Service', selectedService),
                  _buildDetailRow('Plan', '$plan months'),
                  _buildDetailRow('Total Amount', '\$$totalAmount'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[800],
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: Colors.blueGrey[700],
            ),
          ),
        ],
      ),
    );
  }
}
