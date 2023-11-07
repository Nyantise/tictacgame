import 'package:get/get.dart';
import 'package:tictacgame/pages/game.dart';
import 'package:tictacgame/pages/history.dart';
import 'package:tictacgame/pages/menu.dart';

appRoutes() => [
      GetPage(
          name: '/menu',
          page: () => const MenuPage(),
          transition: Transition.fadeIn),
      GetPage(
          name: '/game',
          page: () => const GamePage(),
          transition: Transition.fadeIn),
      GetPage(
          name: '/history',
          page: () => const HistoryPage(),
          transition: Transition.fadeIn),
    ];
