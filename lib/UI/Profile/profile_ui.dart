// import 'package:fitness/widgets/custom_app_bar.dart';
// import 'package:fitness/widgets/profile/body_info.dart';
// import 'package:fitness/widgets/profile/user_info.dart';
// import 'package:flutter/material.dart';

// import '../constants.dart';

// class ProfileUi extends StatefulWidget {
//   const ProfileUi({super.key});

//   @override
//   State<ProfileUi> createState() => _NotificationsState();
// }

// class _NotificationsState extends State<ProfileUi> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white10,
//       appBar: AppBar(
//         backgroundColor: Colors.white10,
//           title: CustomAppBar(
//         isleadingicon: true,
//         istrailingicon: true,
//         title: "Profile",
//       )),
//       body: Padding(
//           padding: const EdgeInsets.only(top: 20.0, left: 6.0, right: 6.0),
//           child: ListView(
//             children: [
//               const UserInfo(),
//               const SizedBox(
//                 height: 20.0,
//               ),
//               const BodyInfo(),
//               const SizedBox(
//                 height: 30.0,
//               ),
//               Container(
//               margin: const EdgeInsets.symmetric(horizontal: 8),
//               padding: EdgeInsets.only(left: 15.0), // Add spacing
//               decoration: BoxDecoration(
//                 color: Colors.red[100],
//                 // boxShadow: [
//                 //   BoxShadow(
//                 //     color: Colors.grey.withOpacity(0.2),
//                 //     spreadRadius: 2,
//                 //     blurRadius: 5,
//                 //     offset: const Offset(0, 2),
//                 //   ),
//                 // ],
//                 borderRadius: BorderRadius.circular(30.0),
//               ),
//               height: 100,
//               width: 110,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Account",
//                     style: const TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black),
//                   ),
//                   Text(
//                    "asdasd",
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             )
//             ],
//           )),
//     );
//   }
// }

import 'package:fitlytic/UI/Profile/achievement_profile.dart';
import 'package:fitlytic/UI/Profile/personal_info.dart';
import 'package:fitlytic/UI/Profile/privacy_policy_page.dart';
import 'package:fitlytic/UI/Profile/settings_page.dart';
import 'package:fitlytic/UI/Profile/support_page.dart';
import 'package:fitlytic/UI/Home/workout_completion_screen.dart';
import 'package:fitlytic/UI/Profile/workout_history_page.dart';
import 'package:fitlytic/UI/Profile/workout_progress.dart';
import 'package:fitlytic/constants/custom_colors.dart';
import 'package:fitlytic/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ProfileUi extends StatefulWidget {
  const ProfileUi({super.key});

  @override
  State<ProfileUi> createState() => _ProfileUiState();
}

class _ProfileUiState extends State<ProfileUi> {
  bool isNotificationEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CustomAppBar(
          isleadingicon: true,
          istrailingicon: true,
          title: "Profile",
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey.shade300,
              child: const Icon(Icons.person, size: 40),
            ),
            const SizedBox(height: 10),
            ShaderMask(
              shaderCallback: (bounds) =>
                  MyColors.customGradient.createShader(bounds),
              child: const Text(
                "Amir Hamdi",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const Text(
              'Lose a Fat Program',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                gradient: MyColors.customGradient,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const WorkoutCompletionScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text('Edit', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProfileInfoCard(label: 'Height', value: '180cm'),
                ProfileInfoCard(label: 'Weight', value: '65kg'),
                ProfileInfoCard(label: 'Age', value: '22yo'),
              ],
            ),
            const SizedBox(height: 20),
            buildSection('Account', [
              {'title': 'Personal Data', 'icon': Icons.person, 'ontap': () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PersonalInfo(),
                    ),
                  );
              }},
              {'title': 'Achievement', 'icon': Icons.emoji_events, 'ontap': () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AchievementsPage(),
                    ),
                  );
              }},
              {'title': 'Activity History', 'icon': Icons.history, 'ontap': () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const WorkoutHistoryPage(),
                    ),
                  );
              }},
              {'title': 'Workout Progress', 'icon': Icons.fitness_center, 'ontap': () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const WorkoutProgress(),
                    ),
                  );
              }},
            ]),
            const SizedBox(height: 20),
            buildNotificationSection(),
            const SizedBox(height: 20),
            buildSection('Other', [
              {
                'title': 'Contact Us',
                'icon': Icons.contact_mail,
                'ontap': () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SupportPage(),
                    ),
                  );
                }
              },
              {
                'title': 'Privacy Policy',
                'icon': Icons.privacy_tip,
                'ontap': () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PrivacyPolicyPage(),
                    ),
                  );
                }
              },
              {'title': 'Settings', 'icon': Icons.settings, 'ontap': () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SettingsPage(),
                    ),
                  );
              }},
            ]),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.11,
            )
          ],
        ),
      ),
    );
  }

  Widget buildSection(String title, List<Map<String, dynamic>> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) =>
              MyColors.customGradient.createShader(bounds),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 10),
        ...items.map((item) => ListTile(
              onTap: item['ontap'],
              leading: ShaderMask(
                shaderCallback: (bounds) =>
                    MyColors.customGradient.createShader(bounds),
                child: Icon(item['icon'], color: Colors.white),
              ),
              title: Text(item['title']),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            )),
      ],
    );
  }

  Widget buildNotificationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) =>
              MyColors.customGradient.createShader(bounds),
          child: const Text(
            'Notification',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 10),
        ListTile(
          leading: ShaderMask(
            shaderCallback: (bounds) =>
                MyColors.customGradient.createShader(bounds),
            child: const Icon(Icons.notifications, color: Colors.white),
          ),
          title: const Text('Pop-up Notification'),
          trailing: Switch(
            value: isNotificationEnabled,
            onChanged: (value) {
              setState(() {
                isNotificationEnabled = value;
              });
            },
          ),
        ),
      ],
    );
  }
}

class ProfileInfoCard extends StatelessWidget {
  final String label;
  final String value;

  const ProfileInfoCard({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Colors.blue, Colors.purple],
          ).createShader(bounds),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
