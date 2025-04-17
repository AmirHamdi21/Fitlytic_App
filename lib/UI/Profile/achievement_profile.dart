import 'package:fitlytic/constants/custom_colors.dart';
import 'package:flutter/material.dart';

class AchievementsPage extends StatelessWidget {
  const AchievementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1F2B),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader((){
               Navigator.of(context).pop();
            }),
            Expanded(
              child: GridView(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.1,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                mainAxisExtent: 190
                ),
                children: [
                  _buildAchievementCard(
                    icon: Icons.emoji_events,
                    iconColor: Colors.amber,
                    title: "100 Workouts",
                    subtitle: "Completed 100 workout sessions",
                    progress: 0.85,
                    progressColor: Colors.blue,
                    date: "March 15, 2024",
                  ),
                  _buildAchievementCard(
                    icon: Icons.local_fire_department,
                    iconColor: Colors.orange,
                    title: "Calorie Master",
                    subtitle: "Burned 50,000 calories",
                    progress: 0.65,
                    progressColor: Colors.blue,
                    date: "March 10, 2024",
                  ),
                  _buildAchievementCard(
                    icon: Icons.directions_run,
                    iconColor: Colors.green,
                    title: "5K Runner",
                    subtitle: "Completed 10 5K runs",
                    progress: 0.45,
                    progressColor: Colors.blue,
                    date: "March 5, 2024",
                  ),
                  _buildAchievementCard(
                    icon: Icons.track_changes,
                    iconColor: Colors.blue,
                    title: "Goal Crusher",
                    subtitle: "Achieved 5 fitness goals",
                    progress: 1.0,
                    progressColor: Colors.blue,
                    date: "March 1, 2024",
                  ),
                  _buildAchievementCard(
                    icon: Icons.watch_later,
                    iconColor: Colors.purple,
                    title: "Early Bird",
                    subtitle: "30 morning workouts",
                    progress: 0.75,
                    progressColor: Colors.blue,
                    date: "February 28, 2024",
                  ),
                  _buildAchievementCard(
                    icon: Icons.show_chart,
                    iconColor: Colors.blue,
                    title: "Consistency King",
                    subtitle: "4-week streak maintained",
                    progress: 0.90,
                    progressColor: Colors.blue,
                    date: "February 25, 2024",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(void Function()? onPressed) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
          hoverColor: MyColors.grey2,
          iconSize: 24.0,
          onPressed: onPressed,
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),

          const Text(
            "Achievements",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "View All",
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required double progress,
    required Color progressColor,
    required String date,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF212936),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 24,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white.withOpacity(0.7),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),
            const Spacer(),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[800],
              valueColor: AlwaysStoppedAnimation<Color>(progressColor),
            ),
            const SizedBox(height: 8),
            Text(
              date,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}