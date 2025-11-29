import 'package:flutter/material.dart';
import 'package:test_app/view/calls.form.dart';
import 'package:test_app/view/meeting.form.dart';
import 'package:test_app/view/stories.form.dart';
import 'package:test_app/view/widgets/bottombar.form.dart';


class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isDarkMode = false;
  int selectedIndex = 0;
  int selectedIndex_1 = 0;

  final List<String> tabs = ["All", "Direct", "Groups", "Channels"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chats"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
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

      /* Body Widgets */

      body: Column(
        children: [
          const SizedBox(height: 10),

          /// Tab Selection Row
          SizedBox(
            height: 35,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tabs.length,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemBuilder: (context, index) {
                bool isSelected = selectedIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Colors.blue.withOpacity(0.15)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: isSelected ? Colors.blue : Colors.grey.shade400,
                        width: 1.3,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        tabs[index],
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: isSelected ? Colors.blue : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 10),

          /// Content UI based on selected tab
          Expanded(
            child: IndexedStack(
              index: selectedIndex,
              children: [
                inviteFriendWidget(), // For "All"
                const Center(child: Text("Direct Messages Coming Soon")),
                const Center(child: Text("Groups List Coming Soon")),
                const Center(child: Text("Channels Coming Soon")),
              ],
            ),
          ),
        ],
      ),

      /* Floation Action Botton */

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        onPressed: () {},
        elevation: 15.0,
        child: Icon(Icons.add),
      ),

      ///👇 Bottom Navigation Bar Added Here
      bottomNavigationBar: const BottomNavigation(),
    );
  }

  /* Favorite Invite Friends List */

  Widget inviteFriendWidget() {
    return ListView(
      padding: const EdgeInsets.all(15),
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.pink,
            child: const Icon(Icons.favorite, color: Colors.white),
          ),
          title: const Text(
            "Invite friends",
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900),
          ),
          subtitle: const Text(
            "Connect with your friends on Arattai",
            style: TextStyle(fontSize: 15),
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }
}









/* import 'package:flutter/material.dart';

class HorizontalTextListView extends StatefulWidget {
  @override
  _HorizontalTextListViewState createState() => _HorizontalTextListViewState();
}

class _HorizontalTextListViewState extends State<HorizontalTextListView> {
  // List of text items (using your specified names)
  List<String> items = ['all', 'direct', 'group', 'channels'];

  // Method to add a new item (e.g., for testing state updates)
  void _addItem() {
    setState(() {
      items.add('New Item ${items.length + 1}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Horizontal Text ListView')),
      body: Column(
        children: [
          // Button to add items (demonstrates statefulness)
          ElevatedButton(onPressed: _addItem, child: Text('Add Item')),
          // Horizontal ListView
          Container(
            height: 100, // Fixed height for horizontal scroll
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 150, // Width of each item
                  margin: EdgeInsets.all(8.0),
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Text(
                      items[index],
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
*/


