import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String githubUrl;
  final String tacktools;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.githubUrl,
    required this.tacktools,
  });

  Future<void> _launchUrl(BuildContext context) async {
    final Uri url = Uri.parse(githubUrl);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $githubUrl')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get the device's physical size
    final mq = MediaQuery.of(context);
    final bool isMobile = mq.size.shortestSide < 600;

    return Card(
      margin: EdgeInsets.symmetric(
        vertical: isMobile ? 8 : 16,
        horizontal: isMobile ? 8 : mq.size.width > 900 ? 50 : 32,
      ),
      color: Colors.black.withValues(alpha: 0.8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile
              ? 25
              : mq.size.width > 900
                  ? 50
                  : 32,
          vertical: isMobile ? 20 : 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.robotoFlex(
                color: Colors.white,
                height: 1.5,
                fontSize: Theme.of(context).textTheme.displaySmall!.fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "TechStack :",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  tacktools,
                  style: TextStyle(
                    
                    fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
                    color: const Color.fromARGB(255, 206, 206, 206),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: GoogleFonts.robotoSerif(
                color: Colors.white,
                  fontSize:
                      Theme.of(context).textTheme.headlineSmall!.fontSize),
            ),
            const SizedBox(height: 8),
            TextButton.icon(
              onPressed: () => _launchUrl(context),
              icon: const Icon(Icons.open_in_new, color: Colors.amber,),
              label: const Text('View on GitHub',
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
