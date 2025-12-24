import 'package:flutter/material.dart';

class AboutWindow extends StatelessWidget {
  const AboutWindow({super.key});

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
              'About Alba',
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
            
            // Bio paragraphs
            const Text(
              'Welcome to my digital portfolio. I\'m a senior software engineer '
              'specializing in Mobile development, Fintech and '
              'creating exceptional user experiences.',
              style: TextStyle(
                fontFamily: 'VT323',
                fontSize: 18,
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
              'I\'m a product-first Engineer and an active speaker in the community '
              'I love to share  my knowledge in conferences like FlutterCon/NextApp and meetups. '
              'When I am not coding, I love to take analogic photography, travel and read books. ',
              style: TextStyle(
                fontFamily: 'VT323',
                fontSize: 18,
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
}
