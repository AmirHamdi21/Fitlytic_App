import 'package:fitlytic/UI/auth/welcome_screen.dart';
import 'package:fitlytic/constants/custom_colors.dart';
import 'package:flutter/material.dart';

class MembershipScreen extends StatefulWidget {
  const MembershipScreen({super.key});

  @override
  State<MembershipScreen> createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {
  bool _monthlySelected = true;
  int _currentPage = 0;

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141B2D),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Title and subtitle
              const SizedBox(height: 20),
              Text(
                'Choose Your Plan',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Unlock exclusive features & take your fitness to the next level!',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white70,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              // Billing toggle
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1F2940),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _monthlySelected = true;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            gradient: _monthlySelected
                                ? MyColors.customGradient
                                : const LinearGradient(colors: [
                                    Colors.transparent,
                                    Colors.transparent,
                                  ]),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            'Monthly',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: _monthlySelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _monthlySelected = false;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            gradient: !_monthlySelected
                                ? MyColors.customGradient
                                : const LinearGradient(colors: [
                                    Colors.transparent,
                                    Colors.transparent,
                                  ]),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Text(
                                'Yearly',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: !_monthlySelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                              if (!_monthlySelected)
                                Positioned(
                                  right: 10,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Text(
                                      'Save 30%',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Membership plans
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  children: [
                    // Display plans page
                    _buildPlansPage(),

                    // Features comparison page
                    _buildFeatureComparisonPage(),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // Page indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildPageIndicator(0),
                  const SizedBox(width: 8),
                  _buildPageIndicator(1),
                ],
              ),
              // const SizedBox(height: 20),

              // Money-back guarantee
              if (_currentPage == 1)
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1F2940),
                        borderRadius: BorderRadius.circular(12),
                        border:
                            Border.all(color: Colors.amber.withOpacity(0.5)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.workspace_premium,
                              color: Colors.amber[400], size: 20),
                          const SizedBox(width: 10),
                          const Flexible(
                            child: Text(
                              '30-day money-back guarantee. No questions asked.',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: MyColors.customGradient,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const WelcomeScreen()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            "Continue",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPageIndicator(int index) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index
            ? Theme.of(context).colorScheme.primary
            : Colors.grey.withOpacity(0.4),
      ),
    );
  }

