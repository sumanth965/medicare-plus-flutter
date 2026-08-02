import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class MainShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainShell({super.key, required this.navigationShell});

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FF),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isDesktop = constraints.maxWidth > 900;
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isDesktop) _buildSidebar(context),
              Expanded(
                child: Column(
                  children: [
                    _buildHeader(context, !isDesktop),
                    Expanded(
                      child: navigationShell,
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      ),
      drawer: LayoutBuilder(
        builder: (context, constraints) {
           return constraints.maxWidth <= 900 ? Drawer(child: _buildSidebar(context)) : const SizedBox.shrink();
        }
      ),
    );
  }

  Widget _buildSidebar(BuildContext context) {
    return Container(
      width: 320,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(right: BorderSide(color: Color(0x4DC6C6CD))),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            'https://lh3.googleusercontent.com/aida/AP1WRLtvdrwSO9VI03H7_G7Fd-wtM3mEj_WlqFM29j4TRRa65uPjIFcHe9a4pUX9c9vz9iSC-zcNLzU7pg6k1qC5FOLQJGIK4c813fcd1PHHt9pXx6cxw-lkbsQqqCjRBeAczJ629gePAiqv8QfOPmLawdb2DdOIm7bET316p7LrbUGcgpIj1xuk0l7UsZEn06n5mJeM21_KRcMpCLdBdxvzVBL4EbcdTEDj1GWJi_FDlBw6pIY-ubCVFCwmEdoc',
            height: 48,
            errorBuilder: (context, error, stackTrace) => Text('Meditech', style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.bold, color: const Color(0xFF0F172A))),
          ),
          const SizedBox(height: 24),
          Container(
            height: 1,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0x80C6C6CD), Colors.transparent],
              )
            )
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView(
              children: [
                _buildNavItem(Icons.dashboard_outlined, 'Dashboard', index: 0, context: context),
                _buildNavItem(Icons.medication_outlined, 'Medicines', index: 1, context: context),
                _buildNavItem(Icons.calendar_today_outlined, 'Appointments', index: 2, context: context),
                _buildNavItem(Icons.monitor_heart_outlined, 'Health Vitals', index: 3, context: context),
                _buildNavItem(Icons.description_outlined, 'Medical Reports', index: 4, context: context),
                _buildNavItem(Icons.settings_outlined, 'Settings', index: 5, context: context),
              ],
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                context.push('/emergency');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE11D48),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 8,
                shadowColor: const Color(0xFFF43F5E).withValues(alpha: 0.5),
              ),
              icon: const Icon(Icons.emergency),
              label: Text('SOS ASSISTANCE', style: GoogleFonts.inter(fontWeight: FontWeight.bold, letterSpacing: 1.5)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, {required int index, required BuildContext context}) {
    bool isActive = navigationShell.currentIndex == index;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF0F172A) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        boxShadow: isActive ? [
          BoxShadow(color: const Color(0xFF0F172A).withValues(alpha: 0.2), blurRadius: 10, offset: const Offset(0, 4))
        ] : null,
      ),
      child: ListTile(
        leading: Icon(icon, color: isActive ? Colors.white : const Color(0xFF45464D)),
        title: Text(
          label,
          style: GoogleFonts.inter(
            color: isActive ? Colors.white : const Color(0xFF45464D),
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
            fontSize: 14,
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        hoverColor: const Color(0xFFE5EEFF),
        onTap: () {
          _onTap(index);
          if (Scaffold.of(context).isDrawerOpen) {
            Scaffold.of(context).closeDrawer();
          }
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool showMenu) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
        child: Container(
          height: 96,
          padding: EdgeInsets.symmetric(horizontal: showMenu ? 24 : 64),
          decoration: const BoxDecoration(
            color: Color(0x99F8F9FF),
            border: Border(bottom: BorderSide(color: Color(0x33C6C6CD))),
          ),
          child: Row(
            children: [
              if (showMenu) ...[
                 IconButton(icon: const Icon(Icons.menu), onPressed: () => Scaffold.of(context).openDrawer()),
                 const SizedBox(width: 16),
              ],
              Expanded(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0x80E5EEFF),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: Color(0xFF76777D)),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            style: GoogleFonts.inter(),
                            decoration: InputDecoration(
                              hintText: 'Search health records, doctors, or labs...',
                              hintStyle: GoogleFonts.inter(color: const Color(0xFF76777D), fontSize: 14),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 32),
              Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.notifications_outlined, color: Color(0xFF45464D)),
                    onPressed: () {},
                  ),
                  Positioned(
                    right: 12,
                    top: 12,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: const Color(0xFFBA1A1A),
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFFF8F9FF), width: 2),
                      ),
                    ),
                  ),
                ],
              ),
              if (!showMenu) ...[
                const SizedBox(width: 16),
                Container(width: 1, height: 40, color: const Color(0x4DC6C6CD)),
                const SizedBox(width: 24),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Alex Morgan', style: GoogleFonts.inter(color: const Color(0xFF0B1C30), fontWeight: FontWeight.w500, fontSize: 14)),
                    Text('ID: 49201 • Premium Plan', style: GoogleFonts.inter(color: const Color(0xB345464D), fontSize: 12)),
                  ],
                ),
              ],
              const SizedBox(width: 16),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0x1A0F172A), width: 2),
                  boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
                  image: const DecorationImage(
                    image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuBNKKT4PofwcwuyBoFCLGzyXcBZdnQ5D6BWGhKyqY09QNZ5gIolEbfLs2UDGAo2Tgq6pks0H2LsOOoyljv9O9TOcr-ooG_g0MOH_F84CiXMj_rPndSIIatljl6bNSMh6ZvGV_SEtrUmsx1anN0m3ZR2SEpnpg-S_x64_B_EaDft3QfD-RBqX6-QKo1mC2Yej8AbLMkIOAAVapSyUpKUizFxoB__A55oLSav0eoGvUWEHUpjwNKJ0L84xA'),
                    fit: BoxFit.cover,
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
