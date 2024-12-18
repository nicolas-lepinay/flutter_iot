import 'package:arduino_iot_app/store/equipments_cubit.dart';
import 'package:arduino_iot_app/store/login_cubit.dart';
import 'package:arduino_iot_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:arduino_iot_app/router/router.dart';

// Externes
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'injection/get_it.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Désactivation du mode "paysage" :
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // Get It :
  configureDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<EquipmentsCubit>(
          create: (context) => getIt<EquipmentsCubit>(),
        ),
        /*
        BlocProvider<LoginCubit>(
          create: (context) => getIt<LoginCubit>(),
        ),
         */
      ],
      child: const MyApp(),
    ),
  );

  //runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter IoT App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //fontFamily: 'Satoshi',
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        ),
        scaffoldBackgroundColor: Constants.lightest,
      ),
      //home: const MyHomePage(title: "Test avec Cubit"),
      routerConfig: router,
    );
  }
}
