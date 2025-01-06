import 'package:taski/features/auth/widgets/auth_background_card.dart';
import 'package:taski/features/auth/widgets/password_input.dart';
import 'package:taski/features/auth/widgets/username_input.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taski/features/auth/utils/validators.dart';
import 'package:taski/core/widgets/loading_blur.dart';
import 'package:taski/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taski/core/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController repeatPasswordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final FocusNode repeatPasswordFocusNode = FocusNode();
  final FocusNode usernameFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  bool isPasswordVisible = false;
  bool isLogin = true;

  bool isInErrorState = false;
  bool isLoading = false;

  void _setState() => setState(() {});

  @override
  void initState() {
    repeatPasswordFocusNode.addListener(_setState);
    usernameFocusNode.addListener(_setState);
    passwordFocusNode.addListener(_setState);

    super.initState();
  }

  Future<void> submit() async {
    if (formKey.currentState!.validate()) {
      isInErrorState = false;
      _setState();
      if (isLogin) {
      } else {}
      isLoading = true;
      _setState();
      await Future.delayed(const Duration(seconds: 2));
      _setState();
      isLoading = false;
    } else {
      isInErrorState = true;
      _setState();
    }
  }

  void showPassword() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TaskiColors.blue,
      body: Stack(
        children: [
          AuthBackgroundCard(
            isToExpand: !isLogin || isInErrorState,
            children: [
              Logo(),
              SizedBox(height: 16),
              _authForm(),
              _submitButton(),
              SizedBox(height: 16),
              _createAccount(),
            ],
          ),
          Visibility(visible: isLoading, child: LoadingBlur()),
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
          _repeatPasswordInput(),
          SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _usernameInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: UsernameInput(
        validator: AuthValidators.usernameInputValidator,
        usernameController: usernameController,
        isInErrorState: isInErrorState,
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
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: PasswordInput(
        labelText: AppLocalizations.of(context)!.password,
        validator: AuthValidators.passwordInputValidator,
        passwordController: passwordController,
        obscureText: !isPasswordVisible,
        isInErrorState: isInErrorState,
        focusNode: passwordFocusNode,
        showPassword: showPassword,
        onChanged: (value) {},
      ),
    );
  }

  Widget _repeatPasswordInput() {
    return Visibility(
      visible: !isLogin,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: PasswordInput(
          validator: (value) {
            return AuthValidators.repeatPasswordInputValidator(
              value,
              passwordController.text,
            );
          },
          labelText: AppLocalizations.of(context)!.repeatPassword,
          passwordController: repeatPasswordController,
          focusNode: repeatPasswordFocusNode,
          obscureText: !isPasswordVisible,
          isInErrorState: isInErrorState,
          showPassword: showPassword,
          onChanged: (value) {},
        ),
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      width: Get.width,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: TaskiColors.blue,
      ),
      child: TextButton(
        onPressed: submit,
        child: Text(
          isLogin ? AppLocalizations.of(context)!.login : AppLocalizations.of(context)!.createAccount,
          style: TextStyle(
            color: TaskiColors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _createAccount() {
    return TextButton(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
      ),
      child: Text(
        isLogin ? AppLocalizations.of(context)!.createAccount : AppLocalizations.of(context)!.alreadyHaveAnAccount,
        style: textButtonStyle(),
      ),
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
        });
      },
    );
  }

  TextStyle textButtonStyle() {
    return GoogleFonts.urbanist(
      color: TaskiColors.blue,
      fontWeight: FontWeight.w600,
      fontSize: 16,
    );
  }
}
