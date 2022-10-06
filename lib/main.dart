import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/models/voteCategories.dart';
import 'package:flutter_auth/screens/home/home.dart';
import 'package:flutter_auth/screens/profile/user_profile.dart';
import 'package:flutter_auth/screens/results/results.dart';
import 'package:flutter_auth/screens/sideScreens/about.dart';
import 'package:flutter_auth/screens/sideScreens/developers.dart';
import 'package:flutter_auth/screens/splash.dart';
import 'package:flutter_auth/services/auth_service.dart';
import 'package:flutter_auth/shared/vote.dart';
import 'package:flutter_auth/state/vote.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(

        ///get user changes (either user is logged in or logged out)
        providers: [
          StreamProvider<User?>.value(
            value: AuthenticationService().getUser(),
            initialData: null,
          ),

          /// get voteState changes
          ChangeNotifierProvider(create: (_) => VoteState())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),

          /// Routes to screens
          routes: {
            '/home': (context) => const Home(),
            '/candidates': (context) => const VoteWidget(),
            '/userProfile': (context) => const UserProfile(),
            '/about': (context) => const About(),
            '/developers': (context) => const Developer(),
            '/results': (context) => const Results(),
            // '/wrapper': (context) => const Wrapper(),
          },
        ));
  }
}
