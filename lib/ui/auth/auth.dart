import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_shop/data/repo/remote/auth_repository.dart';
import 'package:online_shop/ui/auth/bloc/auth_bloc.dart';
import 'package:online_shop/ui/widgets/loading_state.dart';

class AuthScrean extends StatelessWidget {
  final TextEditingController passwordController =
      TextEditingController(text: "83r5^_");
  final TextEditingController emailController =
      TextEditingController(text: "mor_2314");
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
                      const SizedBox(height: 30),
                      Text(
                        state.isLoginMode
                            ? "Login to your account"
                            : "create zimro account!",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 30),
                      TextField(
                          controller: emailController,
                          keyboardType: TextInputType.visiblePassword,
                          decoration:
                              const InputDecoration(label: Text('Email'))),
                      const SizedBox(height: 15),
                      _PasswrodTextFiled(
                          authState: state,
                          onBackground: Colors.white,
                          controller: passwordController),
                      const SizedBox(height: 30),
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: ((context, state) {
                          if (state is AuthLoading) {
                            return const LoadingState();
                          } else if (state is AuthInitial ||
                              state is AuthSuccess ||
                              state is AuthError) {
                            return ElevatedButton(
                                onPressed: () {
                                  BlocProvider.of<AuthBloc>(context).add(
                                      AuthButtonIsClicked(emailController.text,
                                          passwordController.text));
                                },
                                child: Text(
                                  state.isLoginMode ? "Login" : "SignUp",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.4)),
                                ));
                          } else {
                            throw "Bad state";
                          }
                        }),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<AuthBloc>(context)
                              .add(AuthModeChangeIsClicked());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(state.isLoginMode
                                ? "Dont have account zimro ?"
                                : "Already use zimro?"),
                            const SizedBox(width: 6),
                            Text(
                              state.isLoginMode ? "SignUp" : "Login",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(state.isLoginMode
                          ? " "
                          : "register its not working !")
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

class _PasswrodTextFiled extends StatelessWidget {
  final Color onBackground;
  final AuthState authState;
  final TextEditingController controller;
  const _PasswrodTextFiled(
      {required this.onBackground,
      required this.controller,
      required this.authState});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) => TextField(
          obscureText: state.obsecureText,
          controller: controller,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context)
                        .add(AuthModeChangeobsecureText());
                  },
                  icon: Icon(
                    state.obsecureText
                        ? Icons.visibility
                        : Icons.visibility_off_outlined,
                    color: onBackground.withOpacity(0.8),
                  )),
              label: const Text('Password'))),
    );
  }
}
