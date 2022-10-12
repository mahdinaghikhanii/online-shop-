import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_shop/data/repo/remote/auth_repository.dart';
import 'package:online_shop/ui/auth/bloc/auth_bloc.dart';

class AuthScrean extends StatelessWidget {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  AuthScrean({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    const onBackground = Colors.white;

    return Scaffold(
      body: BlocProvider<AuthBloc>(
        create: (BuildContext context) {
          final bloc = AuthBloc(authRepository);
          bloc.stream.forEach((state) {
            if (state is AuthSuccess) {
              Navigator.pop(context);
            } else if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.exception.exceptionMessage)));
            }
          });
          bloc.add(AuthStarted());
          return bloc;
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (BuildContext context, state) {
            return Theme(
              data: themeData.copyWith(
                  snackBarTheme: SnackBarThemeData(
                      contentTextStyle:
                          const TextStyle(fontFamily: "IranYekan"),
                      backgroundColor: Theme.of(context).colorScheme.primary),
                  elevatedButtonTheme: ElevatedButtonThemeData(
                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                            const Size.fromHeight(56),
                          ),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xFF2A2A2A)),
                          foregroundColor: MaterialStateProperty.all(
                              themeData.colorScheme.secondary))),
                  colorScheme:
                      themeData.colorScheme.copyWith(onSurface: onBackground),
                  inputDecorationTheme: InputDecorationTheme(
                      labelStyle: const TextStyle(color: onBackground),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                              color: Colors.white, width: 1)))),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      Center(child: SvgPicture.asset("assets/svg/logo.svg")),
                      const SizedBox(height: 40),
                      TextField(
                          controller: emailController,
                          keyboardType: TextInputType.visiblePassword,
                          decoration:
                              const InputDecoration(label: Text('Email'))),
                      const SizedBox(height: 15),
                      _PasswrodTextFiled(
                          onBackground: Colors.white,
                          controller: passwordController),
                      const SizedBox(height: 30),
                      ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<AuthBloc>(context).add(
                                AuthButtonIsClicked(emailController.text,
                                    passwordController.text));
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          )),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already use zimro?"),
                            const SizedBox(width: 6),
                            Text(
                              "Log in",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontSize: 14),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class _PasswrodTextFiled extends StatelessWidget {
  final Color onBackground;
  final TextEditingController controller;
  _PasswrodTextFiled({required this.onBackground, required this.controller});

  bool obsecureText = false;
  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
            suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(
                  obsecureText
                      ? Icons.visibility
                      : Icons.visibility_off_outlined,
                  color: onBackground.withOpacity(0.8),
                )),
            label: const Text('Password')));
  }
}
