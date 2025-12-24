import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants/text_styles.dart';
import '../../core/constants/app_constants.dart';

/// Work/Experience window content
///
/// Displays professional experience, featured projects, technical skills,
/// and provides access to downloadable CV/resume.
///
/// **Content Sections:**
/// - Professional experience timeline
/// - Featured projects with technologies
/// - Technical skills list
/// - CV/Resume download links
///
/// **Responsive Design:**
/// Adapts layout and font sizes for mobile devices.
class WorkWindow extends StatelessWidget {
  const WorkWindow({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < AppConstants.mobileBreakpoint;

    return Container(
      color: Colors.black,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(isMobile ? 12 : 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            Row(
              children: [
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
                const SizedBox(width: 20),
                Image.asset(
                  'assets/images/printer-gif-icon.gif',
                  width: 48,
                  height: 48,
                  fit: BoxFit.contain,
                ),
              ],
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
              'Lead Senior Software Engineer — Cino (Fintech)',
              'Jun 2024 - Present',
              'Leading end-to-end delivery for core payments experiences (architecture, execution, and quality) in a Flutter codebase at scale. '
                  'Own technical strategy for high-risk surfaces like Apple Pay, improving reliability, '
                  'debuggability and testability of the app. Partner with Product/Design/Backend on roadmap and system contracts, and keep release velocity high '
                  'through CI/CD automation (Fastlane, GitHub Actions, Firebase Distribution) and strong engineering standards.',
            ),

            _buildExperienceItem(
              'Senior Software Engineer — SeQura (Fintech)',
              'Sep 2023 - May 2024',
              'Delivered and stabilized critical checkout and post-purchase flows (postpone payments, card lifecycle, amortization, and resilient error states) '
                  'with a focus on correctness, observability, and user trust. Led release automation and reduced operational overhead by streamlining pipelines '
                  'with Fastlane + Firebase Distribution. Collaborated closely with Backend to improve GraphQL efficiency and reduce unnecessary network payloads '
                  'to improve perceived performance.',
            ),

            _buildExperienceItem(
              'Senior Software Engineer — Delivery Hero (AdTech & Vendor Tech)',
              'Oct 2017 - Sep 2022',
              'Owned multi-country Flutter products and shared SDK components used across high-traffic food delivery ecosystems. '
                  'Drove performance work (startup time, UI responsiveness, and app size), strengthened monitoring/analytics, and improved incident response '
                  'by building clearer failure modes and better tooling. Mentored engineers, influenced technical direction across teams, and shipped '
                  'user-facing features under high reliability and scalability constraints.',
            ),

            _buildExperienceItem(
              'Software Engineer — theBASE FOL Group GmbH',
              'Feb 2016 - Oct 2016',
              'Built a production app from the ground up, establishing strong foundations early: architecture conventions, testing strategy, '
                  'and CI-friendly workflows. Increased test coverage from 0% → 90% and improved maintainability by standardizing patterns for navigation, '
                  'state management, and UI components. Worked directly with stakeholders to translate product needs into high-quality releases.',
            ),

            _buildExperienceItem(
              'Software Engineering Intern — Ubiqum Code Academy',
              'Sep 2015 - Jan 2016',
              'Built full-stack projects in React + MongoDB, practicing clean APIs, data modeling, and iterative delivery. '
                  'Gained hands-on experience with Agile execution, code reviews, and deploying customer-facing features with attention to performance and usability.',
            ),

            const SizedBox(height: 24),


            _buildAppsTable(isMobile),

            const SizedBox(height: 24),

            _buildActionButton(
              'View GitHub',
              'assets/images/github_icon.png',
              () async {
                final url = Uri.parse('https://github.com/PeachBlack-Alba');
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
                  fontSize: 20,
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
                  fontSize: 18,
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
              fontSize: 20,
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
              fontSize: 18,
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
            children: technologies
                .map((tech) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF4AF626), width: 1),
                        color: Colors.transparent,
                      ),
                      child: Text(
                        tech,
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
                    ))
                .toList(),
          ),
        ],
      ),
    );
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
                  fontSize: isMobile ? 18 : 20,
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

  Widget _buildAppsTable(bool isMobile) {
    final apps = [
      {'name': 'Cino', 'url': 'https://apps.apple.com/es/app/cino-pay-together/id6443988744'},
      {'name': 'seQura', 'url': 'https://play.google.com/store/apps/details?id=com.sequra.app&hl=es_BO&pli=1'},
      {'name': 'Talabat', 'url': 'https://www.talabat.com/uae'},
      {'name': 'Foodora', 'url': 'https://external.foodpanda.de/'},
      {'name': 'PedidosYa', 'url': 'https://www.pedidosya.com/'},
      {'name': 'FoodPanda', 'url': 'https://www.foodpanda.com/'},
      {'name': 'Yemeksepeti', 'url': 'https://www.yemeksepeti.com/'},
      {'name': 'PandaMerchant', 'url': 'https://play.google.com/store/apps/details?id=com.growsari.foodpanda&hl=en'},
      {'name': 'Foodora Merchant', 'url': 'https://merchant.foodora.hu/en'},
      {'name': 'Talabat Merchant', 'url': 'https://tlife.talabat.com/'},
      {'name': 'PedidosYa Merchant', 'url': 'https://merchant.pedidosya.com.ar/pages/activacion-de-cuenta'},
      {'name': 'The Base', 'url': 'https://www.jointhebase.co/location'},
    ];

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF4AF626), width: 2),
        color: Colors.black,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Table header
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 10 : 14,
              vertical: 8,
            ),
            decoration: const BoxDecoration(
              color: Color(0xFF4AF626),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: isMobile ? 2 : 3,
                  child: Text(
                    'APP NAME',
                    style: TextStyle(
                      fontFamily: 'VT323',
                      fontSize: isMobile ? 18 : 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  flex: isMobile ? 1 : 2,
                  child: Center(
                    child: Text(
                      'STATUS',
                      style: TextStyle(
                        fontFamily: 'VT323',
                        fontSize: isMobile ? 18 : 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Table rows
          ...apps.asMap().entries.map((entry) {
            final index = entry.key;
            final app = entry.value;
            return Container(
              decoration: BoxDecoration(
                color: index.isEven ? Colors.black : const Color(0xFF0A0A0A),
                border: const Border(
                  bottom: BorderSide(color: Color(0xFF4AF626), width: 1),
                ),
              ),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () async {
                    final url = Uri.parse(app['url']!);
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url, mode: LaunchMode.externalApplication);
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 8 : 12,
                      vertical: 8,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: isMobile ? 2 : 3,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                '> ',
                                style: TextStyle(
                                  fontFamily: 'VT323',
                                  fontSize: 18,
                                  color: Color(0xFF4AF626),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  app['name']!,
                                  style: TextStyle(
                                    fontFamily: 'VT323',
                                    fontSize: isMobile ? 16 : 18,
                                    color: Colors.white,
                                    decoration: TextDecoration.underline,
                                    shadows: const [
                                      Shadow(
                                        offset: Offset(1, 1),
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: isMobile ? 80 : 100,
                          child: Center(
                            child: Text(
                              '✅ DONE',
                              style: TextStyle(
                                fontFamily: 'VT323',
                                fontSize: isMobile ? 16 : 18,
                                color: const Color(0xFF4AF626),
                                fontWeight: FontWeight.bold,
                                shadows: const [
                                  Shadow(
                                    offset: Offset(1, 1),
                                    color: Colors.black,
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
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
