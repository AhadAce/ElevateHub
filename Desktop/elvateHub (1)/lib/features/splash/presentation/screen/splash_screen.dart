import 'dart:async';
import 'package:elvateHub/core/assets/assets.gen.dart';
import 'package:elvateHub/core/routes/app_router.dart';
import 'package:elvateHub/core/routes/common_import.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  _startDelay() {
    _timer = Timer(const Duration(seconds: 3), _goNext);
  }

  _goNext() async {
    String route = AppRouter.startedApp;
    if (AppController.instance.isLoggedIn()) {
      route = AppRouter.main;
    }
    Navigator.pushReplacementNamed(context, route);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Assets.images.logoPng.image(
          height: 177.h,
          width: 176.w,
        ),
      ),
    );
  }
}
