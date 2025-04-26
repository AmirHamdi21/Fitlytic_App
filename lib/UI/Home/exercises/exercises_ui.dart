import 'package:fitlytic/UI/youtub_handing.dart';
import 'package:flutter/material.dart';
import 'package:fitlytic/constants/custom_colors.dart';
import 'dart:ui';

class ExerciseCategoryScreen extends StatefulWidget {
  final String categoryTitle;
  final List<Exercise> exercises;

  const ExerciseCategoryScreen({
    Key? key,
    required this.categoryTitle,
    required this.exercises,
  }) : super(key: key);

  @override
  State<ExerciseCategoryScreen> createState() => _ExerciseCategoryScreenState();
}

class _ExerciseCategoryScreenState extends State<ExerciseCategoryScreen> {
  late List<Exercise> filteredExercises;
  String searchQuery = '';
  String selectedCategory = '';
  String selectedEquipment = "All Equipment";

  // List of all possible categories
  final List<String> categories = [
    'All Muscle Groups',
    'Chest',
    'Back',
    'Shoulders',
    'Arms',
    'Legs',
    'Core',
    'Cardio',
    'Full Body'
  ];

  // List of all possible equipment types
  final List<String> equipmentTypes = [
    'All Equipment',
    'Barbell',
    'Body weight',
    'Dumbbell',
    'Kettlebell'
  ];

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.categoryTitle;
    filteredExercises = widget.exercises;
  }

  void searchExercises(String query) {
    setState(() {
      searchQuery = query;
      filterExercises();
    });
  }

  void filterExercises() {
    // Start with all exercises for the selected category
    List<Exercise> exercises = getExercisesForCategory(selectedCategory);

    // Filter by search query if one exists
    if (searchQuery.isNotEmpty) {
      exercises = exercises
          .where((exercise) =>
              exercise.title
                  .toLowerCase()
                  .contains(searchQuery.toLowerCase()) ||
              exercise.tags.any((tag) =>
                  tag.toLowerCase().contains(searchQuery.toLowerCase())))
          .toList();
    }

    // Filter by equipment if something other than "All Equipment" is selected
    if (selectedEquipment != "All Equipment") {
      exercises = exercises
          .where((exercise) => exercise.equipment.any(
              (item) => item.toLowerCase() == selectedEquipment.toLowerCase()))
          .toList();
    }

    setState(() {
      filteredExercises = exercises;
    });
  }

  void changeCategory(String? newCategory) {
    if (newCategory != null && newCategory != selectedCategory) {
      setState(() {
        selectedCategory = newCategory;
        filterExercises();
      });
    }
  }

  void changeEquipment(String? newEquipment) {
    if (newEquipment != null && newEquipment != selectedEquipment) {
      setState(() {
        selectedEquipment = newEquipment;
        filterExercises();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1D2A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1D2A),
        title: Text(
          "$selectedCategory Exercises",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              "${filteredExercises.length} exercises available for ${selectedCategory.toLowerCase()} muscle group",
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ),
          // Search bar
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              onChanged: searchExercises,
              decoration: InputDecoration(
                hintText: "Search exercises...",
                hintStyle: TextStyle(color: Colors.grey[400]),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: const Color(0xFF222533),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          // Filter options in a row
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF222533),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedCategory,
                        isExpanded: true,
                        dropdownColor: const Color(0xFF222533),
                        icon: const Icon(Icons.keyboard_arrow_down,
                            color: Colors.white),
                        items: categories.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList(),
                        onChanged: changeCategory,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF222533),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedEquipment,
                        isExpanded: true,
                        dropdownColor: const Color(0xFF222533),
                        icon: const Icon(Icons.keyboard_arrow_down,
                            color: Colors.white),
                        items: equipmentTypes.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList(),
                        onChanged: changeEquipment,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: filteredExercises.isEmpty
                ? const Center(
                    child: Text(
                      'No exercises found',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate:
                         SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.75,
                      mainAxisExtent: MediaQuery.of(context).size.height * 0.44
                    ),
                    itemCount: filteredExercises.length,
                    itemBuilder: (context, index) {
                      return ExerciseCard(
                        exercise: filteredExercises[index],
                        onViewInstructions: () => _showInstructionsDialog(
                            context, filteredExercises[index]),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  // void _showExerciseVideo(BuildContext context, Exercise exercise) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return BackdropFilter(
  //         filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
  //         child: Dialog(
  //             backgroundColor: const Color(0xFF222533),
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(12),
  //             ),
  //             child: Column(
  //               children: [
  //                 Center(
  //                   child: Text(
  //                     exercise.title,
  //                     style: const TextStyle(
  //                       fontSize: 18,
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             )),
  //       );
  //     },
  //   );
  // }

  void _showInstructionsDialog(BuildContext context, Exercise exercise) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Dialog(
            backgroundColor: const Color(0xFF222533),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: SingleChildScrollView(
              // Add this
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 250),
                            child: Text(
                              exercise.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 8,
                        top: 8,
                        child: IconButton(
                          icon: const Icon(Icons.close, color: Colors.white),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left column - Exercise image
                        Expanded(
                          flex: 3,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              exercise.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Right column - Instructions
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Instructions',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              _buildNumberedInstructions(exercise.instructions),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Target muscles
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Target Muscles',
                          style: TextStyle(
                            color: Colors.purple,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          children: exercise.targetMuscles.map((muscle) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.purple.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: Colors.purple),
                              ),
                              child: Text(
                                muscle,
                                style: const TextStyle(color: Colors.white),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Secondary muscles
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Secondary Muscles',
                          style: TextStyle(
                            color: Colors.cyan,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          children: exercise.secondaryMuscles.map((muscle) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.cyan.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: Colors.cyan),
                              ),
                              child: Text(
                                muscle,
                                style: const TextStyle(color: Colors.white),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Equipment
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Equipment',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          children: exercise.equipment.map((item) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: Colors.green),
                              ),
                              child: Text(
                                item,
                                style: const TextStyle(color: Colors.white),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNumberedInstructions(List<String> steps) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        steps.length,
        (index) => Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.purple,
                ),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  steps[index],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExerciseCard extends StatelessWidget {
  final Exercise exercise;
  final VoidCallback onViewInstructions;

  const ExerciseCard({
    Key? key,
    required this.exercise,
    required this.onViewInstructions,
  }) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF222533),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.asset(
              // exercise.imageUrl,
              "assets/exercises/knee_push_up.jpg",
              height: 130,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            // Add this to make content fill available space
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exercise.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Spacer(),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: exercise.tags.map((tag) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: tagColor(tag),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          tag,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  // Add this to push button to the bottom
                  ElevatedButton.icon(
                    onPressed: onViewInstructions,
                    icon: const Icon(Icons.remove_red_eye, size: 18),
                    label: const Text("View Instructions"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.cyan,
                      elevation: 0,
                      side: const BorderSide(color: Colors.cyan),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      minimumSize: const Size(double.infinity, 36),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>  YouTubePlayerScreen(
                            title: exercise.title,
                            videoUrl:
                                'https://youtu.be/_Wo4V3JTbW8?si=aU3gWcaNUEA3UlRG',
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.video_camera_front, size: 18),
                    label: const Text("View Video"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.pinkAccent,
                      elevation: 0,
                      side: const BorderSide(color: Colors.pinkAccent),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      minimumSize: const Size(double.infinity, 36),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color tagColor(String tag) {
    switch (tag.toLowerCase()) {
      case 'chest':
        return Colors.purple;
      case 'shoulders':
        return Colors.purple;
      case 'biceps':
      case 'triceps':
        return Colors.purple;
      case 'legs':
        return Colors.purple;
      case 'barbell':
        return Colors.blueGrey;
      case 'dumbbell':
        return Colors.blueGrey;
      case 'kettlebell':
        return Colors.blueGrey;
      case 'cable':
        return Colors.blueGrey;
      case 'resistance band':
        return Colors.blueGrey;
      default:
        return Colors.blueGrey;
    }
  }
}

// Updated Exercise data model
class Exercise {
  final String id;
  final String title;
  final String imageUrl;
  final List<String> tags;
  final List<String>
      instructions; // Changed to list of strings for numbered steps
  final List<String> targetMuscles;
  final List<String> secondaryMuscles;
  final List<String> equipment;

  Exercise({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.tags,
    required this.instructions,
    required this.targetMuscles,
    required this.secondaryMuscles,
    required this.equipment,
  });
}

// Sample exercises data (update with more detailed info)
List<Exercise> getExercisesForCategory(String category) {
  // If "All Muscle Groups" is selected, return exercises from all categories
  if (category == 'All Muscle Groups') {
    List<Exercise> allExercises = [];

    // Get exercises from each category and add them to the combined list
    for (String cat in ['Chest', 'Back', 'Shoulders', 'Arms', 'Legs', 'Core']) {
      if (cat != 'All Muscle Groups') {
        allExercises.addAll(_getSpecificCategoryExercises(cat));
      }
    }

    return allExercises;
  }

  // Otherwise return exercises for the specific category
  return _getSpecificCategoryExercises(category);
}

List<Exercise> _getSpecificCategoryExercises(String category) {
  switch (category.toLowerCase()) {
    case 'chest':
      return [
        Exercise(
          id: '1',
          title: 'Barbell Bench Press',
          imageUrl: 'assets/exercises/barbell_bench_press.jpg',
          tags: ['chest', 'barbell'],
          targetMuscles: ['chest'],
          secondaryMuscles: ['shoulders', 'triceps'],
          equipment: ['barbell'],
          instructions: [
            'Lie on a flat bench with your feet flat on the floor.',
            'Grip the barbell with hands slightly wider than shoulder-width apart.',
            'Unrack the barbell and lower it to your chest, keeping your elbows at a 45-degree angle.',
            'Press the barbell back up to the starting position, fully extending your arms.',
          ],
        ),
        Exercise(
          id: '2',
          title: 'Cable Biceps Exercise',
          imageUrl: 'assets/exercises/cable_biceps_exercise.jpg',
          tags: ['biceps', 'cable'],
          targetMuscles: ['biceps'],
          secondaryMuscles: ['forearms'],
          equipment: ['cable'],
          instructions: [
            'Stand facing the cable machine with feet shoulder-width apart.',
            'Grip the cable handle with palms facing up.',
            'Keeping your upper arms stationary, curl the handle towards your shoulders.',
            'Slowly lower back to the starting position with controlled movement.',
          ],
        ),
        Exercise(
          id: '3',
          title: 'Dumbbell Chest Exercise',
          imageUrl: 'assets/exercises/dumbbell_chest_exercise.jpg',
          tags: ['chest', 'dumbbell'],
          targetMuscles: ['chest'],
          secondaryMuscles: ['shoulders', 'triceps'],
          equipment: ['dumbbell'],
          instructions: [
            'Lie on a flat bench holding a dumbbell in each hand.',
            'Start with the dumbbells at chest level, palms facing forward.',
            'Press the dumbbells up until your arms are fully extended.',
            'Lower the dumbbells back to chest level in a controlled motion.',
          ],
        ),
        Exercise(
          id: '4',
          title: 'Resistance Band Shoulders Exercise',
          imageUrl: 'assets/exercises/resistance_band_shoulders.jpg',
          tags: ['shoulders', 'resistance band'],
          targetMuscles: ['shoulders'],
          secondaryMuscles: ['triceps'],
          equipment: ['resistance band'],
          instructions: [
            'Stand with feet shoulder-width apart on the resistance band.',
            'Hold the handles at shoulder height with palms facing forward.',
            'Press upward until your arms are fully extended overhead.',
            'Lower the handles back to shoulder height with controlled movement.',
          ],
        ),
        Exercise(
          id: '5',
          title: 'Kettlebell Shoulders Exercise',
          imageUrl: 'assets/exercises/kettlebell_shoulders.jpg',
          tags: ['shoulders', 'kettlebell'],
          targetMuscles: ['shoulders'],
          secondaryMuscles: ['triceps', 'traps'],
          equipment: ['kettlebell'],
          instructions: [
            'Stand with feet shoulder-width apart holding a kettlebell.',
            'Hold the kettlebell at shoulder height in a front rack position.',
            'Press the kettlebell overhead until your arm is fully extended.',
            'Lower the kettlebell back to shoulder height with control.',
          ],
        ),
        Exercise(
          id: '6',
          title: 'Barbell Legs Exercise',
          imageUrl: 'assets/exercises/barbell_legs.jpg',
          tags: ['legs', 'barbell'],
          targetMuscles: ['quadriceps'],
          secondaryMuscles: ['glutes', 'hamstrings'],
          equipment: ['barbell'],
          instructions: [
            'Place the barbell across your upper back, resting on your traps or rear delts.',
            'Stand with feet shoulder-width apart.',
            'Bend your knees and hips to lower your body until thighs are parallel to the floor.',
            'Push through your heels to return to the starting position.',
          ],
        ),
        Exercise(
          id: '7',
          title: 'Kettlebell Chest Exercise',
          imageUrl: 'assets/exercises/kettlebell_chest.jpg',
          tags: ['chest', 'kettlebell'],
          targetMuscles: ['chest'],
          secondaryMuscles: ['shoulders', 'triceps'],
          equipment: ['kettlebell'],
          instructions: [
            'Lie on a flat bench holding kettlebells at chest level.',
            'Press the kettlebells up until your arms are fully extended.',
            'Lower the kettlebells back to chest level with control.',
            'Keep your elbows at a 45-degree angle throughout the movement.',
          ],
        ),
      ];
    case 'back':
      return [
        Exercise(
          id: '8',
          title: 'Body Weight Back Exercise',
          imageUrl: 'assets/exercises/body_weight_back_exercise.jpg',
          tags: ['back', 'body weight'],
          targetMuscles: ['back'],
          secondaryMuscles: ['biceps'],
          equipment: ['body weight'],
          instructions: [
            'Set up a pull-up bar at an appropriate height.',
            'Grip the bar with hands wider than shoulder-width apart, palms facing away.',
            'Pull your body up until your chin is over the bar.',
            'Lower back down with control to the starting position.',
          ],
        ),
        // Add more back exercises...
      ];
    // Add cases for other categories...
    default:
      return [];
  }
}
