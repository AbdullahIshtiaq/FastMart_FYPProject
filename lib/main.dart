import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:stylish/constants.dart';
import 'package:stylish/screens/QRScan/qr_scan_screen.dart';
import 'package:stylish/screens/category/category_screen.dart';
import 'package:stylish/screens/home/home_screen.dart';
import 'package:stylish/screens/profile/profile_screen.dart';
import 'package:stylish/screens/register/login_screen.dart';
import 'package:stylish/screens/register/register_screen.dart';
import 'package:stylish/screens/toShopList/toShop_screen.dart';
import 'package:stylish/screens/wishlist/wishlist_screen.dart';
import 'package:stylish/services/shared_service.dart';

Widget _defaultHome = const LoginScreen();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  bool _result = await SharedService.isLoggedIn();
  if(_result){
    _defaultHome = const MyStatefulWidget();
  }
  runApp(const ProviderScope(
    child: GetMaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'The Flutter Way',
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
        primarySwatch: Colors.blue,
        fontFamily: "Gordita",
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.black54),
        ),
      ),
      routes: {
        '/': (context) => _defaultHome,
        'login': (context) => const LoginScreen(),
        'register': (context) => const RegisterScreen(),
        'home': (context) => const MyStatefulWidget(),
        // 'category_product': (context) => const CategoryScreen(),
      },
      // home: const RegisterScreen(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  static int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Wishlist',
      style: optionStyle,
    ),
    Text(
      'Index 2: Scan',
      style: optionStyle,
    ),
    Text(
      'Index 3: To Shop',
      style: optionStyle,
    ),
    Text(
      'Index 4: Profile',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _selectedScreen(int index) {
    if (index == 0) {
      return HomeScreen();
    }
    if (index == 1) {
      return const WishlistScreen();
    }
    if (index == 2) {
      return const QRScanScreen();
    }
    if (index == 3) {
      return const ToShopScreen();
    }
    if (index == 4) {
      return const ProfileScreen();
    }
    return HomeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _selectedScreen(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.house_fill,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.heart_fill,
            ),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'To Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,

      ),
    );
  }
}
