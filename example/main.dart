import 'package:beetlehr_sdk/beetlehr_sdk.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Initialize the BeetleHR client.
final client = BeetleHRClient(
  'https://demo.beetlehr.com/api/v1',
  isLog: true,
);

/// The root widget of your application.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

/// The main page of your application.
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Check if the user is already authenticated.
    checkAuth();
  }

  /// Checks if the user is authenticated.
  void checkAuth() async {
    final result = await client.checkToken();
    await Future.delayed(const Duration(seconds: 1));
    if (result) {
      // If the user is authenticated, navigate to the main page.
      navigate();
    }
  }

  /// Navigates to the main page.
  void navigate() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const MainPage(),
        ),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              hintText: 'Your email',
            ),
            keyboardType: TextInputType.emailAddress,
            onChanged: (v) {
              setState(() {});
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: passwordController,
            decoration: const InputDecoration(
              hintText: 'Your password',
            ),
            keyboardType: TextInputType.visiblePassword,
            onChanged: (v) {
              setState(() {});
            },
          ),
          const SizedBox(height: 42),
          ElevatedButton(
            onPressed: () {
              if (emailController.text.isEmpty) {
                notify('Please input email first!');
              } else if (passwordController.text.isEmpty) {
                notify('Please input password first!');
              } else if (passwordController.text.isNotEmpty &&
                  emailController.text.isNotEmpty) {
                // Submit the login form.
                submit();
              }
            },
            child: const Text('Login'),
          )
        ],
      ),
    );
  }

  /// Submits the login form.
  void submit() async {
    try {
      final result = await client.loginWithEmail(
        email: emailController.text,
        password: passwordController.text,
      );
      if (result.meta?.success == true) {
        // If login is successful, navigate to the main page.
        navigate();
      } else {
        // If login fails, display the error message.
        notify(result.meta?.message ?? 'Something wrong!');
      }
    } catch (e) {
      // If an error occurs during login, display a generic error message.
      notify('Something wrong!');
    }
  }

  /// Shows a snackbar notification.
  void notify(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

/// The authenticated page of your application.
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Authenticated')),
    );
  }
}
