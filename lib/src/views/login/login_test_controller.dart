import 'package:flutter/material.dart';

class Login_Test_Controller {

  // Receive BuildContext from the view
  void handleLoginButtonClick(
      String mobileNumber, String password, BuildContext context) async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false, // Prevent user interaction during loading
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );
      print('Mobile Number: $mobileNumber');
      print('Password: $password');
      await Future.delayed(const Duration(seconds: 2));
      Navigator.pop(context);
      // Navigator.pushReplacementNamed(context, '/home'); //after the login, navigate the user to the home page.
    } catch (error) {
      Navigator.pop(context);
      print(error);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An error occurred')),
      );
    }
  }
}
