import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rise_up_media_mobile/src/views/widgets/buttons/high_impact_buttons.dart';
import 'package:rise_up_media_mobile/src/views/widgets/inputs.dart/input.dart';

class Login_Test_ViewState extends StatelessWidget {
  const Login_Test_ViewState({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rise Up Media'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Placeholder image (replace with your actual image widget)
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
              ),
              child: const Image(image: AssetImage("images/logo.png")),
            ),
            const SizedBox(height: 50),

            // Mobile number text field
            const MyTextField(
              labelText: "Mobile Number",
              width: 300,
              filled: false,
              border: true,
              icon: Icons.phone_android,
              obscureText: false,
            ),
            const SizedBox(height: 20),

            // Password text field
            const MyTextField(
              labelText: "Password",
              filled: false,
              border: true,
              width: 300,
              icon: Icons.key,
              obscureText: true,
            ),
            const SizedBox(height: 20),

            // Login button
            MyElevatedButton(
                title: "Login",
                height: 60,
                width: 300,
                background: Colors.blue,
                color: Colors.black,
                onPressed: () {
                  context.go("/dashboard");
                }),
          ],
        ),
      ),
    );
  }
}
