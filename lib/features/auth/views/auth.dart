import 'package:taski/features/auth/widgets/auth_background_card.dart';
import 'package:taski/features/auth/widgets/password_input.dart';
import 'package:taski/features/auth/widgets/username_input.dart';
import 'package:taski/core/constants/colors.dart';
import 'package:taski/core/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FocusNode usernameFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TaskiColors.blue,
      body: AuthBackgroundCard(
        children: [
          Logo(),
          SizedBox(height: 16),
          _authForm(),
          SizedBox(height: 16),
          _loginButton(),
          SizedBox(height: 16),
          _forgotPassword(),
          _createAccount(),
        ],
      ),
    );
  }

  Widget _authForm() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Column(
        children: [
          _usernameInput(),
          _passwordInput(),
        ],
      ),
    );
  }

  Widget _usernameInput() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: UsernameInput(
        usernameController: usernameController,
        focusNode: usernameFocusNode,
        onChanged: (value) {},
        onInputClear: () {
          setState(() {
            usernameController.clear();
          });
        },
      ),
    );
  }

  Widget _passwordInput() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: PasswordInput(
        usernameController: passwordController,
        focusNode: passwordFocusNode,
        onChanged: (value) {},
        onInputClear: () {
          setState(() {
            passwordController.clear();
          });
        },
      ),
    );
  }

  Widget _loginButton() {
    return Container(
      width: Get.width,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: TaskiColors.blue,
      ),
      child: TextButton(
        onPressed: () {},
        child: Text(
          'Entrar',
          style: TextStyle(
            color: TaskiColors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _forgotPassword() {
    return TextButton(
      child: Text('Esqueci minha senha'),
      onPressed: () {},
    );
  }

  Widget _createAccount() {
    return TextButton(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
      ),
      child: Text('Criar conta'),
      onPressed: () {},
    );
  }
}
