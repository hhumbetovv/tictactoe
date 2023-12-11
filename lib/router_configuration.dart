import 'package:go_router/go_router.dart';

import 'screens/create_room/create_room_view.dart';
import 'screens/error_screen.dart';
import 'screens/game_room/game_room_view.dart';
import 'screens/join_room/join_room_view.dart';
import 'screens/main/main_view.dart';
import 'screens/offline/offline_view.dart';
import 'screens/with_ai/with_ai_view.dart';

GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: MainView.route,
      builder: (context, state) => const MainView(),
    ),
    GoRoute(
      path: CreateRoomView.route,
      builder: (context, state) => const CreateRoomView(),
    ),
    GoRoute(
      path: JoinRoomView.route,
      builder: (context, state) => const JoinRoomView(),
    ),
    GoRoute(
      path: GameRoomView.route,
      builder: (context, state) {
        return GameRoomView(
          roomId: state.queryParameters["roomId"]!,
          nick: state.queryParameters['nick'],
        );
      },
    ),
    GoRoute(
      path: OfflineView.route,
      builder: (context, state) => const OfflineView(),
    ),
    GoRoute(
      path: WithAIView.route,
      builder: (context, state) => const WithAIView(),
    ),
  ],
  errorBuilder: (context, state) {
    return const ErrorScreen();
  },
);
