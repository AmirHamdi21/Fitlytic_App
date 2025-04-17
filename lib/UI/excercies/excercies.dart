import 'package:flutter/material.dart';

class CreateRoutinePage extends StatefulWidget {
  const CreateRoutinePage({super.key});

  @override
  State<CreateRoutinePage> createState() => _CreateRoutinePageState();
}

class _CreateRoutinePageState extends State<CreateRoutinePage> {
  bool _isAddingExercise = false;
  String _selectedTab = "All Equipment";
  String _selectedFilter = "Equipment";
  
  // New state variables to track selections
  String _selectedEquipment = "All Equipment";
  String _selectedMuscle = "All Muscles";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141B2D),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF141B2D),
        elevation: 0,
        title: Text(
          _isAddingExercise ? "Add Exercise" : "Create Routine",
          style: const TextStyle(color: Color(0xFFE0E0E0)),
        ),
        leading: TextButton(
          onPressed: () {
            if (_isAddingExercise) {
              setState(() {
                _isAddingExercise = false;
              });
            } else {
              // Handle cancel routine creation
            }
          },
          child: const Text(
            "Cancel",
            style: TextStyle(color: Colors.blue),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Handle save/create action
            },
            child: Text(
              _isAddingExercise ? "Create" : "Save",
              style: const TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
      body: _isAddingExercise ? _buildAddExercisePage() : _buildCreateRoutinePage(),
    );
  }

  Widget _buildCreateRoutinePage() {
    return Column(
      children: [
        const SizedBox(height: 30),
        const Text(
          "Routine title",
          style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 24),
        ),
        const SizedBox(height: 100),
        const Icon(
          Icons.fitness_center_outlined,
          size: 60,
          color: Color(0xFF9E9E9E),
        ),
        const SizedBox(height: 20),
        const Text(
          "Get started by adding an exercise to your routine.",
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 16),
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _isAddingExercise = true;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            minimumSize: Size(MediaQuery.of(context).size.width - 40, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, color: Colors.white),
              SizedBox(width: 8),
              Text("Add exercise", style: TextStyle(fontSize: 16, color: Colors.white)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAddExercisePage() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
            style: const TextStyle(color: Color(0xFFE0E0E0)),
            decoration: InputDecoration(
              hintText: "Search exercise",
              hintStyle: const TextStyle(color: Color(0xFF9E9E9E)),
              prefixIcon: const Icon(Icons.search, color: Color(0xFF9E9E9E)),
              filled: true,
              fillColor: const Color(0xFF1F2940),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Color(0xFF2A3349))),
          ),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedFilter = "Equipment";
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: _selectedFilter == "Equipment" ? Colors.blue : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                    child: const Text(
                      "All Equipment",
                      style: TextStyle(color: Color(0xFFE0E0E0)),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedFilter = "Muscles";
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: _selectedFilter == "Muscles" ? Colors.blue : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                    child: const Text(
                      "All Muscles",
                      style: TextStyle(color: Color(0xFFE0E0E0)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        _selectedFilter == "Equipment" ? _buildEquipmentList() : _buildMusclesList(),
      ],
    );
  }

  Widget _buildEquipmentList() {
    List<Map<String, dynamic>> equipments = [
      {"name": "All Equipment", "icon": Icons.grid_4x4},
      {"name": "None", "icon": Icons.person_outline},
      {"name": "Barbell", "icon": Icons.fitness_center},
      {"name": "Dumbbell", "icon": Icons.fitness_center},
      {"name": "Kettlebell", "icon": Icons.fitness_center},
      {"name": "Machine", "icon": Icons.fitness_center},
      {"name": "Plate", "icon": Icons.circle_outlined},
      {"name": "Resistance Band", "icon": Icons.hourglass_empty},
      {"name": "Suspension Band", "icon": Icons.all_inclusive},
      {"name": "Other", "icon": Icons.more_horiz},
    ];

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Text(
              "Equipment",
              style: TextStyle(
                fontSize: 16, 
                fontWeight: FontWeight.bold,
                color: Color(0xFFE0E0E0),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: equipments.length,
              itemBuilder: (context, index) {
                final equipment = equipments[index];
                final isSelected = equipment["name"] == _selectedEquipment;
                
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      equipment["icon"],
                      color: const Color(0xFF141B2D),
                    ),
                  ),
                  title: Text(
                    equipment["name"],
                    style: const TextStyle(color: Color(0xFFE0E0E0)),
                  ),
                  trailing: isSelected
                      ? const Icon(Icons.check, color: Colors.blue)
                      : null,
                  onTap: () {
                    setState(() {
                      _selectedEquipment = equipment["name"];
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMusclesList() {
    List<Map<String, dynamic>> muscles = [
      {"name": "All Muscles", "icon": Icons.grid_4x4},
      {"name": "Abdominals", "icon": Icons.person_outline, "highlighted": true},
      {"name": "Abductors", "icon": Icons.person_outline},
      {"name": "Adductors", "icon": Icons.person_outline, "highlighted": false},
      {"name": "Biceps", "icon": Icons.person_outline, "highlighted": true},
      {"name": "Calves", "icon": Icons.person_outline, "highlighted": true},
      {"name": "Cardio", "icon": Icons.person_outline},
      {"name": "Chest", "icon": Icons.person_outline, "highlighted": true},
      {"name": "Forearms", "icon": Icons.person_outline, "highlighted": true},
      {"name": "Full Body", "icon": Icons.person_outline},
      {"name": "Glutes", "icon": Icons.person_outline, "highlighted": true},
      {"name": "Hamstrings", "icon": Icons.person_outline, "highlighted": true},
      {"name": "Lats", "icon": Icons.person_outline, "highlighted": true},
      {"name": "Lower Back", "icon": Icons.person_outline, "highlighted": true},
      {"name": "Neck", "icon": Icons.person_outline, "highlighted": true},
      {"name": "Quadriceps", "icon": Icons.person_outline, "highlighted": true},
      {"name": "Shoulders", "icon": Icons.person_outline, "highlighted": true},
      {"name": "Traps", "icon": Icons.person_outline, "highlighted": true},
      {"name": "Triceps", "icon": Icons.person_outline, "highlighted": true},
      {"name": "Upper Back", "icon": Icons.person_outline, "highlighted": true},
      {"name": "Other", "icon": Icons.more_horiz},
    ];

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Text(
              "Muscle Group",
              style: TextStyle(
                fontSize: 16, 
                fontWeight: FontWeight.bold,
                color: Color(0xFFE0E0E0),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: muscles.length,
              itemBuilder: (context, index) {
                final muscle = muscles[index];
                final isSelected = muscle["name"] == _selectedMuscle;
                
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: muscle["highlighted"] != null
                        ? Image.asset(
                            // "assets/muscle_icons/${muscle["name"].toLowerCase()}.png",
                            'assets/achievement/strength_2.jpg',
                            color: Colors.red.withOpacity(0.7),
                          )
                        : Icon(
                            muscle["icon"],
                            color: const Color(0xFF141B2D),
                          ),
                  ),
                  title: Text(
                    muscle["name"],
                    style: const TextStyle(color: Color(0xFFE0E0E0)),
                  ),
                  trailing: isSelected
                      ? const Icon(Icons.check, color: Colors.blue)
                      : null,
                  onTap: () {
                    setState(() {
                      _selectedMuscle = muscle["name"];
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentExercisesList() {
    List<Map<String, dynamic>> exercises = [
      {"name": "Single Arm Curl (Cable)", "muscle": "Biceps"},
      {"name": "Triceps Extension (Cable)", "muscle": "Triceps"},
      {"name": "Single Arm Lateral Raise (Cable)", "muscle": "Shoulders"},
      {"name": "Shoulder Press (Dumbbell)", "muscle": "Shoulders"},
      {"name": "Cross Body Hammer Curl", "muscle": "Biceps"},
      {"name": "Single Arm Tricep Extension (Dumbbell)", "muscle": "Triceps"},
      {"name": "Shrug (Dumbbell)", "muscle": "Traps"},
      {"name": "Incline Bench Press (Smith Machine)", "muscle": "Chest"},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "Recent Exercises",
            style: TextStyle(
              fontSize: 16, 
              fontWeight: FontWeight.bold,
              color: Color(0xFFE0E0E0),
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: exercises.length,
            separatorBuilder: (context, index) => const Divider(height: 1, color: Color(0xFF2A3349)),
            itemBuilder: (context, index) {
              return ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person_outline, color: Color(0xFF141B2D)),
                ),
                title: Text(
                  exercises[index]["name"],
                  style: const TextStyle(color: Color(0xFFE0E0E0)),
                ),
                subtitle: Text(
                  exercises[index]["muscle"],
                  style: const TextStyle(color: Color(0xFF9E9E9E)),
                ),
                trailing: const Icon(Icons.show_chart, color: Colors.blue),
                onTap: () {
                  // Handle exercise selection
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

// Model class for Exercise
class Exercise {
  final String name;
  final String muscleGroup;
  final String equipment;
  final String? imageAsset;

  Exercise({
    required this.name,
    required this.muscleGroup,
    required this.equipment,
    this.imageAsset,
  });
}