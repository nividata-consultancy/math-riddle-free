import 'dart:async';
import 'dart:isolate';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:logging/logging.dart';
import 'package:math_riddle/core/app_assets.dart';
import 'package:math_riddle/core/app_route.dart';
import 'package:math_riddle/core/app_theme.dart';
import 'package:math_riddle/data/audio/audio_controller.dart';
import 'package:math_riddle/data/persistence/local_storage_settings_persistence.dart';
import 'package:math_riddle/data/persistence/settings_persistence.dart';
import 'package:math_riddle/data/player_progress/persistence/local_storage_player_progress_persistence.dart';
import 'package:math_riddle/data/player_progress/persistence/player_progress_persistence.dart';
import 'package:math_riddle/data/player_progress/player_progress.dart';
import 'package:math_riddle/data/puzzle/free_puzzle_repository.dart';
import 'package:math_riddle/data/puzzle/i_puzzle_repository.dart';
import 'package:math_riddle/data/setting/settings.dart';
import 'package:math_riddle/firebase_options.dart';
import 'package:math_riddle/view/common/app_lifecycle.dart';
import 'package:provider/provider.dart';

Logger _log = Logger('main.dart');

Future<void> main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    if (kDebugMode) {
      Animate.restartOnHotReload = true;
    }

    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    FirebaseCrashlytics crashlytics = FirebaseCrashlytics.instance;

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    Isolate.current.addErrorListener(RawReceivePort((dynamic pair) async {
      final errorAndStacktrace = pair as List<dynamic>;
      await crashlytics.recordError(
          errorAndStacktrace.first, errorAndStacktrace.last as StackTrace?,
          fatal: true);
    }).sendPort);

    if (kReleaseMode) {
      // Don't log anything below warnings in production.
      Logger.root.level = Level.WARNING;
    }
    Logger.root.onRecord.listen((record) {
      debugPrint('${record.level.name}: ${record.time}: '
          '${record.loggerName}: '
          '${record.message}');
    });

    _log.info('Going full screen');
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    runApp(
      MyApp(
        settingsPersistence: LocalStorageSettingsPersistence(),
        playerProgressPersistence: LocalStoragePlayerProgressPersistence(),
        puzzleRepository: FreePuzzleRepository(),
      ),
    );
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}

class MyApp extends StatelessWidget {
  final PlayerProgressPersistence playerProgressPersistence;
  final SettingsPersistence settingsPersistence;
  final IPuzzleRepository puzzleRepository;

  const MyApp({
    required this.playerProgressPersistence,
    required this.settingsPersistence,
    required this.puzzleRepository,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppLifecycleObserver(
      child: MultiProvider(
        providers: [
          Provider.value(value: puzzleRepository),
          ChangeNotifierProvider(
            create: (context) {
              var progress = PlayerProgress(playerProgressPersistence);
              progress.getLatestFromStore();
              return progress;
            },
          ),
          Provider<SettingsController>(
            lazy: false,
            create: (context) => SettingsController(
              persistence: settingsPersistence,
            )..loadStateFromPersistence(),
          ),
          ProxyProvider2<SettingsController, ValueNotifier<AppLifecycleState>,
              AudioController>(
            // Ensures that the AudioController is created on startup,
            // and not "only when it's needed", as is default behavior.
            // This way, music starts immediately.
            lazy: false,
            create: (context) => AudioController()..initialize(),
            update: (context, settings, lifecycleNotifier, audio) {
              if (audio == null) throw ArgumentError.notNull();
              audio.attachSettings(settings);
              audio.attachLifecycleNotifier(lifecycleNotifier);
              return audio;
            },
            dispose: (context, audio) => audio.dispose(),
          ),
        ],
        child: Builder(builder: (context) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Math Riddle',
            theme: ThemeController.theme(),
            routeInformationProvider: AppRoute.router.routeInformationProvider,
            routeInformationParser: AppRoute.router.routeInformationParser,
            routerDelegate: AppRoute.router.routerDelegate,
          );
        }),
      ),
    );
  }
}
