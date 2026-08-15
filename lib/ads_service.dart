import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'ads/app_open_ad_manager.dart';
import 'ads/interstitial_ad_manager.dart';


class AdsService {
  static bool _initialized = false;

  static Future<void> initialize() async {
    if (_initialized) return;

    await MobileAds.instance.initialize();
    AppOpenAdManager.loadAd();
    InterstitialAdManager.loadAd();

    _initialized = true;
  }
}