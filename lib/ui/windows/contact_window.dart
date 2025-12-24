import 'package:flutter/material.dart';
import '../retro/retro_button.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactWindow extends StatelessWidget {
  const ContactWindow({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Container(
      color: Colors.black,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(isMobile ? 12 : 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            Text(
              'Get In Touch',
              style: TextStyle(
                fontFamily: 'VT323',
                fontSize: isMobile ? 22 : 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                shadows: const [
                  Shadow(
                    offset: Offset(1, 1),
                    color: Colors.black,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Contact info section
            const Text(
              'Contact Information:',
              style: TextStyle(
                fontFamily: 'VT323',
                fontSize: 18,
                color: Color(0xFF4AF626),
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    offset: Offset(1, 1),
                    color: Colors.black,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            _buildContactItem(
              Icons.email,
              'Email',
              'albatdr@gmail.com',
              'Send me an email',
            ),

            const SizedBox(height: 24),

            // Social links section
            const Text(
              'Social & Professional:',
              style: TextStyle(
                fontFamily: 'VT323',
                fontSize: 18,
                color: Color(0xFF4AF626),
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    offset: Offset(1, 1),
                    color: Colors.black,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            _buildSocialLink(
              'GitHub',
              'github.com/albatorresrodriguez',
              'View my code repositories',
              iconPath: 'assets/images/github_icon.png',
              url: 'https://github.com/PeachBlack-Alba',
            ),

            _buildSocialLink(
              'LinkedIn',
              'linkedin.com/in/alba-torres-rodriguez',
              'Connect professionally',
              iconPath: 'assets/images/contact_in.png',
              url: 'https://www.linkedin.com/in/albatorresrodriguez/',
            ),


            const SizedBox(height: 24),

            // Availability section
            const Text(
              'Availability:',
              style: TextStyle(
                fontFamily: 'VT323',
                fontSize: 18,
                color: Color(0xFF4AF626),
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    offset: Offset(1, 1),
                    color: Colors.black,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF4AF626), width: 1),
                color: Colors.transparent,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Currently Available for:',
                    style: TextStyle(
                      fontFamily: 'VT323',
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          offset: Offset(1, 1),
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '• Mobile Development Projects',
                    style: TextStyle(
                      fontFamily: 'VT323',
                      fontSize: 16,
                      color: Colors.white70,
                      shadows: [
                        Shadow(
                          offset: Offset(1, 1),
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '• Mobile App Consulting',
                    style: TextStyle(
                      fontFamily: 'VT323',
                      fontSize: 16,
                      color: Colors.white70,
                      shadows: [
                        Shadow(
                          offset: Offset(1, 1),
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '• Code Reviews & Mentoring',
                    style: TextStyle(
                      fontFamily: 'VT323',
                      fontSize: 16,
                      color: Colors.white70,
                      shadows: [
                        Shadow(
                          offset: Offset(1, 1),
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Action buttons
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                RetroButton(
                  text: 'Send Email',
                  onPressed: () async {
                    final uri = Uri(
                      scheme: 'mailto',
                      path: 'albatdr@gmail.com',
                      queryParameters: {
                        'subject': 'Hello Alba',
                        'body': 'Hi Alba,\n\n',
                      },
                    );

                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri, mode: LaunchMode.externalApplication);
                    }
                  },
                  fontSize: isMobile ? 16 : 18,
                  fontFamily: 'VT323',
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 15 : 20,
                    vertical: 8,
                  ),
                ),
                RetroButton(
                  text: 'Schedule Call',
                  onPressed: () {
                    // TODO: Open calendar/scheduling
                  },
                  fontSize: isMobile ? 16 : 18,
                  fontFamily: 'VT323',
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 15 : 20,
                    vertical: 8,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String label, String value, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF4AF626), width: 1),
              color: Colors.transparent,
            ),
            child: Icon(
              icon,
              color: const Color(0xFF4AF626),
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontFamily: 'VT323',
                    fontSize: 16,
                    color: Color(0xFF4AF626),
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: Offset(1, 1),
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontFamily: 'VT323',
                    fontSize: 16,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: Offset(1, 1),
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                Text(
                  description,
                  style: const TextStyle(
                    fontFamily: 'VT323',
                    fontSize: 14,
                    color: Colors.white70,
                    shadows: [
                      Shadow(
                        offset: Offset(1, 1),
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialLink(
    String platform,
    String handle,
    String description, {
    IconData? icon,
    String? iconPath,
    String? url,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () async {
            if (url != null) {
              final uri = Uri.parse(url);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              }
            }
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white24, width: 1),
              color: Colors.transparent,
            ),
            child: Row(
              children: [
                if (iconPath != null)
                  Image.asset(
                    iconPath,
                    width: 32,
                    height: 32,
                    fit: BoxFit.contain,
                  )
                else if (icon != null)
                  Icon(
                    icon,
                    color: const Color(0xFF4AF626),
                    size: 20,
                  ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        platform,
                        style: const TextStyle(
                          fontFamily: 'VT323',
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              offset: Offset(1, 1),
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        handle,
                        style: const TextStyle(
                          fontFamily: 'VT323',
                          fontSize: 14,
                          color: Color(0xFF4AF626),
                          shadows: [
                            Shadow(
                              offset: Offset(1, 1),
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        description,
                        style: const TextStyle(
                          fontFamily: 'VT323',
                          fontSize: 12,
                          color: Colors.white70,
                          shadows: [
                            Shadow(
                              offset: Offset(1, 1),
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.open_in_new,
                  color: Color(0xFF4AF626),
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
