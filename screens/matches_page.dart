import 'package:flutter/material.dart';

class MatchesPage extends StatelessWidget {
  const MatchesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sampleMatches = [
      {
        "name": "Alice Johnson",
        "skills": "AI, Web",
        "time": "Monday 6 PM - 7 PM"
      },
      {
        "name": "Bob Smith",
        "skills": "Flutter, Python",
        "time": "Wednesday 4 PM - 5 PM"
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Matches")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Matched Users",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ...sampleMatches.map(
              (u) => Card(
                child: ListTile(
                  leading: const Icon(Icons.person, color: Colors.green),
                  title: Text(u["name"]!),
                  subtitle: Text(
                    "Teaches: ${u["skills"]}\nTime: ${u["time"]}",
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              color: Colors.red[50],
              child: const ListTile(
                leading: Icon(Icons.info, color: Colors.red),
                title: Text("No more matches"),
                subtitle: Text(
                  "No users match your remaining skills and free slots.",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
