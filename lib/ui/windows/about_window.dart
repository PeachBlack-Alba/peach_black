import 'package:flutter/material.dart';
import '../retro/retro_button.dart';

/// About window content for Alba's portfolio
class AboutWindow extends StatelessWidget {
  const AboutWindow({super.key});

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
              'About Alba',
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
            
            // Bio paragraphs
            const Text(
              'Welcome to my digital portfolio. I\'m a passionate developer '
              'specializing in Flutter development, web technologies, and '
              'creating exceptional user experiences.',
              style: TextStyle(
                fontFamily: 'VT323',
                fontSize: 16,
                color: Colors.white,
                height: 1.5,
                shadows: [
                  Shadow(
                    offset: Offset(1, 1),
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            const Text(
              'With expertise in modern development frameworks and a keen '
              'eye for design, I build applications that are both functional '
              'and visually appealing. My work spans across mobile, web, and '
              'desktop platforms.',
              style: TextStyle(
                fontFamily: 'VT323',
                fontSize: 16,
                color: Colors.white,
                height: 1.5,
                shadows: [
                  Shadow(
                    offset: Offset(1, 1),
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Skills section
            const Text(
              'Technical Skills:',
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
            
            const SizedBox(height: 12),
            
            ..._buildSkillList([
              '• Flutter & Dart Development',
              '• Web Technologies (HTML, CSS, JS)',
              '• UI/UX Design & Prototyping',
              '• Cross-platform Development',
              '• Problem Solving & Debugging',
              '• Version Control (Git)',
            ]),
            
            const SizedBox(height: 24),
            
            // Action buttons
            Row(
              children: [
                RetroButton(
                  text: 'Open CV',
                  onPressed: () {
                    // TODO: Open CV link
                  },
                  fontSize: 14,
                  fontFamily: 'VT323',
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                ),
                
                const SizedBox(width: 16),
                
                RetroButton(
                  text: 'GitHub',
                  onPressed: () {
                    // TODO: Open GitHub link
                  },
                  fontSize: 14,
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
  
  List<Widget> _buildSkillList(List<String> skills) {
    return skills.map((skill) => Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        skill,
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
    )).toList();
  }
}
