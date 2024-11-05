import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_application/controller/auth_controller.dart';
import 'package:shopping_application/model/user_model.dart';
import 'package:shopping_application/views/register_screen/register_screen.dart';
import 'package:shopping_application/widgets/basic_btn.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    bool isValidEmail(String email) {
      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
      return emailRegex.hasMatch(email);
    }

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!isValidEmail(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(height: 20),
              BasicBtn(
                btnClick: () {
                  if (_formKey.currentState!.validate()) {
                    authController.authLogin(UserModel(
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim()));
                  }
                },
                btnText: 'Login',
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("You don't have an account"),
          TextButton(
            onPressed: () {
              Get.off(RegisterScreen());
            },
            child: const Text('Register'),
          )
        ],
      ),
    );
  }
}
