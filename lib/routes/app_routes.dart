import 'package:daily_topper/app/modules/home/view/home_view.dart';
import 'package:daily_topper/app/modules/screens/screen1/view/screen1_view.dart';
import 'package:daily_topper/app/modules/screens/screen2/view/screen2_view.dart';
import 'package:daily_topper/app/modules/screens/screen3/view/screen3_view.dart';
import 'package:daily_topper/app/modules/screens/screen4/view/screen4_view.dart';
import 'package:get/get.dart';
import '../app/modules/home/view/home_body_view.dart';
import '../app/modules/splash/view/splash_view.dart';

// Import your screen files
class AppRoutes {

  static const String splash = '/splash';
  static const String home = '/home';
  static const String homeBody = '/homeBody';
  static const String screenOne = '/screenOne';
  static const String screenTwo = '/screenTwo';
  static const String screenThree = '/screenThree';
  static const String screenFour = '/screenFour';

  static List<GetPage> get pages => [

        GetPage(name: splash, page: () => const SplashView(),),
        GetPage(name: home, page: () => const HomeView(),),
        GetPage(name: homeBody, page: () => const HomeBodyView(),),
        GetPage(name: screenOne,page: () => const ScreenOneView(),),
        GetPage(name: screenTwo, page: () => const ScreenTwoView(),),
        GetPage(name: screenThree, page: () => const ScreenThreeView()),
        GetPage(name: screenFour, page: () => const ScreenFourView()),

  ];
}
