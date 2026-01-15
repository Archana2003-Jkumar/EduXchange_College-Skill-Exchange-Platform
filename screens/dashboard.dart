import 'package:flutter/material.dart';
import 'skills_slots_page.dart';
import 'matches_page.dart';
import 'more_page.dart';

class Dashboard extends StatefulWidget {
  final Map user;
  const Dashboard({super.key, required this.user});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentIndex = 0;

  late List<String> teachSkills;
  late List<String> learnSkills;
  late List<String> freeSlots;

  final teachController = TextEditingController();
  final learnController = TextEditingController();

  String selectedDay = "Monday";
  String selectedTime = "6 PM - 7 PM";

  final days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"];
  final times = ["6 PM - 7 PM", "2 PM - 4 PM", "4 PM - 5 PM"];

  @override
  void initState() {
    super.initState();
    teachSkills = List<String>.from(widget.user["skills_teach"] ?? []);
    learnSkills = List<String>.from(widget.user["skills_learn"] ?? []);
    freeSlots = List<String>.from(widget.user["free_slots"] ?? []);
  }

  /// Returns the fixed free slot for each day
  String getSlotForDay(String day) {
    switch (day) {
      case "Monday":
        return "6 PM – 7 PM";
      case "Tuesday":
        return "2 PM – 4 PM";
      case "Wednesday":
        return "4 PM – 5 PM";
      case "Thursday":
      case "Friday":
        return "No free slot";
      default:
        return "No free slot";
    }
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      /// ---------------- DASHBOARD HOME ----------------
      Scaffold(
        appBar: AppBar(title: const Text("My Dashboard")),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 👤 USER INFO (Updated Name & Email)
              const Text(
                "Jaithashree",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const Text(
                "jaitha@gmail.com",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 10),

              /// 💰 CREDITS INFO
              const Text(
                "Credits: 5",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              /// 📅 WEEKLY FREE SLOT
              const Text(
                "Weekly Free Time",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              /// 📆 DAY CHOICES
              Wrap(
                spacing: 8,
                children: days.map((day) {
                  return ChoiceChip(
                    label: Text(day),
                    selected: selectedDay == day,
                    onSelected: (_) {
                      setState(() {
                        selectedDay = day;
                      });
                    },
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),

              /// ⏰ SINGLE SLOT CARD
              Card(
                elevation: 3,
                child: ListTile(
                  leading: const Icon(Icons.schedule),
                  title: Text(selectedDay),
                  subtitle: Text(
                    getSlotForDay(selectedDay),
                    style: TextStyle(
                      color: getSlotForDay(selectedDay) == "No free slot"
                          ? Colors.red
                          : Colors.green,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      /// ---------------- SKILLS & SLOTS ----------------
      SkillsSlotsPage(
        teachSkills: teachSkills,
        learnSkills: learnSkills,
        freeSlots: freeSlots,
        teachController: teachController,
        learnController: learnController,
        selectedDay: selectedDay,
        selectedTime: selectedTime,
        days: days,
        times: times,
        onAddTeach: () {
          if (teachController.text.isNotEmpty) {
            setState(() {
              teachSkills.add(teachController.text);
              teachController.clear();
            });
          }
        },
        onEditTeach: (index) {
          teachController.text = teachSkills[index];
          setState(() {
            teachSkills.removeAt(index);
          });
        },
        onDeleteTeach: (index) {
          setState(() {
            teachSkills.removeAt(index);
          });
        },
        onAddLearn: () {
          if (learnController.text.isNotEmpty) {
            setState(() {
              learnSkills.add(learnController.text);
              learnController.clear();
            });
          }
        },
        onEditLearn: (index) {
          learnController.text = learnSkills[index];
          setState(() {
            learnSkills.removeAt(index);
          });
        },
        onDeleteLearn: (index) {
          setState(() {
            learnSkills.removeAt(index);
          });
        },
        onAddSlot: () {
          setState(() {
            freeSlots.add("$selectedDay $selectedTime");
          });
        },
        onFindMatches: () {
          setState(() {
            currentIndex = 2; // Navigate to Matches page
          });
        },
      ),

      /// ---------------- MATCHES PAGE ----------------
      const MatchesPage(),

      /// ---------------- MORE PAGE ----------------
      const MorePage(),
    ];

    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        onTap: (i) => setState(() => currentIndex = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: "Skills"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Matches"),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "More"),
        ],
      ),
    );
  }
}
