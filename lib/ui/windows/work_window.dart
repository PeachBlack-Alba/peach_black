import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WorkWindow extends StatelessWidget {
  const WorkWindow({super.key});

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
              'My Work',
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
            
            // Experience section
            const Text(
              'Professional Experience:',
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
            
            _buildExperienceItem(
              'Flutter Developer',
              '2023 - Present',
              'Developing cross-platform mobile and web applications using Flutter and Dart. '
              'Specializing in UI/UX design and performance optimization.',
            ),
            
            _buildExperienceItem(
              'Frontend Developer',
              '2022 - 2023',
              'Built responsive web applications using modern JavaScript frameworks. '
              'Collaborated with design teams to create pixel-perfect user interfaces.',
            ),
            
            _buildExperienceItem(
              'Junior Developer',
              '2021 - 2022',
              'Started my journey in software development, learning various technologies '
              'and contributing to team projects while building foundational skills.',
            ),
            
            const SizedBox(height: 24),
            
            // Projects section
            const Text(
              'Featured Projects:',
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
            
            _buildProjectItem(
              'Retro Portfolio',
              'A 90s DOS-style portfolio built with Flutter. Features CRT effects, '
              'typewriter animations, and draggable windows for an authentic retro experience.',
              ['Flutter', 'Dart', 'Custom Painters', 'Animations'],
            ),
            
            _buildProjectItem(
              'E-Commerce App',
              'Cross-platform shopping application with real-time inventory management, '
              'payment integration, and admin dashboard.',
              ['Flutter', 'Firebase', 'Stripe API', 'State Management'],
            ),
            
            _buildProjectItem(
              'Task Manager',
              'Productivity app with drag-and-drop functionality, team collaboration features, '
              'and deadline tracking with notifications.',
              ['Flutter', 'SQLite', 'Local Notifications', 'Custom UI'],
            ),
            
            const SizedBox(height: 24),
            
            // Skills section
            const Text(
              'Technical Skills:',
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
            
            ..._buildSkillList([
              '• Flutter & Dart Development',
              '• Mobile App Development (iOS/Android)',
              '• Web Development (HTML, CSS, JavaScript)',
              '• UI/UX Design & Prototyping',
              '• State Management (Provider, Bloc)',
              '• Database Design (SQLite, Firebase)',
              '• API Integration & REST Services',
              '• Version Control (Git, GitHub)',
              '• Agile Development Methodologies',
            ]),
            
            const SizedBox(height: 24),
            
            // Download CV section with printer gif
            const Text(
              'Download CV:',
              style: TextStyle(
                fontFamily: 'VT323',
                fontSize: 18,
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
            
            const SizedBox(height: 16),
            
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () async {
                  final url = Uri.parse('https://docs.google.com/document/d/13_7UvOE_gPIbA9gFBtiTanUEQJMbJ4H68kXFtysIX1Y/edit?usp=sharing');
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF4AF626), width: 2),
                    color: Colors.transparent,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/printer-gif-icon.gif',
                        width: 48,
                        height: 48,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Download Resume',
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
                          Text(
                            'Click to view/download my CV',
                            style: TextStyle(
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
                    ],
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // GitHub button
            _buildActionButton(
              'View GitHub',
              'assets/images/contact_github.png',
              () async {
                final url = Uri.parse('https://github.com/albatorresrodriguez');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
              isMobile,
            ),
            
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
  
  Widget _buildExperienceItem(String title, String period, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'VT323',
                  fontSize: 18,
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
              const Spacer(),
              Text(
                period,
                style: const TextStyle(
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
          const SizedBox(height: 4),
          Text(
            description,
            style: const TextStyle(
              fontFamily: 'VT323',
              fontSize: 16,
              color: Colors.white70,
              height: 1.4,
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
    );
  }
  
  Widget _buildProjectItem(String title, String description, List<String> technologies) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'VT323',
              fontSize: 18,
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
          const SizedBox(height: 4),
          Text(
            description,
            style: const TextStyle(
              fontFamily: 'VT323',
              fontSize: 16,
              color: Colors.white70,
              height: 1.4,
              shadows: [
                Shadow(
                  offset: Offset(1, 1),
                  color: Colors.black,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: technologies.map((tech) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF4AF626), width: 1),
                color: Colors.transparent,
              ),
              child: Text(
                tech,
                style: const TextStyle(
                  fontFamily: 'VT323',
                  fontSize: 12,
                      color: Color(0xFF4AF626),
                  shadows: [
                    Shadow(
                      offset: Offset(1, 1),
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }
  
  List<Widget> _buildSkillList(List<String> skills) {
    return skills.map((skill) => Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        skill,
        style: const TextStyle(
          fontFamily: 'VT323',
          fontSize: 18,
                      color: Color(0xFF4AF626),
          shadows: [
            Shadow(
              offset: Offset(1, 1),
              color: Colors.black,
            ),
          ],
        ),
      ),
    )).toList();
  }
  
  Widget _buildActionButton(String text, String iconPath, VoidCallback onPressed, bool isMobile) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 15 : 20,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
            color: Colors.transparent,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                iconPath,
                width: 24,
                height: 24,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 12),
              Text(
                text,
                style: TextStyle(
                  fontFamily: 'VT323',
                  fontSize: isMobile ? 16 : 18,
                  color: Colors.white,
                  shadows: const [
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
      ),
    );
  }
}

