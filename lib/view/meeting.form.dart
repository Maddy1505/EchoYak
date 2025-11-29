import 'package:flutter/material.dart';
import 'package:test_app/view/widgets/bottombar.form.dart';

class MeetingsScreen extends StatefulWidget {
  final int initialIndex;
  const MeetingsScreen({super.key, this.initialIndex = 2});

  @override
  State<MeetingsScreen> createState() => _MeetingsScreenState();
}

class _MeetingsScreenState extends State<MeetingsScreen> {
  bool isDarkMode = false;
  late int selectedIndex;


  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex; // 👈 SET FROM CONSTRUCTOR
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meeting"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert),
          ),
        ],
      ),

      /* Drawer Widget */

      drawer: Drawer(
        //backgroundColor: Colors.white, // Drawer background color
        elevation: 16.0,
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                //color: Colors.white, // Header background color
              ),
              accountName: Text(
                "Meganathan Raj",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              accountEmail: Text(
                "Hello! I'm using Arattai 😄",
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.purple,
                child: Icon(Icons.person, color: Colors.white, size: 40),
              ),
            ),
            ListTile(
              title: Text('Mentions'),
              leading: Icon(Icons.alternate_email),
            ),
            ListTile(
              title: Text('Starred Messages'),
              leading: Icon(Icons.star_border),
            ),
            ListTile(
              title: Text('Pocket'),
              leading: Icon(Icons.bookmark_border),
            ),
            ListTile(title: Text('Contacts'), leading: Icon(Icons.person)),
            ListTile(
              title: Text('Link a device'),
              leading: Icon(Icons.scanner),
            ),
            ListTile(title: Text('Settings'), leading: Icon(Icons.settings)),
            SizedBox(height: 250.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  const Icon(Icons.nightlight_round, size: 28),
                  const SizedBox(width: 12),
                  const Text(
                    "Night mode",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const Spacer(),
                  Switch(
                    value: isDarkMode,
                    onChanged: (value) {
                      setState(() {
                        isDarkMode = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      /* Bottom Navigation Bar */

      bottomNavigationBar: const BottomNavigation(initialIndex: 2),

    );
  }
}
