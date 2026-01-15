import 'package:flutter/material.dart';

class SkillsSlotsPage extends StatefulWidget {
  final List<String> teachSkills;
  final List<String> learnSkills;
  final List<String> freeSlots;

  final TextEditingController teachController;
  final TextEditingController learnController;

  final String selectedDay;
  final String selectedTime;
  final List<String> days;
  final List<String> times;

  final VoidCallback onAddTeach;
  final VoidCallback onAddLearn;
  final VoidCallback onAddSlot;

  final Function(int) onEditTeach;
  final Function(int) onDeleteTeach;
  final Function(int) onEditLearn;
  final Function(int) onDeleteLearn;
  final VoidCallback onFindMatches;

  const SkillsSlotsPage({
    super.key,
    required this.teachSkills,
    required this.learnSkills,
    required this.freeSlots,
    required this.teachController,
    required this.learnController,
    required this.selectedDay,
    required this.selectedTime,
    required this.days,
    required this.times,
    required this.onAddTeach,
    required this.onAddLearn,
    required this.onAddSlot,
    required this.onEditTeach,
    required this.onDeleteTeach,
    required this.onEditLearn,
    required this.onDeleteLearn,
    required this.onFindMatches,
  });

  @override
  State<SkillsSlotsPage> createState() => _SkillsSlotsPageState();
}

class _SkillsSlotsPageState extends State<SkillsSlotsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Skills & Availability")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// TEACH SKILLS
            const Text("Skills I Can Teach",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Column(
              children: widget.teachSkills.asMap().entries.map((entry) {
                final index = entry.key;
                final skill = entry.value;
                return Card(
                  child: ListTile(
                    title: Text(skill),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => widget.onEditTeach(index),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => widget.onDeleteTeach(index),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: widget.teachController,
                    decoration:
                        const InputDecoration(hintText: "Add teaching skill"),
                  ),
                ),
                IconButton(
                    icon: const Icon(Icons.add), onPressed: widget.onAddTeach)
              ],
            ),

            const SizedBox(height: 24),

            /// LEARN SKILLS
            const Text("Skills I Want to Learn",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Column(
              children: widget.learnSkills.asMap().entries.map((entry) {
                final index = entry.key;
                final skill = entry.value;
                return Card(
                  child: ListTile(
                    title: Text(skill),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => widget.onEditLearn(index),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => widget.onDeleteLearn(index),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: widget.learnController,
                    decoration:
                        const InputDecoration(hintText: "Add learning skill"),
                  ),
                ),
                IconButton(
                    icon: const Icon(Icons.add), onPressed: widget.onAddLearn)
              ],
            ),

            const SizedBox(height: 24),

            /// FREE SLOTS
            const Text("My Free Slots",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children:
                  widget.freeSlots.map((s) => Chip(label: Text(s))).toList(),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: widget.selectedDay,
                    isExpanded: true,
                    items: widget.days
                        .map((d) => DropdownMenuItem(value: d, child: Text(d)))
                        .toList(),
                    onChanged: (_) {},
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: DropdownButton<String>(
                    value: widget.selectedTime,
                    isExpanded: true,
                    items: widget.times
                        .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                        .toList(),
                    onChanged: (_) {},
                  ),
                ),
                IconButton(
                    icon: const Icon(Icons.add_circle),
                    onPressed: widget.onAddSlot)
              ],
            ),

            const SizedBox(height: 30),

            /// FIND MATCHES
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.search),
                label: const Text("Find My Matches"),
                onPressed: widget.onFindMatches,
              ),
            )
          ],
        ),
      ),
    );
  }
}
