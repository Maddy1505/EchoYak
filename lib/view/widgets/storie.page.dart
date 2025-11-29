import 'package:flutter/material.dart';

/*void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const StoriesPage(),
    );
  }
}*/

class StoriesPage extends StatefulWidget {
  const StoriesPage({super.key});

  @override
  State<StoriesPage> createState() => _StoriesPageState();
}

class _StoriesPageState extends State<StoriesPage> {
  String subtitleText = "Tap to add stories"; // UI can change later

  void _addStory() {
    setState(() {
      subtitleText = "Story added!"; // Update UI on button tap
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(0),
        child: ListTile(
          leading: Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: Colors.indigo,
                child: const Text(
                  "M",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Positioned(
                bottom: -2,
                right: -2,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Colors.indigo,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.add,
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),

          title: const Text(
            "My stories",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
            ),
          ),

          subtitle: Text(
            subtitleText, // dynamically change
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[800],
              fontStyle: FontStyle.italic,
            ),
          ),

          trailing: IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),

          onTap: _addStory, // Clicking the tile updates subtitle
        ),
      ),
    );
  }
}
