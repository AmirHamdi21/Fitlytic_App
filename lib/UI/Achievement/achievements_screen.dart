import 'package:flutter/material.dart';

class AchievementsScreen extends StatelessWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1D2A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1D2A),
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Achievements',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Text(
              'Track your fitness milestones',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/notifications');
            },
          ),
          IconButton(
            icon: const Icon(Icons.person_outline, color: Colors.white),
            onPressed: () {
              // Profile action
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
              const SizedBox(height: 14),

              // Achievement cards
              _buildAchievementCard(
                title: 'Workout Warrior',
                description: 'Complete 100 workouts',
                icon: Icons.emoji_events,
                progress: 1.0,
                progressText: '100% Complete',
                iconColor: Colors.amber,
              ),
              const SizedBox(height: 16),

              _buildAchievementCard(
                title: 'Early Bird',
                description: 'Complete 10 workouts before 7 AM',
                icon: Icons.wb_sunny,
                progress: 1.0,
                progressText: '100% Complete',
                iconColor: Colors.blue,
              ),
              const SizedBox(height: 16),

              _buildAchievementCard(
                title: 'Marathon Ready',
                description: 'Run a total of 100 kilometers',
                icon: Icons.track_changes,
                progress: 0.65,
                progressText: '65% Complete',
                iconColor: Colors.blue,
                locked: false,
              ),
              const SizedBox(height: 16),

              _buildAchievementCard(
                title: 'Strength Master',
                description: 'Lift 1000kg total in a single workout',
                icon: Icons.fitness_center,
                progress: 0.45,
                progressText: '45% Complete',
                iconColor: Colors.blue,
                locked: false,
              ),
              const SizedBox(height: 24),

              // Level progress
              _buildLevelProgress(
                level: 12,
                xp: 1250,
                maxXp: 2000,
              ),
              SizedBox(
                height: 100.0,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAchievementCard({
    required String title,
    required String description,
    required IconData icon,
    required double progress,
    required String progressText,
    required Color iconColor,
    bool locked = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFF222533),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFF2A2E3D),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    if (locked)
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Icon(Icons.lock, color: Colors.grey, size: 16),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey[800],
                  valueColor: AlwaysStoppedAnimation<Color>(
                    progress >= 1.0 ? Colors.green : Colors.blue,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  progressText,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLevelProgress({
    required int level,
    required int xp,
    required int maxXp,
  }) {
    final double progress = xp / maxXp;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFF222533),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFF2A2E3D),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.favorite,
                  color: Colors.purple,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Level $level',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    '$xp XP / $maxXp XP',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey[800],
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.purple),
            minHeight: 8,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      ),
    );
  }
}
