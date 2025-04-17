import 'package:fitlytic/constants/custom_colors.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1D2A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    hoverColor: MyColors.grey2,
                    iconSize: 24.0,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Notifications',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Mark all as read',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                '2 unread notifications',
                style: TextStyle(color: Colors.white.withOpacity(0.6)),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: const [
                    NotificationCard(
                      icon: '🎯',
                      title: 'Daily Goal Achieved!',
                      message:
                          'Congratulations! You\'ve reached your daily step goal of 10,000 steps.',
                      timeAgo: '2 hours ago',
                      isUnread: true,
                    ),
                    SizedBox(height: 12),
                    NotificationCard(
                      icon: '👍',
                      title: 'New Workout Available',
                      message:
                          'Check out the new HIIT workout program designed for your fitness level.',
                      timeAgo: '5 hours ago',
                      isUnread: true,
                    ),
                    SizedBox(height: 12),
                    NotificationCard(
                      icon: '🏆',
                      title: 'Achievement Unlocked',
                      message:
                          'You\'ve earned the "Early Bird" badge for completing 5 morning workouts!',
                      timeAgo: 'Yesterday',
                      isUnread: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String icon;
  final String title;
  final String message;
  final String timeAgo;
  final bool isUnread;

  const NotificationCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.message,
    required this.timeAgo,
    required this.isUnread,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF262B44),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              icon,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      if (isUnread)
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.close,
                          size: 16,
                          color: Colors.white54,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    message,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    timeAgo,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.4),
                      fontSize: 12,
                    ),
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
