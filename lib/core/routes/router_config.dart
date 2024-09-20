import 'package:ekarma/configs/theme_config.dart';
import 'package:ekarma/features/auth/presentation/screens/add_account_info_screen.dart';
import 'package:ekarma/features/auth/presentation/screens/login_screen.dart';
import 'package:ekarma/features/auth/presentation/screens/on_boarding_screen.dart';
import 'package:ekarma/features/auth/presentation/screens/otp_screen.dart';
import 'package:ekarma/features/auth/presentation/screens/splash_screen.dart';
import 'package:ekarma/features/worker/presentation/screens/main_screen.dart';
import 'package:ekarma/features/worker/presentation/screens/single_job_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../utils/theme.dart';
import 'paths.dart' as path;

class AppRouter extends StatelessWidget {
  late final GoRouter _router;

  AppRouter({Key? key}) : super(key: key) {
    _router = GoRouter(
      initialLocation: path.workerHome,
      routes: <GoRoute>[
        GoRoute(
          path: path.splash,
          builder: (BuildContext context, GoRouterState state) =>
              const SplashScreen(),
        ),
        GoRoute(
          path: path.onBoarding,
          builder: (BuildContext context, GoRouterState state) => Onboarding(),
        ),

        GoRoute(
          path: path.login,
          builder: (BuildContext context, GoRouterState state) => const LoginScreen(),
        ),

        GoRoute(
          path: path.otp,
          builder: (BuildContext context, GoRouterState state){
            var number = state.extra as PhoneNumber;
            return OTPScreen(number: number);
          },
        ),

        GoRoute(
          path: path.addAccountInfo,
          builder: (BuildContext context, GoRouterState state){
            return const AddAccountInfoScreen();
          },
        ),

        GoRoute(
          path: path.workerHome,
          builder: (BuildContext context, GoRouterState state){
            return const WorkerMainScreen();
          },
        ),

        GoRoute(
          path: path.singleJob,
          builder: (BuildContext context, GoRouterState state){
            return const SingleJobScreen();
          },
        ),

//        GoRoute(
//          path: path.otp,
//          builder: (BuildContext context, GoRouterState state) {
//            var extra = state.extra as Map<String, dynamic>;
//            return OTPScreen(phoneNumber: extra['phoneNumber']);
//          },
//        ),

//        GoRoute(
//            path: path.pickLocation,
//            builder: (BuildContext context, GoRouterState state) {
//              var extra = state.extra as Map<String, dynamic>;
//              return PickLocation(
//                  dropOff: extra['dropOff'] ?? false,
//                  source: extra['source'],
//                  destination: extra['destination']);
//            }),

      ],
    );
  }

  @override
  Widget build(BuildContext context) => MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      theme: myDefaultTheme
  );
}
