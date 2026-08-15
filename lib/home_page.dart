import 'package:flutter/material.dart';
import 'ImagePage.dart';
import 'Settings.dart';
import 'ads/interstitial_ad_manager.dart';
import 'favorite_Page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int index = 0;

  final List<String> scaryImages = [
    "assets/smile_01.jpg",
    "assets/smile_02.jpg",
    "assets/smile_03.jpg",
    "assets/smile_04.jpg",
    "assets/smile_05.jpg",
    "assets/smile_06.jpg",
    "assets/smile_07.png",
    "assets/smile_08.png",
    "assets/smile_09.png",
    "assets/smile_10.png",
  ];
  final List<String> natureImages = [
    "assets/nature_01.jpg",
    "assets/nature_02.jpg",
    "assets/nature_03.jpg",
    "assets/nature_04.jpg",
    "assets/nature_05.jpg",
    "assets/nature_06.jpg",
    "assets/nature_07.jpg",
    "assets/nature_08.jpg",
    "assets/nature_09.jpg",
    "assets/nature_10.jpg",
  ];
  final List<String> animeImages = [
    "assets/anime_01.png",
    "assets/anime_02.png",
    "assets/anime_03.png",
    "assets/anime_04.png",
    "assets/anime_05.jpg",
    "assets/anime_06.png",
    "assets/anime_07.png",
    "assets/anime_08.png",
    "assets/anime_09.jpg",
    "assets/anime_10.png",
  ];
  final List<String> carImages = [
    "assets/car_01.jpg",
    "assets/car_02.jpg",
    "assets/car_03.jpg",
    "assets/car_04.jpg",
    "assets/car_05.jpg",
    "assets/car_06.jpg",
    "assets/car_07.jpg",
    "assets/car_08.jpg",
    "assets/car_09.jpg",
    "assets/car_10.jpg",
  ];
  final List<String> animals = [
    "assets/animals_01.jpg",
    "assets/animals_02.jpg",
    "assets/animals_03.jpg",
    "assets/animals_04.jpg",
    "assets/animals_05.jpg",
    "assets/animals_06.jpg",
    "assets/animals_07.jpg",
    "assets/animals_08.jpg",
    "assets/animals_09.jpg",
    "assets/animals_10.jpg",
  ];
  final List<String> arch = [
    "assets/arch_01.jpg",
    "assets/arch_02.jpg",
    "assets/arch_03.jpg",
    "assets/arch_04.jpg",
    "assets/arch_05.jpg",
    "assets/arch_06.jpg",
    "assets/arch_07.jpg",
    "assets/arch_08.jpg",
    "assets/arch_09.jpg",
    "assets/arch_10.jpg",
  ];
  final List<String> abstract = [
    "assets/abstract_02.jpg",
    "assets/abstract_03.jpg",
    "assets/abstract_04.jpg",
    "assets/abstract_05.jpg",
    "assets/abstract_06.jpg",
    "assets/abstract_07.jpg",
    "assets/abstract_08.jpg",
    "assets/abstract_09.jpg",
    "assets/abstract_10.jpg",
    "assets/Background.png",
  ];
  final List<String> space = [
    "assets/space_01.jpg",
    "assets/space_02.jpg",
    "assets/space_03.jpg",
    "assets/space_04.jpg",
    "assets/space_05.jpg",
    "assets/space_06.jpg",
    "assets/space_07.jpg",
    "assets/space_08.jpg",
    "assets/space_09.jpg",
    "assets/space_10.jpg",
  ];
  final List<String> sports = [
    "assets/sports_01.jpg",
    "assets/sports_02.jpg",
    "assets/sports_03.jpg",
    "assets/sports_04.jpg",
    "assets/sports_05.jpg",
    "assets/sports_06.jpg",
    "assets/sports_07.jpg",
    "assets/sports_08.jpg",
    "assets/sports_09.jpg",
    "assets/sports_10.jpg",
  ];
  final List<String> minimal = [
    "assets/minimal_01.jpg",
    "assets/minimal_02.jpg",
    "assets/minimal_03.jpg",
    "assets/minimal_04.jpg",
    "assets/minimal_05.jpg",
    "assets/minimal_06.jpg",
    "assets/minimal_07.jpg",
    "assets/minimal_08.jpg",
    "assets/minimal_09.jpg",
    "assets/minimal_10.jpg",
  ];
  final List<String> art = [
    "assets/art_01.jpg",
    "assets/art_02.jpg",
    "assets/art_03.jpg",
    "assets/art_04.jpg",
    "assets/art_05.jpg",
    "assets/art_06.jpg",
    "assets/art_07.jpg",
    "assets/art_08.jpg",
    "assets/art_09.jpg",
    "assets/art_10.jpg",
  ];
  Widget buildGrid(List<String> images) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
              (context, index) {
            final image = images[index];

            return GestureDetector(
              onTap: () async {
                if ((index + 1) % 2 == 0) {
                  InterstitialAdManager.showAd(
                    onComplete: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ImagePage(image: image),
                        ),
                      );
                    },
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ImagePage(image: image),
                    ),
                  );
                }
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: index.isEven ? 200 : 220,
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
          childCount: images.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.55,
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: index == 0
          ? SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Scary Smile",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  // ===== المجموعة الأولى =====
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 15),
                      child: Row(
                        children: [
                          Icon(Icons.local_fire_department, color: Colors.orange, size: 28),
                          SizedBox(width: 10),
                          Text(
                            "Scary Smile",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  buildGrid(scaryImages),

                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 30, 20, 15),
                      child: Row(
                        children: [
                          Icon(Icons.landscape, color: Colors.green, size: 28),
                          SizedBox(width: 10),
                          Text(
                            "Nature",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  buildGrid(natureImages),

                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 30, 20, 15),
                      child: Row(
                        children: [
                          Icon(Icons.pets, color: Colors.orange, size: 28),
                          SizedBox(width: 10),
                          Text(
                            "Animals",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  buildGrid(animals),

                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 30, 20, 15),
                      child: Row(
                        children: [
                          Icon(Icons.rocket_launch, color: Colors.indigo, size: 28),
                          SizedBox(width: 10),
                          Text(
                            "Space",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  buildGrid(space),

                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 30, 20, 15),
                      child: Row(
                        children: [
                          Icon(Icons.directions_car, color: Colors.blue, size: 28),
                          SizedBox(width: 10),
                          Text(
                            "Cars",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  buildGrid(carImages),

                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 30, 20, 15),
                      child: Row(
                        children: [
                          Icon(Icons.animation, color: Colors.purple, size: 28),
                          SizedBox(width: 10),
                          Text(
                            "Anime",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  buildGrid(animeImages),

                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 30, 20, 15),
                      child: Row(
                        children: [
                          Icon(Icons.account_balance, color: Colors.brown, size: 28),
                          SizedBox(width: 10),
                          Text(
                            "Architecture",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  buildGrid(arch),

                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 30, 20, 15),
                      child: Row(
                        children: [
                          Icon(Icons.palette, color: Colors.pink, size: 28),
                          SizedBox(width: 10),
                          Text(
                            "Abstract",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  buildGrid(abstract),

                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 30, 20, 15),
                      child: Row(
                        children: [
                          Icon(Icons.sports_soccer, color: Colors.teal, size: 28),
                          SizedBox(width: 10),
                          Text(
                            "Sports",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  buildGrid(sports),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 30, 20, 15),
                      child: Row(
                        children: [

                          SizedBox(width: 10),
                          Text(
                            "minimal",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  buildGrid(minimal),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 30, 20, 15),
                      child: Row(
                        children: [

                          SizedBox(width: 10),
                          Text(
                            "art",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  buildGrid(art),
  // ===== العنوان الثاني =====
                ],
              ),
            ),
          ],
        ),
      )
          : index == 1
          ? const FavoritePage()
          : const SettingsPage(),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A1A),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                // Home
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index = 0;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeInOutCubic,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: index == 0
                          ? const Color(0xFFD8FF39)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.home_rounded,
                          color: index == 0 ? Colors.black : Colors.white70,
                          size: 26,
                        ),
                        AnimatedSize(
                          duration: const Duration(milliseconds: 300),
                          child: index == 0
                              ? const Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text(
                              "Home",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          )
                              : const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () => setState(() => index = 1),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                    decoration: BoxDecoration(
                      color: index == 1
                          ? const Color(0xFFD8FF39)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: index == 1 ? Colors.black : Colors.white70,
                          size: 26,
                        ),
                        if (index == 1) ...[
                          const SizedBox(width: 8),
                          const Text(
                            "Favorite",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    setState(() {
                      index = 2;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                    decoration: BoxDecoration(
                      color: index == 2
                          ? const Color(0xFFD8FF39)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.settings,
                          color: index == 2 ? Colors.black : Colors.white70,
                          size: 26,
                        ),
                        if (index == 2) ...[
                          const SizedBox(width: 8),
                          const Text(
                            "Settings",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}