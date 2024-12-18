import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/config/routes/app_routes.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/core/constants/my_colors.dart';
import 'package:movie_app/core/services/init_getit.dart';
import 'package:movie_app/presentation/blocs/detail/detail_bloc.dart';
import 'package:movie_app/presentation/blocs/home/home_bloc.dart';
import 'package:movie_app/presentation/blocs/search/search_bloc.dart';
import 'package:movie_app/presentation/screens/general/general_imports.dart';

Future<void> main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) async {
    // await DotEnv().load(fileName: 'assets/.env');
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<HomeBloc>(),
        ),
        BlocProvider(
          create: (_) => getIt<SearchBloc>(),
        ),
        BlocProvider(
          create: (_) => getIt<DetailBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        theme: ThemeData(
          scaffoldBackgroundColor: kPrimaryBackgroundColor,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const General(),
      ),
    );
  }
}
