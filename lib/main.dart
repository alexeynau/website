import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_website/presentation/pages/home_page.dart';
import 'presentation/bloc/login_bloc/login_bloc.dart';
import 'presentation/pages/login_page.dart';
import 'service_locator.dart' as dependancy_injection;
import 'service_locator.dart';

// class GlobalBlocObserver extends BlocObserver {
//   @override
//   void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
//     Sentry.captureException(error, stackTrace: stackTrace);

//     if (kDebugMode) {
//       print(stackTrace);
//     }

//     super.onError(bloc, error, stackTrace);
//   }
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependancy_injection.setup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => getIt<LoginBloc>(),
        ),
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => LoginPage(),
          '/home': (context) => const HomePage(),
          // Add more routes here
        },
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        title: 'CRM App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
