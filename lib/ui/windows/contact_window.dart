import 'package:flutter/material.dart';
import '../retro/retro_button.dart';

class ContactWindow extends StatelessWidget {
  const ContactWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            const Text(
              'Get In Touch',
              style: TextStyle(
                fontFamily: 'VT323',
                fontSize: 24,
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
            
            const SizedBox(height: 20),
            
            // Contact info section
            const Text(
              'Contact Information:',
              style: TextStyle(
                fontFamily: 'VT323',
                fontSize: 18,
                color: Color(0xFF00FFFF),
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
              'alba.torres@example.com',
              'Send me an email',
            ),
            
            _buildContactItem(
              Icons.phone,
              'Phone',
              '+1 (555) 123-4567',
              'Call or text me',
            ),
            
            _buildContactItem(
              Icons.location_on,
              'Location',
              'San Francisco, CA',
              'Based in the Bay Area',
            ),
            
            const SizedBox(height: 24),
            
            // Social links section
            const Text(
              'Social & Professional:',
              style: TextStyle(
                fontFamily: 'VT323',
                fontSize: 18,
                color: Color(0xFF00FFFF),
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
              'github.com/alba-torres',
              'View my code repositories',
              Icons.code,
            ),
            
            _buildSocialLink(
              'LinkedIn',
              'linkedin.com/in/alba-torres',
              'Connect professionally',
              Icons.work,
            ),
            
            _buildSocialLink(
              'Twitter',
              '@alba_dev',
              'Follow for updates',
              Icons.alternate_email,
            ),
            
            _buildSocialLink(
              'Portfolio',
              'alba-torres.dev',
              'Visit my website',
              Icons.web,
            ),
            
            const SizedBox(height: 24),
            
            // Availability section
            const Text(
              'Availability:',
              style: TextStyle(
                fontFamily: 'VT323',
                fontSize: 18,
                color: Color(0xFF00FFFF),
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
                border: Border.all(color: const Color(0xFF00FFFF), width: 1),
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
                    '• Flutter Development Projects',
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
                    '• UI/UX Design Collaboration',
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
            Row(
              children: [
                RetroButton(
                  text: 'Send Email',
                  onPressed: () {
                    // TODO: Open email client
                  },
                  fontSize: 18,
                  fontFamily: 'VT323',
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                ),
                
                const SizedBox(width: 16),
                
                RetroButton(
                  text: 'Schedule Call',
                  onPressed: () {
                    // TODO: Open calendar/scheduling
                  },
                  fontSize: 18,
                  fontFamily: 'VT323',
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
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
              border: Border.all(color: const Color(0xFF00FFFF), width: 1),
              color: Colors.transparent,
            ),
            child: Icon(
              icon,
              color: const Color(0xFF00FFFF),
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
                    color: Color(0xFF00FFFF),
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
  
  Widget _buildSocialLink(String platform, String handle, String description, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            // TODO: Open social link
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white24, width: 1),
              color: Colors.transparent,
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: const Color(0xFF00FFFF),
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
                          color: Color(0xFF00FFFF),
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
                  color: Colors.white54,
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

