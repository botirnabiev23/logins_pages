import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_page_app/bloc/auth_bloc.dart';
import 'package:users_page_app/profile_page.dart';
import 'package:users_page_app/profile_screen.dart';
import 'package:users_page_app/sign_in_page.dart';
import 'package:users_page_app/sign_up_2/home_page.dart';
import 'package:users_page_app/sign_up_2/log_in_page.dart';
import 'package:users_page_app/sign_up_flow/sign_up_flow_1.dart';
import 'package:users_page_app/sign_up_flow/sign_up_flow_2.dart';
import 'package:users_page_app/sign_up_flow/sign_up_flow_3.dart';
import 'package:users_page_app/sign_up_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(FirebaseAuth.instance),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SignInScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {},
        ),
      ),
      body: const HomePageItem(),
    );
  }
}

class HomePageItem extends StatelessWidget {
  const HomePageItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text(
            'Profile',
            style: TextStyle(fontSize: 22),
          ),
          const SizedBox(height: 20),
          Stack(
            children: [
              InkWell(
                onTap: () {},
                overlayColor: const WidgetStatePropertyAll(Colors.transparent),
                child: const CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      AssetImage('assets/images/profile_picture.jpg'),
                ),
              ),
              Positioned(
                bottom: 5,
                right: 5,
                child: SizedBox(
                  child: Image.asset(
                    'assets/images/pencil.png',
                    fit: BoxFit.cover,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Robi',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            '8967452743',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 5),
          const Text(
            'robi123@gmail.com',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: ListView(
                children: const [
                  HomePageMenuItem(
                    icon: Icons.timelapse,
                    title: 'Order History',
                    page: SecondPage(),
                  ),
                  HomePageMenuItem(
                    icon: Icons.location_on,
                    title: 'Shopping Address',
                    page: SecondPage(),
                  ),
                  HomePageMenuItem(
                    icon: Icons.request_page,
                    title: 'Create Request',
                    page: SecondPage(),
                  ),
                  HomePageMenuItem(
                    icon: Icons.privacy_tip,
                    title: 'Privacy Policy',
                    page: SecondPage(),
                  ),
                  HomePageMenuItem(
                    icon: Icons.settings,
                    title: 'Settings',
                    page: SecondPage(),
                  ),
                  HomePageMenuItem(
                    icon: Icons.logout,
                    title: 'Log out',
                    page: SecondPage(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomePageMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget page;

  const HomePageMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.orange),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.orange),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return page;
          },
        ));
      },
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
        centerTitle: true,
      ),
      body: Center(
        child: TextButton(
          onPressed: () {},
          child: const Text('Back'),
        ),
      ),
    );
  }
}
