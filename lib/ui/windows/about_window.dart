import 'package:flutter/material.dart';
import '../../core/constants/text_styles.dart';
import '../../core/constants/app_constants.dart';

/// About Me window content
/// 
/// Displays personal information, bio, and professional background
/// in a scrollable retro-styled window.
/// 
/// **Content Sections:**
/// - Professional overview
/// - Career background
/// - Personal interests
/// - Skills and technologies
/// - Contact information
/// 
/// **Responsive Design:**
/// Adapts padding and font sizes for mobile devices.
class AboutWindow extends StatelessWidget {
  const AboutWindow({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < AppConstants.mobileBreakpoint;

    return Container(
      color: AppConstants.backgroundColor,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(isMobile ? 12 : AppConstants.spacingLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            Row(
              children: [
                Text(
                  'About me',
                  style: isMobile
                    ? AppTextStyles.withSize(AppTextStyles.headingSmall, 22)
                    : AppTextStyles.headingSmall,
                ),
                const SizedBox(width: 20),
                Image.asset(
                  'assets/gif/sparkles_gif.gif',
                  width: 48,
                  height: 48,
                  fit: BoxFit.contain,
                ),
              ],
            ),

            const SizedBox(height: AppConstants.spacingLarge),

            // Bio paragraphs
            const Text(
              'I\'m a Lead Software Engineer with extensive experience in mobile development, '
              'driven by a strong product mindset and a deep curiosity for building things that solve real-world problems. '
              'The products I\'ve worked on have served millions of users, which has shaped the way I think about scalability, '
              'reliability, and user experience from day one.',
              style: AppTextStyles.bodyLarge,
            ),

            const SizedBox(height: AppConstants.spacingMedium),

            const Text(
              'Throughout my career, I\'ve worked across a wide range of environments—from early-stage startups and fast-growing '
              'scale-ups to large multinational companies—primarily within fintech, food delivery, and logistics. '
              'This variety has given me a broad perspective on engineering challenges, team dynamics, and how to build software '
              'that balances speed, quality, and long-term maintainability.',
              style: AppTextStyles.bodyLarge,
            ),

            const SizedBox(height: AppConstants.spacingMedium),

            const Text(
              'My passion for building started early. As a kid, I was endlessly curious about how things worked, which quickly '
              'turned into an obsession with LEGO—and, slightly less predictably, video games. That curiosity evolved into a love '
              'for creating, experimenting, and problem-solving, and it\'s something I\'ve carried with me ever since.',
              style: AppTextStyles.bodyLarge,
            ),

            const SizedBox(height: AppConstants.spacingMedium),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image
                Center(
                  child: Container(
                    constraints: const BoxConstraints(
                      maxWidth: 260,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Image.asset(
                      'assets/images/small_alba.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // Caption / subtext
                const Center(
                  child: Text(
                    'Figure 1: A real photo of me developing this website ;)',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.caption,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppConstants.spacingMedium),

            const Text(
              'Beyond software, I have a wide range of interests that keep me inspired. I love traveling, cinema, photography, '
              'and I even play the drums. I\'m also an active member of the software community: I mentor other engineers, attend '
              'meetups, and regularly speak at conferences, because sharing knowledge and learning from others is a big part of how I grow.',
              style: AppTextStyles.bodyLarge,
            ),

            const SizedBox(height: AppConstants.spacingMedium),

            const Text(
              'Thanks for taking the time to read about me. I hope you enjoy exploring my portfolio as much as I enjoyed building it. '
              'And if you happen to find an easter egg, let me know on LinkedIn.',
              style: AppTextStyles.bodyLarge,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image
                Center(
                  child: Container(
                    constraints: const BoxConstraints(
                      maxWidth: 260,
                    ),
                    child: Image.asset(
                      'assets/images/alba_not_that_small.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // Caption / subtext
                const Center(
                  child: Text(
                    'Figure 2: A real photo of me now',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.caption,
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppConstants.spacingMedium),

            const Text(
              'If you have any questions or comments, I\'d love to hear from you.'
              'You can reach me through the contact section or by emailing me at albatdr@gmail.com.',
              style: AppTextStyles.bodyLarge,
            ),

            const SizedBox(height: AppConstants.spacingLarge),
          ],
        ),
      ),
    );
  }

  /// Builds a list of skill widgets with accent color styling
  /// 
  /// Each skill is displayed as a text item with the retro accent color.
  List<Widget> _buildSkillList(List<String> skills) {
    return skills
        .map(
          (skill) => Padding(
            padding: const EdgeInsets.only(bottom: AppConstants.spacingSmall / 2),
            child: Text(
              skill,
              style: AppTextStyles.bodyAccent,
            ),
          ),
        )
        .toList();
  }
}
