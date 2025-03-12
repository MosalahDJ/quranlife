import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/Utils/size_config.dart';
import 'package:project/features/controller/Url%20Luncher%20Controller/url_luncher_controller.dart';

class AboutUsPage extends StatelessWidget {
  AboutUsPage({super.key});
  final UrlLuncherAndSharingController urllunchctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 73, 101),
      appBar: AppBar(
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "about_us".tr,
          style: const TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 1, 73, 101),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section with parallax effect
            const ParallaxHeroSection(),

            // Content Section with cards
            Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    Color.fromARGB(0, 0, 0, 0),
                    Color.fromARGB(255, 0, 0, 0),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFeatureCard(
                      icon: Icons.rocket_launch,
                      title: "our_expertise".tr,
                      description: "expertise_description".tr,
                    ),
                    const SizedBox(height: 16),
                    _buildFeatureCard(
                      icon: Icons.people,
                      title: "our_mission".tr,
                      description: "mission_description".tr,
                    ),
                    const SizedBox(height: 16),
                    _buildFeatureCard(
                      icon: Icons.lightbulb,
                      title: "our_vision".tr,
                      description: "vision_description".tr,
                    ),
                  ],
                ),
              ),
            ),

            Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  colors: [Color.fromARGB(0, 0, 0, 0), Color(0xFF000000)],
                ),
              ),
              child: Column(
                children: [
                  // Social Media section
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: _buildSocialMediaSection(),
                  ),

                  // Contact section
                  Container(
                    margin: const EdgeInsets.all(16),
                    child: ElevatedButton(
                      onPressed: () {
                        urllunchctrl.launchEmail();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF26C6DA),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.mail_outline, color: Colors.white),
                          const SizedBox(width: 8),
                          Text(
                            "send_email".tr,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Team section
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Card(
      color: const Color.fromARGB(255, 0, 22, 47),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 32, color: const Color(0xFF26C6DA)),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialMediaSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "contact_us".tr,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildSocialButton(
              icon: Icons.facebook,
              label: "Facebook",
              onTap: () {
                urllunchctrl.launchurl(
                  "https://web.facebook.com/mohamedsalah.djehel.9",
                );
              },
            ),
            _buildSocialButton(
              icon: Icons.link,
              label: "LinkedIn",
              onTap: () {
                urllunchctrl.launchurl(
                  "https://www.linkedin.com/in/mohamed-salah-djehel-72b740345/",
                );
              },
            ),
            _buildSocialButton(
              icon: Icons.camera_alt,
              label: "Instagram",
              onTap: () {
                urllunchctrl.launchurl(
                  "https://www.instagram.com/moh.medsalah/",
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Icon(icon, size: 32, color: const Color(0xFF26C6DA)),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(fontSize: 12, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class ParallaxHeroSection extends StatelessWidget {
  const ParallaxHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizeconfig.screenheight! * 0.35,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "lib/core/assets/images/background_image/background_image.jpg",
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.7),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "building_future".tr,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.black26,
                        offset: Offset(2, 2),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "mobile_apps".tr,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
