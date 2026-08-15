import 'package:flutter/material.dart';
import 'package:gal/gal.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

import 'ads/rewarded_ad_manager.dart';


class ImagePage extends StatefulWidget {
  final String image;

  const ImagePage({
    super.key,
    required this.image,
  });

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {

  bool isFavorite = false;

  Future<void> downloadImage() async {
    try {
      final byteData = await rootBundle.load(widget.image);

      final bytes = byteData.buffer.asUint8List();

      await Gal.putImageBytes(
        bytes,
        name: "wallpaper_${DateTime.now().millisecondsSinceEpoch}",
      );



      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Image saved ✅"),
        ),
      );

    } catch (e) {
      print("Download error: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    loadFavorite();
  }
  Future<void> loadFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList('favorites') ?? [];

    setState(() {
      isFavorite = list.contains(widget.image);
    });
  }
  Future<void> toggleFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList('favorites') ?? [];

    if (list.contains(widget.image)) {
      list.remove(widget.image);
    } else {
      list.add(widget.image);
    }

    await prefs.setStringList('favorites', list);

    setState(() {
      isFavorite = list.contains(widget.image);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xFFD8FF39),
            size: 22,
          ),
          onPressed: () => Navigator.pop(context),
        ),

        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                barrierColor: Colors.black54,
                builder: (context) {
                  return Dialog(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    child: Container(
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.30),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: const Color(0xFFD8FF39),
                          width: 1.2,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          Container(
                            width: 85,
                            height: 85,
                            decoration: BoxDecoration(
                              color: const Color(0xFFD8FF39),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Icon(
                              Icons.play_circle_fill_rounded,
                              color: Colors.black,
                              size: 55,
                            ),
                          ),

                          const SizedBox(height: 22),

                          const Text(
                            "Watch an Ad",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 12),

                          const Text(
                            "Watch a short advertisement to unlock and download this wallpaper.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                              height: 1.5,
                            ),
                          ),

                          const SizedBox(height: 30),

                          Row(
                            children: [

                              Expanded(
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                      color: Color(0xFFD8FF39),
                                    ),
                                    padding: const EdgeInsets.symmetric(vertical: 15),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "Cancel",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(width: 15),

                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFD8FF39),
                                    foregroundColor: Colors.black,
                                    elevation: 0,
                                    padding: const EdgeInsets.symmetric(vertical: 15),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    RewardedAdManager.showAd(
                                      onFinished: () async {
                                        await downloadImage();
                                      },
                                    );
                                  },
                                  child: const Text(
                                    "Watch Ad",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            icon: const Icon(
              Icons.download_rounded,
              color: Color(0xFFD8FF39),
              size: 24,
            ),
          ),
          // Favorite
          IconButton(
            icon: Icon(
              isFavorite
                  ? Icons.favorite_rounded
                  : Icons.favorite_border_rounded,
              color: const Color(0xFFD8FF39),
              size: 22,
            ),
            onPressed: toggleFavorite,
          ),
          const SizedBox(width: 8),
        ],
      ),

      body: Stack(
        children: [

          // الصورة
          Positioned.fill(
            child: InteractiveViewer(
              minScale: 1,
              maxScale: 5,
              child: Image.asset(
                widget.image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
        ],
      ),
    );
  }
}