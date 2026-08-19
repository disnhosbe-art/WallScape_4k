import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(height: 20),

            const Text(
              "  GENERAL",
              style: TextStyle(
                color: Colors.white54,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: () {
                Share.share(
                  'Download my app:\nhttps://play.google.com/store/apps/details?id=com.yourpackage.name',
                );
              },
              child: buildTile(
                Icons.share,
                "Share app",
                "Tell your friends about it",
              ),
            ),

            const SizedBox(height: 30),

            InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: () async {
                final Uri url = Uri.parse(
                  "https://play.google.com/store/apps/details?id=com.wallscape.flutter_wallscape_4k",
                );

                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                }
              },
              child: buildTile(
                Icons.star,
                "Rate the app",
                "Leave a review on the Play Store",
              ),
            ),

            const SizedBox(height: 30),

            InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: () async {
                final Uri url = Uri.parse(
                  "https://sites.google.com/view/wallscape-live-wallpaper-4k/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A9-%D8%A7%D9%84%D8%B1%D8%A6%D9%8A%D8%B3%D9%8A%D8%A9",
                );

                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.inAppBrowserView);
                }
              },
              child: buildTile(
                Icons.shield,
                "Privacy policy",
                "How we handle your data",
              ),
            ),

            const SizedBox(height: 55),
          ],
        ),
      ),
    );
  }

  Widget buildTile(IconData icon, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xff1B1B20),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: const Color(0xff3C4A1E),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(icon, color: const Color(0xffD8FF48), size: 30),
          ),

          const SizedBox(width: 18),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.white54, fontSize: 15),
                ),
              ],
            ),
          ),

          const Icon(Icons.chevron_right, color: Colors.white54, size: 30),
        ],
      ),
    );
  }
}
