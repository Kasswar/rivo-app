import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rivo_app/core/constant/colors.dart';
import 'package:rivo_app/core/constant/info_widget.dart';
import 'package:rivo_app/core/constant/routes.dart';
import 'package:rivo_app/features/splash_screen/bloc/splash_bloc.dart';

import '../../../core/widgets/background_splash.dart';
import '../widgets/body_splash.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashBloc splashBloc = SplashBloc();
  @override
  void initState() {
    splashBloc.add(CheckAuthEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => splashBloc,
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state.authStatus == SplashAuthStatus.auth) {
            context.pushNamed(AppRouter.home);
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.primaryColorGreenAcssent,
          body: InfoWidget(builder: (context, deviceType) {
            return SizedBox(
              height: deviceType.screenHeight,
              width: deviceType.screenWidth,
              child: const Stack(
                alignment: Alignment.center,
                children: [
                  CustomBackGroundSplash(),
                  CustomBodySplashScreen(),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
