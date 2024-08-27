import 'package:flutter/material.dart';
import 'package:gym/member_login_page.dart';
import 'package:gym/gym_equipment_page.dart';
import 'package:gym/customer_announcements_page.dart';
import 'package:gym/payment_page.dart'; // Import the new payment page

class CustomerHomePage extends StatelessWidget {
  const CustomerHomePage({super.key, required List announcements});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Home Page'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.shade50, Colors.blue.shade200],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.purple],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.payment, color: Colors.blue),
                title: const Text('Payment'),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  PaymentPage(memberFullname: '', dateOfLastPayment: '', amountPerMonth: 0, selectedService: '', plan:0, totalAmount:0 )), // Navigate to PaymentPage
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.announcement, color: Colors.blue),
                title: const Text('Announcement'),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                  // Navigate to Announcement Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CustomerAnnouncementsPage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.fitness_center, color: Colors.blue),
                title: const Text('Gym Equipment'),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                  // Navigate to Gym Equipment Page with isAdmin flag set to false (customer view)
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GymEquipmentPage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text('Logout'),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const MemberLoginPage()),
                        (route) => false,
                  );
                  // Perform logout action and navigate back to MemberLoginPage
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.blue.shade200],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: const Center(
          child: Text(
            'Welcome to Customer Home Page',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}
