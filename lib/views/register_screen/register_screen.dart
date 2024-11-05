import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_application/controller/auth_controller.dart';
import 'package:shopping_application/model/user_model.dart';
import 'package:shopping_application/views/login_screen/login_screen.dart';
import 'package:shopping_application/widgets/basic_btn.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    bool isValidEmail(String email) {
      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
      return emailRegex.hasMatch(email);
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Register',
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
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
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
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                obscureText: true,
                validator: (value) {
                  if (value == null || value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              BasicBtn(
                btnClick: () {
                  if (_formKey.currentState!.validate()) {
                    authController.authregister(
                      UserModel(
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim(),
                        name: _nameController.text.trim(),
                      ),
                    );
                  }
                },
                btnText: 'Register',
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('You already have an account'),
          TextButton(
            onPressed: () {
              Get.off(LoginScreen());
            },
            child: const Text('Login'),
          )
        ],
      ),
    );
  }
}
