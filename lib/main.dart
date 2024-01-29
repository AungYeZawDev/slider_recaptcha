import 'package:flutter/material.dart';
import 'package:slider_recaptcha/slider_lib.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slider reCAPTCHA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _showRecaptcha() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: SizedBox(
            width: double.infinity,
            height: 275,
            child: SliderCaptcha(
              image: Image.asset(
                'assets/images/flutter_logo.jpeg',
                fit: BoxFit.fitWidth,
              ),
              colorBar: Colors.blueAccent,
              colorCaptChar: Colors.blueGrey,
              title: "Slide to Captcha",
              onConfirm: (value) async {
                if (value) {
                  Navigator.of(context).pop();
                  _showSuccessSnackBar(context);
                }
              },
            ),
          ),
        );
      },
    );
  }

  void _showSuccessSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Success!"),
        behavior: SnackBarBehavior.floating, // Ensure the SnackBar is floating
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(10), // Optional: Add border radius
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () => _showRecaptcha(), child: const Text("reCAPTCHA")),
      ),
    );
  }
}
