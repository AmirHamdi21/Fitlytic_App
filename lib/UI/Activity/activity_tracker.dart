import 'package:fitlytic/constants/custom_colors.dart';
import 'package:fitlytic/constants/custom_styles.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ActivityTrackerScreen extends StatefulWidget {
  const ActivityTrackerScreen({super.key});

  @override
  State<ActivityTrackerScreen> createState() => _ActivityTrackerTestState();
}

class _ActivityTrackerTestState extends State<ActivityTrackerScreen> {
  String selectedTimeFrame = 'Week';
  String chartMetric = 'Steps';
  bool isDropdownOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/notifications');
            },
          ),
        ],
      ),
      backgroundColor: const Color(0xFF1A1D2A),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                const Text(
                  'Good Evening, Alex! Here\'s your progress.',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Changed to white
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Keep pushing towards your goals!',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 24),

                // Metrics Row
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildCircularMetric(
                        icon: Icons.directions_walk,
                        title: 'Steps',
                        value: '8432/10000',
                        progress: 0.84,
                        color: Colors.blue,
                      ),
                      const SizedBox(width: 16),
                      _buildCircularMetric(
                        icon: Icons.local_fire_department,
                        title: 'Calories',
                        value: '420 kcal',
                        progress: 0.42,
                        color: Colors.red,
                      ),
                      const SizedBox(width: 16),
                      _buildCircularMetric(
                        icon: Icons.timer,
                        title: 'Active Minutes',
                        value: '45 min',
                        progress: 0.75,
                        color: Colors.green,
                      ),
                      const SizedBox(width: 16),
                      _buildCircularMetric(
                        icon: Icons.favorite,
                        title: 'Heart Rate',
                        value: '72 bpm',
                        progress: 0.6,
                        color: Colors.pink,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Time Frame Selection
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildTimeFrameButton('Day'),
                      const SizedBox(width: 8),
                      _buildTimeFrameButton('Week'),
                      const SizedBox(width: 8),
                      _buildTimeFrameButton('Month'),
                      const SizedBox(width: 8),
                      _buildTimeFrameButton('Custom'),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Activity Overview Section - Fixed overflow issues
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF242A38),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.bar_chart,
                                  size: 18, color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                                'Activity Overview',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white, // Changed to white
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isDropdownOpen = !isDropdownOpen;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: const Color(0xFF374151),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    chartMetric,
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                  const SizedBox(width: 4),
                                  const Icon(Icons.arrow_drop_down,
                                      size: 18, color: Colors.white),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (isDropdownOpen)
                        Container(
                          margin: const EdgeInsets.only(top: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF374151),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Column(
                            children: [
                              _buildDropdownItem('Steps'),
                              _buildDropdownItem('Calories'),
                              _buildDropdownItem('Minutes'),
                            ],
                          ),
                        ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 180,
                        child: _buildBarChart(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Activity Distribution Chart
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF242A38),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.pie_chart, size: 18, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            'Activity Distribution',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white, // Changed to white
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: SizedBox(
                          height: 180,
                          width: 180,
                          child: _buildPieChart(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildLegendItem('Cardio', Colors.blue),
                            const SizedBox(width: 16),
                            _buildLegendItem('Strength', Colors.green),
                            const SizedBox(width: 16),
                            _buildLegendItem('Yoga', Colors.red),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Recent Workouts Section
                const Text(
                  'Recent Workouts',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Changed to white
                  ),
                ),
                const SizedBox(height: 16),
                _buildWorkoutCard(
                  title: 'Morning HIIT',
                  instructor: 'with Sarah Johnson',
                  calories: '320 kcal',
                  duration: '30 min',
                  rating: 5.0,
                ),
                const SizedBox(height: 12),
                _buildWorkoutCard(
                  title: 'Afternoon Yoga',
                  instructor: 'with Mike Chen',
                  calories: '180 kcal',
                  duration: '45 min',
                  rating: 4.0,
                ),
                const SizedBox(height: 24),

                // Connected Devices and Share Progress
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF242A38),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      // ignore: prefer_const_constructors
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Row(
                            children: [
                              Icon(Icons.watch, size: 18, color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                                'Connected Devices',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white, // Changed to white
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 8,
                                    height: 8,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Flexible(
                                    child: Text(
                                      'Apple Watch Series 7',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Battery: 82%',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF242A38),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.share, size: 18, color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                                'Share Progress',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white, // Changed to white
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Container(
                            decoration: BoxDecoration(
                              gradient: MyColors.customGradient,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                minimumSize: const Size(double.infinity, 48),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.emoji_events,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Share Today\'s Achievement',
                                    style: customTitleStyle(14.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTimeFrameButton(String timeFrame) {
    final isSelected = selectedTimeFrame == timeFrame;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTimeFrame = timeFrame;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : const Color(0xFF242A38),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          timeFrame,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: Colors.white, // Added white color
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownItem(String item) {
    return GestureDetector(
      onTap: () {
        setState(() {
          chartMetric = item;
          isDropdownOpen = false;
        });
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        color: chartMetric == item
            ? Colors.blue.withOpacity(0.2)
            : Colors.transparent,
        child: Text(
          item,
          style: const TextStyle(color: Colors.white), // Added white color
        ),
      ),
    );
  }

  Widget _buildCircularMetric({
    required IconData icon,
    required String title,
    required String value,
    required double progress,
    required Color color,
  }) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF242A38),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 70,
                height: 70,
                child: CircularProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                  strokeWidth: 8,
                ),
              ),
              Icon(icon, color: color),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Added white color
          ),
        ),
      ],
    );
  }

  Widget _buildBarChart() {
    // Define different patterns based on the selected time frame
    List<double> values;
    List<String> labels;

    switch (selectedTimeFrame) {
      case 'Day':
        values = [3, 7, 4, 6, 2, 5, 4, 8, 5, 3, 6, 4];
        labels = List.generate(12, (index) => '${index * 2}h');
        break;
      case 'Week':
        values = [6, 8, 3, 1, 4, 7, 6];
        labels = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
        break;
      case 'Month':
        values = [
          5,
          3,
          2,
          6,
          3,
          6,
          8,
          5,
          7,
          4,
          6,
          5,
          3,
          4,
          2,
          5,
          3,
          6,
          7,
          5,
          4,
          3,
          5,
          7,
          4,
          8,
          6,
          5,
          4,
          3
        ];
        labels = List.generate(30, (index) => '${index + 1}');
        break;
      case 'Custom':
        values = [4, 5, 2, 7, 3, 5, 8];
        labels = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
        break;
      default:
        values = [6, 8, 3, 1, 4, 7, 6];
        labels = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    }

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: 10,
        barGroups: List.generate(
          values.length,
          (index) => BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                toY: values[index],
                color: const Color(0xFF2C3D5B),
                width: selectedTimeFrame == 'Month' ? 6 : 20,
                borderRadius: BorderRadius.zero,
              ),
            ],
          ),
        ),
        titlesData: FlTitlesData(
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                if (selectedTimeFrame == 'Month' &&
                    value % 5 != 0 &&
                    value != 0) {
                  return const SizedBox(); // Only show every 5th label for month view
                }
                return Text(
                  labels[value.toInt()],
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                );
              },
            ),
          ),
        ),
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
      ),
    );
  }

  Widget _buildPieChart() {
    return PieChart(
      PieChartData(
        sectionsSpace: 0,
        centerSpaceRadius: 60,
        sections: [
          PieChartSectionData(
            value: 45,
            color: Colors.blue,
            radius: 20,
            showTitle: false,
          ),
          PieChartSectionData(
            value: 30,
            color: Colors.green,
            radius: 20,
            showTitle: false,
          ),
          PieChartSectionData(
            value: 25,
            color: Colors.red,
            radius: 20,
            showTitle: false,
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(
              fontSize: 12, color: Colors.white), // Added white color
        ),
      ],
    );
  }

  Widget _buildWorkoutCard({
    required String title,
    required String instructor,
    required String calories,
    required String duration,
    required double rating,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF242A38),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.show_chart,
              color: Colors.blue,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white, // Added white color
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  instructor,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  calories,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Added white color
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  duration,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Wrap the star rating with MainAxisSize.min
          Container(
            constraints: const BoxConstraints(maxWidth: 80),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                5,
                (index) => Icon(
                  index < rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
