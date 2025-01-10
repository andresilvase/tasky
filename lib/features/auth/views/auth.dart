import 'package:tasky/features/auth/widgets/auth_background_card.dart';
import 'package:tasky/features/auth/viewModel/auth_view_model.dart';
import 'package:tasky/features/auth/widgets/password_input.dart';
import 'package:tasky/features/auth/widgets/input_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tasky/features/auth/model/auth_result.dart';
import 'package:tasky/features/auth/utils/validators.dart';
import 'package:tasky/core/widgets/rounded_button.dart';
import 'package:tasky/core/constants/widgets_keys.dart';
import 'package:tasky/core/widgets/loading_blur.dart';
import 'package:tasky/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasky/core/routes/routes.dart';
import 'package:tasky/core/widgets/logo.dart';
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

  void _submitActionResult(AuthResult result) {
    if (result.ok) {
      Get.offAllNamed(Routes.home);
      authViewModel.toggleAuthMode(value: true);
    } else {
      Get.snackbar(
        AppLocalizations.of(Get.context!)!.error,
        result.message,
        backgroundColor: TaskiColors.fireRed,
        snackPosition: SnackPosition.TOP,
        colorText: TaskiColors.white,
      );
    }
  }

  Future<void> _submitAction() async {
    AuthResult result;

    if (authViewModel.isLogin) {
      result = await authViewModel.login(usernameController.text, passwordController.text);
    } else {
      result = await authViewModel.register(usernameController.text, passwordController.text);
    }

    _submitActionResult(result);
  }

  Future<void> submit() async => await _submitAction();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TaskiColors.blue,
      body: Stack(
        children: [
          Obx(
            () {
              final bool expandCard = !authViewModel.isLogin || authViewModel.isInErrorState;

              return AuthBackgroundCard(
                isToExpand: expandCard,
                spacing: 16,
                children: [
                  _logo(),
                  _authForm(),
                  _submitButton(),
                  _secondaryButtons(),
                ],
              );
            },
          ),
          Visibility(visible: authViewModel.isLoading, child: LoadingBlur()),
        ],
      ),
    );
  }

  Logo _logo() {
    return Logo(
      textColor: TaskiColors.statePurple,
      iconColor: TaskiColors.blue,
    );
  }

  Widget _authForm() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Column(
        spacing: 8,
        children: [
          _usernameInput(),
          _passwordInput(),
        ],
      ),
    );
  }

  Widget _usernameInput() {
    bool usernameInputHasError = authViewModel.isInErrorState;
    usernameInputHasError &= authValidators.usernameInputValidator(usernameController.text) != null;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: InputText(
        key: const Key(WidgetKeys.usernameInput),
        labelText: AppLocalizations.of(context)!.username,
        validator: authValidators.usernameInputValidator,
        onInputClear: usernameController.clear,
        isInErrorState: usernameInputHasError,
        controller: usernameController,
        focusNode: usernameFocusNode,
        isDarkMode: false,
        onChanged: (value) {
          usernameController.text = value.trim();
        },
      ),
    );
  }

  Widget _passwordInput() {
    return Column(
      children: [
        _password(),
        _repeatPassword(),
      ],
    );
  }

  Widget _password() {
    bool passwordInputHasError = authViewModel.isInErrorState;
    passwordInputHasError &= authValidators.passwordInputValidator(passwordController.text) != null;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: PasswordInput(
        key: const Key(WidgetKeys.passwordInput),
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

  Widget _repeatPassword() {
    bool repeatPasswordInputHasError =
        authValidators.repeatPasswordInputValidator(repeatPasswordController.text, passwordController.text) != null;

    repeatPasswordInputHasError &= authViewModel.isInErrorState;

    return Visibility(
      visible: !authViewModel.isLogin,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: PasswordInput(
          key: const Key(WidgetKeys.repeatPasswordInput),
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
    return RoundedButton(
      key: const Key(WidgetKeys.authSubmitButton),
      text: authViewModel.isLogin ? AppLocalizations.of(context)!.login : AppLocalizations.of(context)!.createAccount,
      textColor: TaskiColors.white,
      backgroundColor: TaskiColors.blue,
      width: Get.width,
      height: 48,
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          await submit();
          authViewModel.setErrorState(false);
        } else {
          authViewModel.setErrorState(true);
        }
      },
    );
  }

  Widget _secondaryButtons() {
    return Column(
      children: [
        _createAccount(),
        _continueAnonymous(),
      ],
    );
  }

  Widget _createAccount() {
    return TextButton(
      key: const Key(WidgetKeys.toggleAuthModeButton),
      onPressed: authViewModel.toggleAuthMode,
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
      ),
      child: Text(
        authViewModel.isLogin
            ? AppLocalizations.of(context)!.createAccount
            : AppLocalizations.of(context)!.alreadyHaveAnAccount,
        style: textButtonStyle(TaskiColors.blue),
      ),
    );
  }

  Widget _continueAnonymous() {
    return TextButton(
      key: const Key(WidgetKeys.continueAnnonymousButton),
      onPressed: () {
        Get.toNamed(Routes.home);
        authViewModel.setErrorState(false);
      },
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
      ),
      child: Text(
        AppLocalizations.of(context)!.continueAnonymously,
        style: textButtonStyle(TaskiColors.blue),
      ),
    );
  }

  TextStyle textButtonStyle(Color color) {
    return GoogleFonts.urbanist(
      fontWeight: FontWeight.w600,
      color: color,
      fontSize: 16,
    );
  }
}
