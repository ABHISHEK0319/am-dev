import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:html' as html;

class ContactInfo extends StatelessWidget {
  final String linkedin;
  final String github;


  const ContactInfo({
    super.key,
    required this.linkedin,
    required this.github,

  });

  // General method for launching any url
  Future<void> _launchAnyUrl(BuildContext context, String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $urlString')),
      );
    }
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
      contentPadding = const EdgeInsets.symmetric(horizontal: 48, vertical: 32);
    } else {
      contentPadding = const EdgeInsets.symmetric(horizontal: 10, vertical: 10);
    }

    return Stack(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ...existing code...
                Row(
                  children: [
                    const Text(
                      '📧 Email ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon:
                          const Icon(Icons.copy, size: 18, color: Colors.blue),
                      tooltip: 'Copy Email',
                      onPressed: () async {
                        await Clipboard.setData(ClipboardData(
                            text: "abhishekmaurya1219@gmail.com"));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Email copied to clipboard')),
                        );
                      },
                    ),
                  ],
                ),

                Row(
                  children: [
                    const Text(
                      '💼 LinkedIn: ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon:
                          const Icon(Icons.link, size: 18, color: Colors.blue),
                      tooltip: 'Open LinkedIn',
                      onPressed: () async {
                        _launchAnyUrl(context, linkedin);
                        await Clipboard.setData(ClipboardData(text: linkedin));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Clicked LinkedIn link')),
                        );
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      '💻 GitHub: ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon:
                          const Icon(Icons.link, size: 18, color: Colors.blue),
                      tooltip: 'Open GitHub',
                      onPressed: () async {
                        _launchAnyUrl(context, github);
                        await Clipboard.setData(ClipboardData(text: github));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Clicked GitHub link')),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                  ),
                  onPressed: () {
                    const resumeUrl =
                        'Abhishek_s_Resume_m.pdf'; // web folder ka path
                    if (kIsWeb) {
                      // Web: force download
                      html.AnchorElement anchor = html.AnchorElement(
                          href: resumeUrl)
                        ..setAttribute('download', 'Abhishek_s_Resume_m.pdf')
                        ..click();
                    } else {
                      // Mobile/Desktop: open in browser (ya url_launcher ka use karein)
                      _launchAnyUrl(context, resumeUrl);
                    }
                  },
                  child: const Text(
                    '📄 Download Resume',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
