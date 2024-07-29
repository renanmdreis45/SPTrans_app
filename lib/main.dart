import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/di/injection_container.dart';
import 'package:flutter_application_2/core/preferences/app_constants.dart';
import 'package:flutter_application_2/presentation/bloc/bus_line/bus_line_bloc.dart';
import 'package:flutter_application_2/presentation/bloc/position/position_bloc.dart';
import 'package:flutter_application_2/presentation/bloc/position/position_event.dart';
import 'package:flutter_application_2/presentation/pages/bus_page.dart';
import 'package:flutter_application_2/presentation/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SP Trans App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        '/home': (context) => const HomePage(),
        '/bus_routes': (context) => const BusPage(),
      },
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<PositionBloc>(create: (context) => sl()..add(const GetPosition())),
        BlocProvider<BusLineBloc>(create: (context) => sl<BusLineBloc>()),
      ],
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          backgroundColor: defaultBlueColor,
          currentIndex: currentPageIndex,
          selectedItemColor: Colors.white,
          unselectedLabelStyle:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.map_outlined,
                color: Colors.white,
              ),
              icon: Icon(
                Icons.map_outlined,
                color: Colors.black,
              ),
              label: 'Mapa',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.bus_alert_outlined,
                color: Colors.white,
              ),
              icon: Icon(
                Icons.bus_alert_outlined,
                color: Colors.black,
              ),
              label: 'Ônibus',
            ),
          ],
        ),
        body: <Widget>[
            HomePage(),
            BusPage(),
        ][currentPageIndex],
      ),
    );
  }
}