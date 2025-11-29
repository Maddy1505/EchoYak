import 'package:flutter/material.dart';
import 'package:test_app/view/calls.form.dart';
import 'package:test_app/view/login.form.dart';
import 'package:test_app/view/meeting.form.dart';
import 'package:test_app/view/stories.form.dart';

class BottomNavigation extends StatefulWidget {
  final int initialIndex;
  const BottomNavigation({super.key, this.initialIndex = 0});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex; // 👈 SET FROM CONSTRUCTOR
  }
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(
            index: 0,
            icon: Icons.chat_bubble_outline,
            label: "Chats",
            onTap: () {
              setState(() => selectedIndex = 0);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LoginForm()),
              );
            },
          ),
          _navItem(
            index: 1,
            icon: Icons.movie_filter_outlined,
            label: "Stories",
            onTap: () {
              setState(() => selectedIndex = 1);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const StoriesScreen()),
              );
            },
          ),
          _navItem(
            index: 2,
            icon: Icons.calendar_month,
            label: "Meetings",
            onTap: () {
              setState(() => selectedIndex = 2);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MeetingsScreen()),
              );
            },
          ),
          _navItem(
            index: 3,
            icon: Icons.call_outlined,
            label: "Calls",
            onTap: () {
              setState(() => selectedIndex = 3);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CallsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _navItem({
    required int index,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    final bool isSelected = index == selectedIndex;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 75,
            padding: const EdgeInsets.all(6),
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: isSelected ? Colors.deepPurple : Colors.transparent,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(color: Colors.deepPurple.withOpacity(0.1), blurRadius: 10),
              ],

            ),
            child: Icon(
              icon,
              size: 28,
              color: isSelected ? Colors.white : Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
