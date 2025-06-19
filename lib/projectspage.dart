import 'package:am_dev/widgets/listprojcard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/navbar.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );

    // Emphasized decelerate for entering
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get the device's physical size
    final mq = MediaQuery.of(context);
    final bool isMobile = mq.size.shortestSide < 600;

    return Scaffold(
      //backgroundColor: const Color(0xFFF5F7FA),
      backgroundColor: const Color(0xFFEAF0FB),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile
                    ? 12
                    : mq.size.width > 900
                        ? 100
                        : 32,
                vertical: isMobile ? 16 : 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NavBar(),
                  const SizedBox(height: 10),
                  Center(
                    child: Text('🛠️ Projects',
                        style: GoogleFonts.simonetta(
                            fontSize: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .fontSize,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: mq.size.height * 0.05),
                  ...projectCards,
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
