import 'package:am_dev/widgets/glassshape.dart';
import 'package:am_dev/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
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

    // Emphasized easing for entering
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCubicEmphasized,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCubicEmphasized,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget archAvatar({required double size}) {
    return GlassShapesWidget();
  }

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get the device's physical size
    final mq = MediaQuery.of(context);
    final bool isMobile = mq.size.shortestSide < 600;

    return Scaffold(
        backgroundColor: const Color(0xFFFFFDF6),
        // backgroundColor: Colors.white,
        body: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: SingleChildScrollView(
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
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  isMobile
                      ? Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              archAvatar(size: 180),
                              const SizedBox(height: 16),
                              Text(
                                'Hi, \nI am Abhishek Maurya',
                                style: GoogleFonts.notoSans(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Flutter Developer | Mobile App Enthusiast',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[700],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            archAvatar(size: 300),
                            const SizedBox(width: 32),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Hi, \nI am Abhishek Maurya',
                                    style: GoogleFonts.notoSans(
                                      fontSize: mq.size.width > 900 ? 48 : 32,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Flutter Developer | Mobile App Enthusiast',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey[700],
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                  const SizedBox(height: 40),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 16 : 48,
                        vertical: 32,
                      ),
                      child: Card(
                        color: Colors.white,
                        elevation: 8,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(32),
                            top: Radius.circular(8),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 16 : 58,
                            vertical: 32,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '👋 About Me',
                                style: GoogleFonts.robotoFlex(
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .fontSize,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 12),
                              Text(
                                '''Hi, I’m Abhishek Maurya — a Flutter developer who loves building apps that make life easier. My journey started with curiosity for how apps work, and it grew into a passion for turning ideas into real, working solutions.\n\nI focus on creating clean, responsive, and user-friendly mobile apps using Flutter, Dart, and Firebase. Whether I’m working on a group chat app or refining UI/UX, I care about the details and always aim to grow as a developer. \n\nRight now, I’m looking for exciting opportunities to build, learn, and contribute to projects that create real impact.
                                ''',
                                style: GoogleFonts.robotoSerif(
                                  textStyle: TextStyle(
                                    color: Colors.grey[800],
                                    height: 1.5,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Add Snapshots Skill Section
                  const SizedBox(height: 40),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 16 : 48,
                      vertical: 32,
                    ),
                    child: Card(
                      color: Colors.white,
                      elevation: 8,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(32),
                          top: Radius.circular(8),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 16 : 58,
                          vertical: 32,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                '🔧 Skills Snapshot',
                                style: GoogleFonts.robotoFlex(
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .fontSize,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 32),
                            Text(
                              '''• Flutter & Dart, Firebase, Java, UI/UX Design\n• API Integration, Git & GitHub, Android Studio, Visual Studio Code\n• RESTful Services, State Management (Provider, GetX)\n• Responsive Design, Adaptive Deployment, Clean Code\n• Agile Methodologies, Problem Solving, Team Collaboration, Continuous Learning
                              ''',
                              style: GoogleFonts.robotoSerif(
                                textStyle: TextStyle(
                                  color: Colors.grey[800],
                                  height: 2.5,
                                  fontWeight: FontWeight.w400,
                                ),
                                fontSize: 16,
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
          ),
        ));
  }
}
