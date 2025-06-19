import 'package:am_dev/widgets/contactinfo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/navbar.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage>
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

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final double width = mq.size.width;
    final bool isMobile = width < 600;
    final bool isTablet = width >= 600 && width < 1024;

    EdgeInsets contentPadding;
    if (isMobile) {
      contentPadding = const EdgeInsets.symmetric(horizontal: 12, vertical: 16);
    } else if (isTablet) {
      contentPadding = const EdgeInsets.symmetric(horizontal: 100, vertical: 20);
    } else {
      contentPadding =
          const EdgeInsets.symmetric(horizontal: 100, vertical: 20);
    }

    Widget contactCard = Container(
      padding: EdgeInsets.all(isMobile ? 16 : 28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(isMobile ? 16 : 24),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: isMobile ? 8 : 18,
            offset: Offset(0, isMobile ? 4 : 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.mail_outline_rounded,
                  color: Color(0xFF6A82FB), size: 32),
              SizedBox(width: 10),
              Text(
                'Let\'s Connect!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF22223B),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          const Text(
            'Let’s connect for opportunities to build and grow together.',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF4A4E69),
            ),
          ),
          const SizedBox(height: 24),
          ContactInfo(
            linkedin: 'https://www.linkedin.com/in/abhishek-maurya-a3452b230',
            github: 'https://github.com/ABHISHEK0319?tab=repositories',
            
          ),
        ],
      ),
    );

    Widget avatarCard = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: isMobile ? 100 : 180,
          height: isMobile ? 100 : 180,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Color(0xFF6A82FB), Color(0xFFFC5C7D)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Image.asset(
            "assets/profile.png",
            fit: BoxFit.fitHeight,
            width: isMobile ? 80 : 160,
            
          ),
        ),
        const SizedBox(height: 18),
        Text(
          'Abhishek Maurya',
          style: GoogleFonts.notoSans(
            fontSize: mq.size.width > 900 ? 24 : 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Flutter Developer | Mobile App Enthusiast',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[700],
          ),
        ),
      ],
    );

    return Scaffold(
      backgroundColor: const Color(0xFFEAF0FB),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: Stack(
            children: [
              // Decorative background circle
              Positioned(
                top: -120,
                right: -120,
                child: Container(
                  width: 260,
                  height: 260,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Color(0xFF6A82FB), Color(0xFFFC5C7D)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: contentPadding,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: mq.size.height -
                          contentPadding.top -
                          contentPadding.bottom,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NavBar(),
                        const SizedBox(height: 30),
                        LayoutBuilder(
                          builder: (context, constraints) {
                            if (isMobile) {
                              // Mobile: Stack vertically
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  avatarCard,
                                  const SizedBox(height: 24),
                                  contactCard,
                                ],
                              );
                            } else {
                              // Tablet/Desktop: Side by side
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: contactCard,
                                  ),
                                  const SizedBox(width: 40),
                                  Expanded(
                                    flex: 1,
                                    child: Center(child: avatarCard),
                                  ),
                                ],
                              );
                            }
                          },
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
    );
  }
}
