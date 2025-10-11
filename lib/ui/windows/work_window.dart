import 'package:flutter/material.dart';
import '../retro/retro_button.dart';

class WorkWindow extends StatelessWidget {
  const WorkWindow({super.key});

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
              'My Work',
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
            
            // Experience section
            const Text(
              'Professional Experience:',
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
            
            // Action buttons
            Row(
              children: [
                RetroButton(
                  text: 'View GitHub',
                  onPressed: () {
                    // TODO: Open GitHub link
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
                  text: 'Download CV',
                  onPressed: () {
                    // TODO: Download CV
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
                border: Border.all(color: const Color(0xFF00FFFF), width: 1),
                color: Colors.transparent,
              ),
              child: Text(
                tech,
                style: const TextStyle(
                  fontFamily: 'VT323',
                  fontSize: 12,
                  color: Color(0xFF00FFFF),
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
          color: Color(0xFF00FFFF),
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
}

