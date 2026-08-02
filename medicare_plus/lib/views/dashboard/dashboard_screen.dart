import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isDesktop = constraints.maxWidth > 900;
        return SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1440),
              child: Padding(
                padding: EdgeInsets.all(isDesktop ? 64.0 : 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeroSection(),
                    const SizedBox(height: 48),
                    _buildHealthOverviewGrid(context, isDesktop),
                    const SizedBox(height: 48),
                    _buildQuickActions(isDesktop),
                    const SizedBox(height: 48),
                    _buildScheduleSection(isDesktop),
                    const SizedBox(height: 64),
                    _buildFooter(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeroSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(width: 40, height: 2, color: const Color(0x330F172A)),
            const SizedBox(width: 12),
            Text('VITALITY CORE ANALYSIS', style: GoogleFonts.inter(color: const Color(0xFF0F172A), fontSize: 12, fontWeight: FontWeight.w600, letterSpacing: 2.5)),
          ],
        ),
        const SizedBox(height: 16),
        RichText(
          text: TextSpan(
            style: GoogleFonts.sourceSerif4(fontSize: 48, fontWeight: FontWeight.bold, color: const Color(0xFF0B1C30)),
            children: [
              const TextSpan(text: 'Good Morning, '),
              TextSpan(text: 'Alex.', style: GoogleFonts.sourceSerif4(fontStyle: FontStyle.italic, fontWeight: FontWeight.normal)),
            ],
          ),
        ),
        const SizedBox(height: 16),
        RichText(
          text: TextSpan(
            style: GoogleFonts.inter(fontSize: 18, color: const Color(0xFF45464D), height: 1.5),
            children: [
              const TextSpan(text: 'Your wellness metrics are showing positive trends. You\'re currently '),
              TextSpan(text: 'ahead of 82%', style: GoogleFonts.inter(color: const Color(0xFF0F172A), fontWeight: FontWeight.w600)),
              const TextSpan(text: ' of your peer group\'s activity level this week.'),
            ],
          ),
        ),
      ],
    ).animate().fadeIn(duration: 700.ms).slideY(begin: -0.1, end: 0);
  }

  Widget _buildHealthOverviewGrid(BuildContext context, bool isDesktop) {
    List<Widget> children = [
      Expanded(flex: isDesktop ? 8 : 1, child: _buildMainScoreCard(isDesktop)),
      if (isDesktop) const SizedBox(width: 24) else const SizedBox(height: 24),
      Expanded(flex: isDesktop ? 4 : 1, child: _buildDailyTipCard()),
    ];
    
    return isDesktop 
        ? Row(crossAxisAlignment: CrossAxisAlignment.start, children: children)
        : Column(children: children);
  }

  Widget _buildMainScoreCard(bool isDesktop) {
    return Container(
      padding: EdgeInsets.all(isDesktop ? 48 : 24),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.4)),
        boxShadow: const [BoxShadow(color: Color(0x0A000000), blurRadius: 64, offset: Offset(0, 32))],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isWide = constraints.maxWidth > 500;
          List<Widget> children = [
            SizedBox(
              width: 224,
              height: 224,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 184,
                    height: 184,
                    child: CircularProgressIndicator(
                      value: 0.86,
                      strokeWidth: 8,
                      backgroundColor: const Color(0xFFDCE9FF).withValues(alpha: 0.5),
                      valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF0F172A)),
                      strokeCap: StrokeCap.round,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('86%', style: GoogleFonts.inter(fontSize: 52, fontWeight: FontWeight.bold, color: const Color(0xFF0B1C30), letterSpacing: -2)),
                      Text('VITALITY INDEX', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600, color: const Color(0x9945464D), letterSpacing: 1.5)),
                    ],
                  ),
                ],
              ),
            ),
            if (isWide) const SizedBox(width: 48) else const SizedBox(height: 32),
            if (isWide)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0x1A0F172A),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(Icons.bolt, color: Color(0xFF0F172A)),
                        ),
                        const SizedBox(width: 12),
                        Expanded(child: Text('Overall Health Status', style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w600, color: const Color(0xFF0B1C30)))),
                      ],
                    ),
                    const SizedBox(height: 16),
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.inter(fontSize: 16, color: const Color(0xFF45464D), height: 1.5),
                        children: [
                          const TextSpan(text: 'Your heart rate variability and deep sleep cycles have improved by '),
                          TextSpan(text: '12.4%', style: GoogleFonts.inter(color: const Color(0xFF0F172A), fontWeight: FontWeight.w600)),
                          const TextSpan(text: ' since last month. Keep maintaining your hydration levels.'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Detailed Analytics Report', style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500, color: const Color(0xFF0F172A))),
                        const SizedBox(width: 12),
                        const Icon(Icons.arrow_forward, size: 18, color: Color(0xFF0F172A)),
                      ],
                    ),
                  ],
                ),
              )
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0x1A0F172A),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(Icons.bolt, color: Color(0xFF0F172A)),
                      ),
                      const SizedBox(width: 12),
                      Expanded(child: Text('Overall Health Status', style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w600, color: const Color(0xFF0B1C30)))),
                    ],
                  ),
                  const SizedBox(height: 16),
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.inter(fontSize: 16, color: const Color(0xFF45464D), height: 1.5),
                      children: [
                        const TextSpan(text: 'Your heart rate variability and deep sleep cycles have improved by '),
                        TextSpan(text: '12.4%', style: GoogleFonts.inter(color: const Color(0xFF0F172A), fontWeight: FontWeight.w600)),
                        const TextSpan(text: ' since last month. Keep maintaining your hydration levels.'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Detailed Analytics Report', style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500, color: const Color(0xFF0F172A))),
                      const SizedBox(width: 12),
                      const Icon(Icons.arrow_forward, size: 18, color: Color(0xFF0F172A)),
                    ],
                  ),
                ],
              ),
          ];
          
          return isWide 
              ? Row(crossAxisAlignment: CrossAxisAlignment.center, children: children)
              : Column(crossAxisAlignment: CrossAxisAlignment.center, children: children);
        }
      ),
    );
  }

  Widget _buildDailyTipCard() {
    return Container(
      padding: const EdgeInsets.all(48),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [BoxShadow(color: Color(0x330F172A), blurRadius: 24, offset: Offset(0, 16))],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -20,
            right: -20,
            child: Icon(Icons.lightbulb_outline, size: 120, color: Colors.white.withValues(alpha: 0.05)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(Icons.tips_and_updates, color: Colors.white),
                  ),
                  const SizedBox(height: 32),
                  Text('Daily Insight', style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white)),
                  const SizedBox(height: 16),
                  Text(
                    '"Optimal focus begins with hydration. Aim for 8 glasses today to boost cognitive clarity."',
                    style: GoogleFonts.inter(fontSize: 16, color: const Color(0xCCFFFFFF), height: 1.5, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              const SizedBox(height: 48), 
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Water Progress', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600, color: const Color(0x99FFFFFF))),
                      Text('60%', style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 8,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: 0.6,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions(bool isDesktop) {
    List<Widget> actions = [
      _buildActionCard(Icons.medication_outlined, 'Medicines'),
      _buildActionCard(Icons.event_available_outlined, 'Appointments'),
      _buildActionCard(Icons.history_edu_outlined, 'Health Logs'),
      _buildActionCard(Icons.analytics_outlined, 'E-Reports'),
    ];
    
    return isDesktop
        ? Row(children: actions.map((a) => Expanded(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 12), child: a))).toList())
        : GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: actions,
          );
  }

  Widget _buildActionCard(IconData icon, String label) {
    return StatefulBuilder(
      builder: (context, setState) {
        bool isHovered = false;
        return MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            transform: isHovered ? (Matrix4.identity()..translate(0.0, -4.0)) : Matrix4.identity(),
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: isHovered ? const Color(0x4D0F172A) : const Color(0x33C6C6CD)),
              boxShadow: isHovered ? const [BoxShadow(color: Color(0x0D0F172A), blurRadius: 20, offset: Offset(0, 10))] : [],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: isHovered ? const Color(0xFF0F172A) : const Color(0xFFE5EEFF),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(icon, size: 28, color: isHovered ? Colors.white : const Color(0xFF45464D)),
                ),
                const SizedBox(height: 20),
                Text(
                  label,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isHovered ? const Color(0xFF0F172A) : const Color(0xFF45464D),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  Widget _buildScheduleSection(bool isDesktop) {
    return Container(
      padding: EdgeInsets.all(isDesktop ? 48 : 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: const Color(0x1AC6C6CD)),
        boxShadow: const [BoxShadow(color: Color(0x05000000), blurRadius: 10, offset: Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('Daily Schedule', style: GoogleFonts.sourceSerif4(fontSize: isDesktop ? 32 : 24, fontWeight: FontWeight.w600, color: const Color(0xFF0B1C30))),
                  const SizedBox(width: 16),
                  Container(width: 6, height: 6, decoration: const BoxDecoration(color: Color(0x4D0F172A), shape: BoxShape.circle)),
                  const SizedBox(width: 16),
                  Text('Thursday, Oct 24', style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500, color: const Color(0xFF45464D))),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.calendar_month_outlined, color: Color(0xFF45464D)),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 48),
          _buildTaskItem(
            isDesktop: isDesktop,
            time: '08:00',
            meridiem: 'AM',
            icon: Icons.medication_outlined,
            iconBg: const Color(0x4DDBE4EA),
            title: 'Metformin • 500mg',
            subtitle: 'Post-meal dosage for glycemic control',
            trailing: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0x4DC6C6CD)),
              ),
              child: const Icon(Icons.check, color: Color(0xFFC6C6CD), size: 20),
            ),
          ),
          const SizedBox(height: 16),
          _buildTaskItem(
            isDesktop: isDesktop,
            time: '10:30',
            meridiem: 'AM',
            icon: Icons.medical_services_outlined,
            iconBg: const Color(0x0D0F172A),
            title: 'Dr. Sarah Wilson',
            subtitle: 'Cardiology • Quarterly progress review',
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 4),
                    boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
                    image: const DecorationImage(
                      image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuBrOXed1kaynVI3xq9l6enEIBrslVQhUVSMndgLMwqW6_ucK1xU3P4C1VMxY5H5GTKwu7xaFYL9G8TTCsQI4_2tPgb0kloNmY0Bv8s2dF7W3MI5we1Pm_YN2oK-lWnLSvqjHLrlSVzBvLA-jCGFWdEcBlG6xnOwyNWFVZ1imWjWI3_D5R_837rsm-b4xFc_H3SXQ7mhntM2ASoPr4KmTlzPT4PrL5HDcDkHa7J9Te9rqcxDa1lZG_YVLw'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE5EEFF),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(Icons.location_on_outlined, color: Color(0xFF0F172A), size: 18),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Center(
            child: TextButton.icon(
              onPressed: () {},
              icon: Text('View 3 remaining tasks', style: GoogleFonts.inter(color: const Color(0xFF45464D), fontSize: 14, fontWeight: FontWeight.w500)),
              label: const Icon(Icons.expand_more, color: Color(0xFF45464D), size: 18),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskItem({
    required bool isDesktop,
    required String time,
    required String meridiem,
    required IconData icon,
    required Color iconBg,
    required String title,
    required String subtitle,
    required Widget trailing,
  }) {
    return Container(
      padding: EdgeInsets.all(isDesktop ? 24 : 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.transparent),
      ),
      child: Row(
        children: [
          Container(
            width: isDesktop ? 100 : 80,
            decoration: const BoxDecoration(
              border: Border(right: BorderSide(color: Color(0x33C6C6CD))),
            ),
            padding: EdgeInsets.only(right: isDesktop ? 32 : 16),
            child: Column(
              children: [
                Text(time, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold, color: const Color(0xFF0B1C30))),
                Text(meridiem, style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600, color: const Color(0x9945464D))),
              ],
            ),
          ),
          SizedBox(width: isDesktop ? 32 : 16),
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: const Color(0xFF0F172A)),
          ),
          SizedBox(width: isDesktop ? 24 : 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w600, color: const Color(0xFF0B1C30))),
                const SizedBox(height: 4),
                Text(subtitle, style: GoogleFonts.inter(fontSize: 14, color: const Color(0xFF45464D))),
              ],
            ),
          ),
          if (isDesktop) trailing,
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Opacity(
      opacity: 0.5,
      child: Column(
        children: [
          ColorFiltered(
            colorFilter: const ColorFilter.matrix([
              0.2126, 0.7152, 0.0722, 0, 0,
              0.2126, 0.7152, 0.0722, 0, 0,
              0.2126, 0.7152, 0.0722, 0, 0,
              0,      0,      0,      1, 0,
            ]),
            child: Image.network(
              'https://lh3.googleusercontent.com/aida/AP1WRLtvdrwSO9VI03H7_G7Fd-wtM3mEj_WlqFM29j4TRRa65uPjIFcHe9a4pUX9c9vz9iSC-zcNLzU7pg6k1qC5FOLQJGIK4c813fcd1PHHt9pXx6cxw-lkbsQqqCjRBeAczJ629gePAiqv8QfOPmLawdb2DdOIm7bET316p7LrbUGcgpIj1xuk0l7UsZEn06n5mJeM21_KRcMpCLdBdxvzVBL4EbcdTEDj1GWJi_FDlBw6pIY-ubCVFCwmEdoc',
              height: 32,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.favorite, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 16),
          Text('POWERING PRECISION WELLNESS', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600, color: const Color(0xFF45464D), letterSpacing: 3.0)),
        ],
      ),
    );
  }
}
