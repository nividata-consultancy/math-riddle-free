import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:math_riddle/view/level/level_selection_screen.dart';
import 'package:math_riddle/view/main/main_menu_screen.dart';
import 'package:math_riddle/view/session/play_session_screen.dart';

class AppRoute {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>
            const MainMenuScreen(key: Key('main menu')),
        routes: [
          GoRoute(
            path: 'play',
            pageBuilder: (context, state) => buildMyTransition<void>(
              child: const LevelSelectionScreen(key: Key('level selection')),
            ),
            routes: [
              GoRoute(
                path: 'session/:level',
                pageBuilder: (context, state) {
                  final levelNumber = int.parse(state.params['level']!);
                  return buildMyTransition<void>(
                    child: PlaySessionScreen(
                      levelNumber,
                      key: const Key('play session'),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

CustomTransitionPage<T> buildMyTransition<T>({
  required Widget child,
  String? name,
  Object? arguments,
  String? restorationId,
  LocalKey? key,
}) {
  return CustomTransitionPage<T>(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return _MyReveal(
        animation: animation,
        child: child,
      );
    },
    key: key,
    name: name,
    arguments: arguments,
    restorationId: restorationId,
    transitionDuration: const Duration(milliseconds: 700),
  );
}

class _MyReveal extends StatefulWidget {
  final Widget child;

  final Animation<double> animation;

  const _MyReveal({
    required this.child,
    required this.animation,
  });

  @override
  State<_MyReveal> createState() => _MyRevealState();
}

class _MyRevealState extends State<_MyReveal> {
  static final _log = Logger('_InkRevealState');

  bool _finished = false;

  final _tween = Tween(begin: const Offset(0, -1), end: Offset.zero);

  @override
  void initState() {
    super.initState();

    widget.animation.addStatusListener(_statusListener);
  }

  @override
  void didUpdateWidget(covariant _MyReveal oldWidget) {
    if (oldWidget.animation != widget.animation) {
      oldWidget.animation.removeStatusListener(_statusListener);
      widget.animation.addStatusListener(_statusListener);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    widget.animation.removeStatusListener(_statusListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        SlideTransition(
          position: _tween.animate(
            CurvedAnimation(
              parent: widget.animation,
              curve: Curves.easeOutCubic,
              reverseCurve: Curves.easeOutCubic,
            ),
          ),
        ),
        AnimatedOpacity(
          opacity: _finished ? 1 : 0,
          duration: const Duration(milliseconds: 300),
          child: widget.child,
        ),
      ],
    );
  }

  void _statusListener(AnimationStatus status) {
    _log.fine(() => 'status: $status');
    switch (status) {
      case AnimationStatus.completed:
        setState(() {
          _finished = true;
        });
        break;
      case AnimationStatus.forward:
      case AnimationStatus.dismissed:
      case AnimationStatus.reverse:
        setState(() {
          _finished = false;
        });
        break;
    }
  }
}
