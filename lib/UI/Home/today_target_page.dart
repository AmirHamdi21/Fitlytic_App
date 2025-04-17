// import 'package:flutter/material.dart';


// class TodayTargetPage extends StatefulWidget {
//   const TodayTargetPage({super.key});

//   @override
//   State<TodayTargetPage> createState() => _TodayTargetPageState();
// }

// class _TodayTargetPageState extends State<TodayTargetPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         title: const Text(
//           "Activity Tracker",
//           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
//         ),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.more_vert, color: Colors.black),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildTodayTarget(),
//             const SizedBox(height: 20),
//             _buildActivityProgress(),
//             const SizedBox(height: 20),
//             _buildLatestActivity(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTodayTarget() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.blue[100],
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text("Today Target", style: TextStyle(fontWeight: FontWeight.bold)),
//           const SizedBox(height: 10),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               _targetCard(Icons.local_drink, "8L", "Water Intake"),
//               _targetCard(Icons.directions_walk, "2400", "Foot Steps"),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _targetCard(IconData icon, String value, String label) {
//     return Container(
//       padding: const EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         children: [
//           Icon(icon, color: Colors.blue),
//           Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
//           Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
//         ],
//       ),
//     );
//   }

//   Widget _buildActivityProgress() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Text("Activity Progress", style: TextStyle(fontWeight: FontWeight.bold)),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: const Text("Weekly", style: TextStyle(color: Colors.white)),
//             ),
//           ],
//         ),
//         const SizedBox(height: 10),
//         SizedBox(
//           height: 150,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: List.generate(7, (index) => _barChart(index)),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _barChart(int index) {
//     List<double> heights = [50, 90, 60, 100, 80, 40, 70];
//     return Column(
//       children: [
//         Container(
//           width: 20,
//           height: heights[index],
//           decoration: BoxDecoration(
//             color: Colors.blueAccent,
//             borderRadius: BorderRadius.circular(5),
//           ),
//         ),
//         const SizedBox(height: 5),
//         Text(["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"][index]),
//       ],
//     );
//   }

//   Widget _buildLatestActivity() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text("Latest Activity", style: TextStyle(fontWeight: FontWeight.bold)),
//             Text("See more", style: TextStyle(color: Colors.blue)),
//           ],
//         ),
//         const SizedBox(height: 10),
//         _activityCard("Drinking 300ml Water", "About 3 minutes ago"),
//         _activityCard("Eat Snack (Fitbar)", "About 10 minutes ago"),
//       ],
//     );
//   }

//   Widget _activityCard(String title, String subtitle) {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       margin: const EdgeInsets.symmetric(vertical: 5),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: ListTile(
//         leading: const CircleAvatar(
//           backgroundColor: Colors.orangeAccent,
//           child: Icon(Icons.local_drink, color: Colors.white),
//         ),
//         title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
//         subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
//         trailing: const Icon(Icons.more_vert),
//       ),
//     );
//   }
// }