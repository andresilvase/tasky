import 'package:taski/features/auth/widgets/auth_background_card.dart';
import 'package:taski/features/auth/viewModel/auth_view_model.dart';
import 'package:taski/features/auth/widgets/password_input.dart';
import 'package:taski/features/auth/widgets/username_input.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taski/features/auth/model/auth_result.dart';
import 'package:taski/features/auth/utils/validators.dart';
import 'package:taski/core/widgets/loading_blur.dart';
import 'package:taski/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taski/core/routes/routes.dart';
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

  late AuthValidators authValidators;

  final AuthViewModel authViewModel = Get.find();

  void _setState() => setState(() {});

  @override
  void initState() {
    repeatPasswordController.addListener(_setState);
    usernameController.addListener(_setState);
    passwordController.addListener(_setState);

    repeatPasswordFocusNode.addListener(_setState);
    usernameFocusNode.addListener(_setState);
    passwordFocusNode.addListener(_setState);

    authValidators = AuthValidators(context);

    super.initState();
  }

  Future<void> _submitAction() async {
    AuthResult result;

    if (authViewModel.isLogin) {
      result = await authViewModel.login(usernameController.text, passwordController.text);
    } else {
      result = await authViewModel.register(usernameController.text, passwordController.text);
    }

    if (result.ok) {
      Get.offAllNamed(Routes.home);
    } else {
      Get.snackbar(
        'Error',
        result.message,
        backgroundColor: TaskiColors.fireRed,
        snackPosition: SnackPosition.TOP,
        colorText: TaskiColors.white,
      );
    }
  }

  Future<void> submit() async => await _submitAction();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TaskiColors.blue,
      body: Stack(
        children: [
          AuthBackgroundCard(
            isToExpand: !authViewModel.isLogin || authViewModel.isInErrorState,
            children: [
              Logo(),
              SizedBox(height: 16),
              _authForm(),
              _submitButton(),
              SizedBox(height: 16),
              _createAccount(),
            ],
          ),
          Visibility(visible: authViewModel.isLoading, child: LoadingBlur()),
        ],
      ),
    );
  }

  Widget _authForm() {
    return Obx(
      () => Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: Column(
          children: [
            _usernameInput(),
            SizedBox(height: 8),
            _passwordInput(),
            _repeatPasswordInput(),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _usernameInput() {
    bool usernameInputHasError = authViewModel.isInErrorState;
    usernameInputHasError &= authValidators.usernameInputValidator(usernameController.text) != null;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: UsernameInput(
        validator: authValidators.usernameInputValidator,
        onInputClear: usernameController.clear,
        usernameController: usernameController,
        isInErrorState: usernameInputHasError,
        focusNode: usernameFocusNode,
        onChanged: (value) {
          usernameController.text = value.trim();
        },
      ),
    );
  }

  Widget _passwordInput() {
    bool passwordInputHasError = authViewModel.isInErrorState;
    passwordInputHasError &= authValidators.passwordInputValidator(passwordController.text) != null;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: PasswordInput(
        labelText: AppLocalizations.of(context)!.password,
        validator: authValidators.passwordInputValidator,
        showPassword: authViewModel.setPasswordVisible,
        obscureText: !authViewModel.isPasswordVisible,
        passwordController: passwordController,
        isInErrorState: passwordInputHasError,
        focusNode: passwordFocusNode,
        onChanged: (value) {
          passwordController.text = value.trim();
        },
      ),
    );
  }

  Widget _repeatPasswordInput() {
    bool repeatPasswordInputHasError =
        authValidators.repeatPasswordInputValidator(repeatPasswordController.text, passwordController.text) != null;

    repeatPasswordInputHasError &= authViewModel.isInErrorState;

    return Visibility(
      visible: !authViewModel.isLogin,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: PasswordInput(
          validator: (value) {
            return authValidators.repeatPasswordInputValidator(
              value,
              passwordController.text,
            );
          },
          labelText: AppLocalizations.of(context)!.repeatPassword,
          showPassword: authViewModel.setPasswordVisible,
          obscureText: !authViewModel.isPasswordVisible,
          passwordController: repeatPasswordController,
          isInErrorState: repeatPasswordInputHasError,
          focusNode: repeatPasswordFocusNode,
          onChanged: (value) {
            repeatPasswordController.text = value.trim();
          },
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
        onPressed: () {
          if (formKey.currentState!.validate()) {
            submit();
          } else {
            authViewModel.setErrorState(true);
          }
        },
        child: Obx(
          () => Text(
            authViewModel.isLogin ? AppLocalizations.of(context)!.login : AppLocalizations.of(context)!.createAccount,
            style: TextStyle(
              color: TaskiColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
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
        authViewModel.isLogin
            ? AppLocalizations.of(context)!.createAccount
            : AppLocalizations.of(context)!.alreadyHaveAnAccount,
        style: textButtonStyle(),
      ),
      onPressed: () {
        authViewModel.toggleAuthMode();
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
