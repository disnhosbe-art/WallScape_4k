import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'ads/app_open_ad_manager.dart';
import 'ads/rewarded_ad_manager.dart';
import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await MobileAds.instance.initialize();

  // 👇 غادي يتحمل الإعلان غير مرة
  AppOpenAdManager.loadAd();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingPage(),
    );
  }
}

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController controller = PageController();
  int page = 0;

  @override
  void dispose() {
    controller.dispose(); // 👈 مهم
    super.dispose();
  }

  void next() {
    if (page < 2) {
      controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    }
  }

  void handleStart() {
    RewardedAdManager.showAd(
      onFinished: () {
        next();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      body: Stack(
        children: [
          /// 📱 Pages
          PageView(
            controller: controller,
            onPageChanged: (i) {
              setState(() {
                page = i;
              });
            },
            children: const [
              _OnboardImage("assets/anime_02.png"),
              _OnboardImage("assets/anime_03.png"),
              _OnboardImage("assets/anime_04.png"),
            ],
          ),

          /// 🔘 Button
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFD8FF39).withOpacity(0.45),
                    blurRadius: 35,
                    spreadRadius: 4,
                  ),
                ],
              ),
              child: ElevatedButton.icon(
                onPressed: () {
                  if (page == 2) {
                    handleStart();
                  } else {
                    next();
                  }
                },
                icon: Icon(
                  page == 2
                      ? Icons.rocket_launch_rounded
                      : Icons.arrow_forward_rounded,
                  color: Colors.black,
                ),
                label: Text(
                  page == 2 ? "START" : "NEXT",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD8FF39),
                  minimumSize: const Size(double.infinity, 62),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 📷 Widget نظيف للصورة
class _OnboardImage extends StatelessWidget {
  final String path;

  const _OnboardImage(this.path);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }
}