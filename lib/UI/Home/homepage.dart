import 'package:fitlytic/UI/Home/exercises/exercises_home.dart';
import 'package:fitlytic/UI/Notifications/notifications.dart';
import 'package:fitlytic/UI/excercies/exercise_home.dart';
import 'package:fitlytic/constants/custom_colors.dart';
import 'package:fitlytic/constants/exercises/exercises_home_constant.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1D2A),
      appBar: AppBar(
        toolbarHeight: 30.0,
        backgroundColor: const Color(0xFF1A1D2A),
        shadowColor: Colors.transparent, // Fix flickering issue
        title: ShaderMask(
          shaderCallback: (bounds) =>
              MyColors.customGradient.createShader(bounds),
          child: const Text(
            "Fitlytic",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.white),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NotificationsScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Good Afternoon, Alex!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Ready to crush your goals?',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 24),

              // Daily metrics row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildMetricCard(
                    key: const ValueKey('steps'),
                    icon: Icons.directions_walk,
                    value: '8432/10000',
                    label: 'Steps',
                    color: Colors.blue,
                    progress: 0.84,
                  ),
                  _buildMetricCard(
                    key: const ValueKey('calories'),
                    icon: Icons.local_fire_department,
                    value: '420 kcal',
                    label: 'Calories',
                    color: Colors.redAccent,
                    progress: 0.6,
                  ),
                  _buildMetricCard(
                    key: const ValueKey('active_minutes'),
                    icon: Icons.timer,
                    value: '45 min',
                    label: 'Active Minutes',
                    color: Colors.greenAccent,
                    progress: 0.75,
                  ),
                ],
              ),

              const SizedBox(height: 32),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        // Toggle to the other page when back button is pressed
                        _currentPage = 0;
                        // Also update the page controller to match
                        _pageController.animateToPage(
                          _currentPage,
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeInOut,
                        );
                      });
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  const Text(
                    'Recommended Workouts',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        // Toggle to the other page when forward button is pressed
                        _currentPage = 1;
                        // Also update the page controller to match
                        _pageController.animateToPage(
                          _currentPage,
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeInOut,
                        );
                      });
                    },
                    icon: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
              const SizedBox(height: 16),

// Workout cards
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.46,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  children: [
                    // Display plans page
                    _categories_sections(),

                    // Features comparison page
                    _difficalties_secion(),
                  ],
                ),
              ),

              //old design
              // _buildWorkoutCard(
              //   key: const ValueKey('workout_3'),
              //   title: 'Yoga Flow',
              //   trainer: 'Emma Wilson',
              //   duration: '20 min',
              //   difficulty: 'easy',
              //   image: 'assets/achievement/strength_2.jpg',
              //   onTap: () => Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => ExerciseListScreen(
              //         difficulty: 'Easy',
              //         exercises: easyExercises,
              //       ),
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 16),
              // _buildWorkoutCard(
              //   key: const ValueKey('workout_1'),
              //   title: 'HIIT Cardio Blast',
              //   trainer: 'Sarah Johnson',
              //   duration: '30 min',
              //   difficulty: 'medium',
              //   image: 'assets/achievement/strength_2.jpg',
              //   onTap: () => Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => ExerciseListScreen(
              //         difficulty: 'Medium',
              //         exercises: mediumExercises,
              //       ),
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 16),
              // _buildWorkoutCard(
              //   key: const ValueKey('workout_2'),
              //   title: 'Strength Foundation',
              //   trainer: 'Mike Chen',
              //   duration: '45 min',
              //   difficulty: 'Hard',
              //   image: 'assets/achievement/strength_2.jpg',
              //   onTap: () => Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => ExerciseListScreen(
              //         difficulty: 'Advanced',
              //         exercises: advancedExercises,
              //       ),
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 16),

              //oldest desgin
              // buildDifficultyCard(
              //   context,
              //   'Easy',
              //   'Perfect for beginners',
              //   Colors.green,
              //   Icons.shield_outlined,
              //   () => Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => ExerciseListScreen(
              //         difficulty: 'Easy',
              //         exercises: easyExercises,
              //       ),
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 10.0,
              // ),
              // buildDifficultyCard(
              //   context,
              //   'Medium',
              //   'For regular exercisers',
              //   Colors.amber,
              //   Icons.local_fire_department_outlined,
              //   () => Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => ExerciseListScreen(
              //         difficulty: 'Medium',
              //         exercises: mediumExercises,
              //       ),
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 10.0,
              // ),
              // buildDifficultyCard(
              //   context,
              //   'Advanced',
              //   'Challenge yourself',
              //   Colors.redAccent,
              //   Icons.emoji_events_outlined,
              //   () => Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => ExerciseListScreen(
              //         difficulty: 'Advanced',
              //         exercises: advancedExercises,
              //       ),
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 50.0,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _categories_sections() {
    return GridView.builder(
      // physics:
      //     const NeverScrollableScrollPhysics(), // Disable scrolling in GridView
      shrinkWrap: true, // Make GridView take only the space it needs
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.5,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return CategoryCard(category: categories[index]);
      },
    );
  }

  Widget _difficalties_secion() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildWorkoutCard(
            key: const ValueKey('workout_3'),
            title: 'Yoga Flow',
            trainer: 'Emma Wilson',
            duration: '20 min',
            difficulty: 'easy',
            image: 'assets/achievement/strength_2.jpg',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExerciseListScreen(
                  difficulty: 'Easy',
                  exercises: easyExercises,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildWorkoutCard(
            key: const ValueKey('workout_1'),
            title: 'HIIT Cardio Blast',
            trainer: 'Sarah Johnson',
            duration: '30 min',
            difficulty: 'medium',
            image: 'assets/achievement/strength_2.jpg',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExerciseListScreen(
                  difficulty: 'Medium',
                  exercises: mediumExercises,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildWorkoutCard(
            key: const ValueKey('workout_2'),
            title: 'Strength Foundation',
            trainer: 'Mike Chen',
            duration: '45 min',
            difficulty: 'Hard',
            image: 'assets/achievement/strength_2.jpg',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExerciseListScreen(
                  difficulty: 'Advanced',
                  exercises: advancedExercises,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMetricCard({
    required Key key,
    required IconData icon,
    required String value,
    required String label,
    required Color color,
    required double progress,
  }) {
    return Column(
      key: key,
      children: [
        SizedBox(
          width: 80,
          height: 80,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 80,
                height: 80,
                child: CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 6,
                  backgroundColor: Colors.grey[800],
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                ),
              ),
              Icon(
                icon,
                color: color,
                size: 24,
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildWorkoutCard(
      {required Key key,
      required String title,
      required String trainer,
      required String duration,
      required String difficulty,
      required String image,
      void Function()? onTap}) {
    Color difficultyColor;
    if (difficulty == 'easy') {
      difficultyColor = Colors.green;
    } else if (difficulty == 'medium') {
      difficultyColor = Colors.orange;
    } else {
      difficultyColor = Colors.red;
    }

    return GestureDetector(
      key: key,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xFF222533),
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
                image,
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: difficultyColor,
                        ),
                        child: Text(
                          difficulty.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.grey[700],
                        child: Text(
                          trainer[0], // Show trainer's initial
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        trainer,
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.access_time,
                          color: Colors.grey, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        duration,
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
