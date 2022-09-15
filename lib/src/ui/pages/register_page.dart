// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:animator/animator.dart';
import 'package:photos_fake/src/controllers/controllers.dart';
import 'package:photos_fake/src/data/models/user.dart';
import 'package:photos_fake/src/ui/widgets/loader.dart';
import 'package:photos_fake/src/utils/input_decorations.dart';
import 'package:photos_fake/src/utils/responsive.dart';
import 'package:photos_fake/src/utils/session.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Container(
                  decoration: _boxDecoration(),
                  foregroundDecoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
                Animator<double>(
                  triggerOnInit: true,
                  curve: Curves.easeIn,
                  tween: Tween<double>(begin: -1, end: 0),
                  builder: (context, state, child) {
                    return FractionalTranslation(
                      translation: Offset(state.value, 0),
                      child: child,
                    );
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: ListView(
                      physics:
                          MediaQuery.of(context).viewInsets == EdgeInsets.zero
                              ? const NeverScrollableScrollPhysics()
                              : null,
                      padding: const EdgeInsets.all(32.0),
                      shrinkWrap: true,
                      children: <Widget>[
                        const SizedBox(height: kToolbarHeight),
                        SizedBox(height: responsive.heightResponsive(10)),
                        Text(
                          'Register',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        const _FormRegister()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  BoxDecoration _boxDecoration() => const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/login.jpeg'),
          fit: BoxFit.cover,
        ),
      );
}

class _FormRegister extends StatelessWidget {
  const _FormRegister({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);

    void register(context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    CreateUserController controller = Provider.of(context, listen: false);
    openLoader(context);

    await controller.createUser();

    closeLoader(context);

    if (Session.instance.userSession!.token!.isNotEmpty) {
      Navigator.of(context).pushReplacementNamed('/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User Not Register.'),
        ),
      );
    }
  }

    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const _EmailField(),
              SizedBox(height: responsive.heightResponsive(2)),
              const _PasswordField(),
              SizedBox(height: responsive.heightResponsive(5)),
              ElevatedButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.indigo),
                  elevation: MaterialStateProperty.all<double>(0),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(
                          vertical: responsive.heightResponsive(2),
                          horizontal: responsive.widthResponsive(30))),
                ),
                onPressed: () => register(context),
                child: Text('Register'.toUpperCase()),
              ),
              SizedBox(height: responsive.heightResponsive(10)),
              TextButton(
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false),
                /* => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => RegisterView())), */
                child: const Text(
                  'Do you already have an account?',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              )
            ]),
      ),
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CreateUserController registerController = Provider.of(context);

    return TextFormField(
      style: const TextStyle(color: Colors.white70),
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      obscuringCharacter: '*',
      autocorrect: false,
      decoration: InputDecorations.authInputDecoration(
          labelText: 'Password', hintText: 'Enter the password'),
      controller: registerController.password,
      validator: (value) {
        if (value!.length <= 8) {
          return '6 characters minimum';
        }
        return null;
      },
      onFieldSubmitted: (value) async {
        FocusScope.of(context).requestFocus(FocusNode());
      },
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CreateUserController registerController = Provider.of(context);

    return TextFormField(
      style: const TextStyle(color: Colors.white70),
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      decoration: InputDecorations.authInputDecoration(
          labelText: 'Email', hintText: 'Enter the Email'),
      controller: registerController.email,
      validator: (value) {
        String pattern =
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regExp = RegExp(pattern);
        return regExp.hasMatch(value ?? '') ? null : 'Invalid Email';
      },
      onFieldSubmitted: (value) async {
        FocusScope.of(context).requestFocus(FocusNode());
      },
    );
  }
}
