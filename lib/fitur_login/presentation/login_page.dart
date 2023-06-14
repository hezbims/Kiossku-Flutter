import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiossku_flutter/fitur_login/presentation/login_controller.dart';

class LoginPage extends StatelessWidget{
  final controller = Get.find<LoginController>();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body : Center(
          child : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller : controller.emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Email"),
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  TextField(
                    controller: controller.passwordController,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        label: const Text("Password"),
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: InkWell(
                            onTap: controller.changePasswordVisibility,
                            child: Icon(
                                controller.uiState.isPasswordVisible ?
                                Icons.visibility :
                                Icons.visibility_off
                            )
                        )
                    ),
                    obscureText: !controller.uiState.isPasswordVisible,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                        onPressed: controller.isLoginLoading ?
                           null : controller.submit,
                        child: controller.isLoginLoading ?
                          const CircularProgressIndicator() : const Text("Masuk"),
                    ),
                  )
                ],
              ),
            ),
          )
        )
      ),
    );
  }
}