  Widget _buildPlansPage() {
    return LayoutBuilder(
      builder: (context, constraints) {
        // If width is narrow, use a column layout instead of row
        final isNarrow = constraints.maxWidth < 600;

        if (isNarrow) {
          return SingleChildScrollView(
            child: Column(
              children: [
                _buildPlanCard(
                  title: 'Free',
                  price: '0',
                  description: 'Perfect for getting started',
                  features: [
                    'Limited Workouts & Challenges',
                    'Access to Community Forum',
                    'Basic Progress Tracking',
                    'Standard Support',
                  ],
                  buttonText: 'Get Started',
                  icon: Icons.bolt,
                ),
                _buildProPlanWithBadge(),
                _buildPlanCard(
                  title: 'Elite',
                  price: _monthlySelected ? '19.99' : '199.99',
                  period: _monthlySelected ? '/mo' : '/yr',
                  description: 'For serious athletes and professionals',
                  features: [
                    'Everything in Pro Plan',
                    '1-on-1 Virtual Coaching',
                    'Exclusive Programs',
                    'Early Access Features',
                    'VIP Support',
                  ],
                  buttonText: 'Choose Plan',
                  icon: Icons.workspace_premium,
                  iconColor: Colors.purple,
                  borderColor: Colors.purple,
                ),
              ],
            ),
          );
        } else {
          // Original row layout for wider screens
          return SingleChildScrollView(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Free Plan
                Expanded(
                  child: _buildPlanCard(
                    title: 'Free',
                    price: '0',
                    description: 'Perfect for getting started',
                    features: [
                      'Limited Workouts & Challenges',
                      'Access to Community Forum',
                      'Basic Progress Tracking',
                      'Standard Support',
                    ],
                    buttonText: 'Get Started',
                    icon: Icons.bolt,
                  ),
                ),

                // Pro Plan
                Expanded(child: _buildProPlanWithBadge()),

                // Elite Plan
                Expanded(
                  child: _buildPlanCard(
                    title: 'Elite',
                    price: _monthlySelected ? '19.99' : '199.99',
                    period: _monthlySelected ? '/mo' : '/yr',
                    description: 'For serious athletes and professionals',
                    features: [
                      'Everything in Pro Plan',
                      '1-on-1 Virtual Coaching',
                      'Exclusive Programs',
                      'Early Access Features',
                      'VIP Support',
                    ],
                    buttonText: 'Choose Plan',
                    icon: Icons.workspace_premium,
                    iconColor: Colors.purple,
                    borderColor: Colors.purple,
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _buildProPlanWithBadge() {
    return Stack(
      children: [
        _buildPlanCard(
          title: 'Pro',
          price: _monthlySelected ? '9.99' : '99.99',
          period: _monthlySelected ? '/mo' : '/yr',
          description: 'Most popular for fitness enthusiasts',
          features: [
            'Unlimited Workout Plans',
            'AI Virtual Trainer',
            'Advanced Analytics',
            'Premium Diet Plans',
            'Priority Support',
          ],
          buttonText: 'Choose Plan',
          icon: Icons.star,
          highlighted: true,
        ),
        Positioned(
          top: 0,
          right: 16,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Text(
              'Most Popular',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPlanCard({
    required String title,
    required String price,
    String period = '',
    required String description,
    required List<String> features,
    required String buttonText,
    required IconData icon,
    Color? iconColor,
    Color? borderColor,
    bool highlighted = false,
  }) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2940),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: highlighted
              ? Theme.of(context).colorScheme.primary
              : (borderColor ?? const Color(0xFF2A3349)),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Icon and plan title
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2A3349),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    icon,
                    color: iconColor ??
                        (highlighted
                            ? Theme.of(context).colorScheme.primary
                            : Colors.grey),
                    size: 20,
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          // Price
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  '\$$price',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  period,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),

          // Description
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
          ),

          // Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                gradient: MyColors.customGradient,
                borderRadius: BorderRadius.circular(8),
              ),
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Show feature comparison on button press
                  _pageController.animateToPage(
                    1,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: highlighted
                      ? Colors.transparent
                      : const Color(0xFF2A3349),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          // Features
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: features.map((feature) {
              return Padding(
                padding: const EdgeInsets.only(
                    bottom: 10.0, left: 16.0, right: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        feature,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 10), // Add some bottom padding
        ],
      ),
    );
  }

  Widget _buildFeatureComparisonPage() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color(0xFF1F2940),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Feature Comparison',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            // Feature comparison table - made responsive
            _buildFeatureComparisonTable(),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureComparisonTable() {
    return LayoutBuilder(builder: (context, constraints) {
      // Check if we need to use a more compact layout
      final isNarrow = constraints.maxWidth < 400;

      if (isNarrow) {
        // Simplified layout for narrow screens
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Feature sections
            _buildFeatureSectionCompact('Workout Programs'),
            _buildFeatureValueRowCompact('Free:', 'Basic'),
            _buildFeatureValueRowCompact('Pro:', 'Advanced', isPro: true),
            _buildFeatureValueRowCompact('Elite:', 'Elite', isElite: true),
            const Divider(height: 20, color: Color(0xFF2A3349)),

            _buildFeatureSectionCompact('AI Trainer'),
            _buildFeatureValueRowCompact('Free:', false),
            _buildFeatureValueRowCompact('Pro:', true, isPro: true),
            _buildFeatureValueRowCompact('Elite:', 'Advanced AI',
                isElite: true),
            const Divider(height: 20, color: Color(0xFF2A3349)),

            _buildFeatureSectionCompact('Nutrition Plans'),
            _buildFeatureValueRowCompact('Free:', 'Basic'),
            _buildFeatureValueRowCompact('Pro:', 'Premium', isPro: true),
            _buildFeatureValueRowCompact('Elite:', 'Custom', isElite: true),
            const Divider(height: 20, color: Color(0xFF2A3349)),

            _buildFeatureSectionCompact('Support'),
            _buildFeatureValueRowCompact('Free:', 'Email'),
            _buildFeatureValueRowCompact('Pro:', '24/7 Priority', isPro: true),
            _buildFeatureValueRowCompact('Elite:', 'VIP', isElite: true),
            const Divider(height: 20, color: Color(0xFF2A3349)),

            _buildFeatureSectionCompact('1-on-1 Coaching'),
            _buildFeatureValueRowCompact('Free:', false),
            _buildFeatureValueRowCompact('Pro:', false, isPro: true),
            _buildFeatureValueRowCompact('Elite:', true, isElite: true),
            const Divider(height: 20, color: Color(0xFF2A3349)),

            _buildFeatureSectionCompact('Community Access'),
            _buildFeatureValueRowCompact('Free:', 'Basic'),
            _buildFeatureValueRowCompact('Pro:', 'Premium', isPro: true),
            _buildFeatureValueRowCompact('Elite:', 'VIP', isElite: true),
            const Divider(height: 20, color: Color(0xFF2A3349)),

            _buildFeatureSectionCompact('Challenges'),
            _buildFeatureValueRowCompact('Free:', 'Basic'),
            _buildFeatureValueRowCompact('Pro:', 'Premium', isPro: true),
            _buildFeatureValueRowCompact('Elite:', 'Elite', isElite: true),
            const Divider(height: 20, color: Color(0xFF2A3349)),

            _buildFeatureSectionCompact('Exclusive Content'),
            _buildFeatureValueRowCompact('Free:', false),
            _buildFeatureValueRowCompact('Pro:', true, isPro: true),
            _buildFeatureValueRowCompact('Elite:', 'Early Access',
                isElite: true),
          ],
        );
      } else {
        // Standard layout for wider screens
        return Column(
          children: [
            // Header row
            Padding(
              padding: const EdgeInsets.only(right: 12.0, bottom: 8.0),
              child: Row(
                children: [
                  const Expanded(
                    flex: 3,
                    child: Text(
                      'Feature',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 2,
                    child: Text(
                      'Free',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Pro',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 2,
                    child: Text(
                      'Elite',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Divider(color: Color(0xFF2A3349)),

            // Feature rows
            _buildFeatureRow(
              icon: Icons.fitness_center,
              feature: 'Workout Programs',
              free: 'Basic',
              pro: 'Advanced',
              elite: 'Elite',
              eliteHighlight: true,
            ),
            _buildFeatureRow(
              icon: Icons.timer,
              feature: 'AI Trainer',
              free: false,
              pro: true,
              elite: 'Advanced AI',
              eliteHighlight: true,
            ),
            _buildFeatureRow(
              icon: Icons.restaurant_menu,
              feature: 'Nutrition Plans',
              free: 'Basic',
              pro: 'Premium',
              elite: 'Custom',
              eliteHighlight: true,
            ),
            _buildFeatureRow(
              icon: Icons.headset_mic,
              feature: 'Support',
              free: 'Email',
              pro: '24/7 Priority',
              elite: 'VIP',
              eliteHighlight: true,
            ),
            _buildFeatureRow(
              icon: Icons.person,
              feature: '1-on-1 Coaching',
              free: false,
              pro: false,
              elite: true,
              eliteHighlight: true,
            ),
            _buildFeatureRow(
              icon: Icons.group,
              feature: 'Community Access',
              free: 'Basic',
              pro: 'Premium',
              elite: 'VIP',
              eliteHighlight: true,
            ),
            _buildFeatureRow(
              icon: Icons.emoji_events,
              feature: 'Challenges',
              free: 'Basic',
              pro: 'Premium',
              elite: 'Elite',
              eliteHighlight: true,
            ),
            _buildFeatureRow(
              icon: Icons.star,
              feature: 'Exclusive Content',
              free: false,
              pro: true,
              elite: 'Early Access',
              eliteHighlight: true,
            ),
          ],
        );
      }
    });
  }

  Widget _buildFeatureSectionCompact(String feature) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 8.0),
      child: Row(
        children: [
          Text(
            feature,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureValueRowCompact(String plan, dynamic value,
      {bool isPro = false, bool isElite = false}) {
    Color textColor = Colors.white70;
    if (isPro) textColor = Theme.of(context).colorScheme.primary;
    if (isElite) textColor = Colors.purple;

    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 4.0, bottom: 4.0),
      child: Row(
        children: [
          Text(
            plan,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          const SizedBox(width: 8),
          value is bool
              ? Icon(
                  value ? Icons.check : Icons.close,
                  color: value ? Colors.green : Colors.red,
                  size: 18,
                )
              : Text(
                  value,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
        ],
      ),
    );
  }

  Widget _buildFeatureRow({
    required IconData icon,
    required String feature,
    required dynamic free,
    required dynamic pro,
    required dynamic elite,
    bool eliteHighlight = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Feature with icon
          Expanded(
            flex: 3,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 16, color: Colors.white70),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    feature,
                    style: const TextStyle(color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),

          // Free plan value
          Expanded(
            flex: 2,
            child: Center(
              child: free is bool
                  ? Icon(
                      free ? Icons.check : Icons.close,
                      color: free ? Colors.green : Colors.red,
                      size: 18,
                    )
                  : Text(
                      free,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white70),
                      overflow: TextOverflow.ellipsis,
                    ),
            ),
          ),

          // Pro plan value
          Expanded(
            flex: 2,
            child: Center(
              child: pro is bool
                  ? Icon(
                      pro ? Icons.check : Icons.close,
                      color: pro ? Colors.green : Colors.red,
                      size: 18,
                    )
                  : Text(
                      pro,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
            ),
          ),

          // Elite plan value
          Expanded(
            flex: 2,
            child: Center(
              child: elite is bool
                  ? Icon(
                      elite ? Icons.check : Icons.close,
                      color: elite ? Colors.green : Colors.red,
                      size: 18,
                    )
                  : Text(
                      elite,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color:
                            eliteHighlight ? Colors.lightBlue : Colors.purple,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
