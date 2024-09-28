import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resfood_app/widgets/input_custom.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();

  bool _obscureText = true;
  final List<IconData> _icons = [
    FontAwesomeIcons.google,
    FontAwesomeIcons.apple,
    FontAwesomeIcons.facebook,
    FontAwesomeIcons.github
  ];

  void _snackBarMessage(String? message) {
    String text = message ?? 'This Feature is under construction';
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        content: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFD634),
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth <= 1000) {
          return _buildMobileScreen(context);
        } else {
          return _buildDesktopScreen(context);
        }
      }),
    );
  }

  Widget _buildMobileScreen(BuildContext context, {bool showIcon = true}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        showIcon
            ? const Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.fastfood,
                      size: 100,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'ResFood APP',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              )
            : Container(),
        Expanded(
          flex: 2,
          child: Container(
            padding: showIcon == false
                ? const EdgeInsets.symmetric(vertical: 100)
                : null,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 4),
                    blurRadius: 5.0)
              ],
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: showIcon
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0))
                  : null,
            ),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Login',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffFFD634),
                        ),
                      ),
                    ),
                  ),
                  InputCustom(
                    titleInput: 'Email',
                    controller: _controllerEmail,
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  InputCustom(
                    titleInput: 'Password',
                    controller: _controllerPassword,
                    obscureText: _obscureText,
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(Colors.amber[300]),
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        _snackBarMessage('This Feature is under construction');
                      },
                      child: Text(
                        'Forgot Password?',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.grey,
                                thickness: 1.0,
                                endIndent: 10.0,
                                indent: 10.0,
                              ),
                            ),
                            Text(
                              'or sign in with',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.grey,
                                thickness: 1.0,
                                endIndent: 10.0,
                                indent: 10.0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int i = 0; i < _icons.length; i++) ...[
                              if (i != 0) const SizedBox(width: 10.0),
                              IconButton(
                                icon: FaIcon(
                                  _icons[i],
                                ),
                                onPressed: () {
                                  _snackBarMessage(
                                      'This Feature is under construction');
                                },
                              ),
                            ]
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't Have an Account?"),
                            TextButton(
                              onPressed: () {
                                _snackBarMessage(null);
                              },
                              child: Text(
                                'Sign Up',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildDesktopScreen(BuildContext context) {
    return Container(
      color: const Color(0xffFFD634),
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 100),
      child: Card(
        child: Row(
          children: [
            const Expanded(
                child: Icon(
              Icons.fastfood,
              size: 100,
            )),
            Expanded(
              child: Container(
                child: _buildMobileScreen(context, showIcon: false),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
