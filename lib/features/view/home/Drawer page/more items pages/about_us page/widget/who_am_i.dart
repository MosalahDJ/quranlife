import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WhoAmI extends StatelessWidget {
  const WhoAmI({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            child: Text(
              "who_am_i".tr,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Profile Section
          Container(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Column(
              children: [
                // Profile Image
                Hero(
                  tag: 'profile-image',
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage(
                        "lib/core/assets/images/more_page_images/me.png",
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Name and Title
                Text(
                  "developer_name".tr,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "developer_title".tr,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          // Social Media Grid
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            padding: const EdgeInsets.all(16),
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: [
              _buildSocialButton(
                "Facebook",
                "Djehel Mohamed Salah",
                "lib/core/assets/images/login_images/login_button_image/Facebook.png",
              ),
              _buildSocialButton(
                "Instagram",
                "moh.medsalah",
                "lib/core/assets/images/login_images/login_button_image/Instagram.png",
              ),
              _buildSocialButton(
                "LinkedIn",
                "Djehel Mohamed Salah",
                "lib/core/assets/images/login_images/login_button_image/LinkedIn.png",
              ),
              _buildSocialButton(
                "Twitter",
                "Djehel Mohamed Salah",
                "lib/core/assets/images/login_images/login_button_image/X.png",
              ),
            ],
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildSocialButton(
      String platform, String account, String imageAsset) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(12),
      color: const Color(0xFF26C6DA),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imageAsset,
                height: 32,
                width: 32,
              ),
              const SizedBox(height: 8),
              Text(
                "social_$platform".tr.toLowerCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
