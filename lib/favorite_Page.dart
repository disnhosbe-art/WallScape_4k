import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ImagePage.dart';
import 'ads/interstitial_ad_manager.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage>
    with AutomaticKeepAliveClientMixin {

  List<String> favorites = [];

  int tapCount = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    getFavorites();
  }

  Future<void> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      favorites = prefs.getStringList("favorites") ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: [
        Container(
          color: Colors.black,
          child: favorites.isEmpty
              ? const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite_border_rounded,
                  color: Color(0xFFD8FF39),
                  size: 90,
                ),
                SizedBox(height: 50),
                Text(
                  "No Favorites Yet",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
              : GridView.builder(
            padding: const EdgeInsets.only(
              top: 115,
              left: 10,
              right: 10,
              bottom: 5,
            ),
            itemCount: favorites.length,
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              final image = favorites[index];

              return GestureDetector(
                onTap: () {
                  tapCount++;
                  if (tapCount % 2 == 0) {
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
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}