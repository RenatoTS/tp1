// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tdpapp/services/auth_service.dart';

import '../../constants/theme_constants.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Correo electrónico',
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor ingrese su correo electrónico';
              }
              return null;
            },
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0, left: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Ingresa tu correo electrónico',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Contraseña',
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor ingresa tu contraseña';
              }
              return null;
            },
            controller: passwordController,
            obscureText: true,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Ingresa tu contraseña',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn(context) {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => Navigator.of(context).pushNamed("/forgot-password"),
        child: const Text(
          '¿Olvidaste tu contraseña?',
          style: kLabelStyle,
        ),
        style: const ButtonStyle(),
      ),
    );
  }

  // ignore: unused_element
  Widget _buildRememberMeCheckbox() {
    return SizedBox(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: false,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                // ignore: avoid_print
                print(value);
              },
            ),
          ),
          const Text(
            'Recuérdame',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildSignInWithText() {
    return Column(
      children: const <Widget>[
        Text(
          '- O -',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          'Inicia Sesión con',
          style: kLabelStyle,
        ),
      ],
    );
  }

  Widget _buildSocialBtn(VoidCallback onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSocialBtn(
            // ignore: avoid_print
            () => print('Login with Facebook'),
            const AssetImage(
              "assets/icons/facebook.jpeg",
            ),
          ),
          _buildSocialBtn(
            // ignore: avoid_print
            () => print('Login with Google'),
            const AssetImage(
              "assets/icons/google.jpeg",
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignupBtn(context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed('/register'),
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: '¿No tienes una cuenta? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Registrate',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginBtn(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 8.0,
          padding: const EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          primary: Colors.white,
        ),
        // ignore: avoid_print
        onPressed: () {
          if (_formKey.currentState != null &&
              _formKey.currentState!.validate()) {
            context
                .read<AuthService>()
                .signIn(
                  email: emailController.text,
                  password: passwordController.text,
                )
                .then((value) => ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                            value!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                          backgroundColor: Colors.grey),
                    ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text(
                    'Por favor ingresa todos los datos',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  backgroundColor: Colors.grey),
            );
          }
        },
        child: const Text(
          'ACCEDER',
          style: TextStyle(
            color: Colors.purple,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.blue,
                      Colors.purple,
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'Iniciar Sesión',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 30.0),
                          _buildEmailTF(),
                          const SizedBox(
                            height: 30.0,
                          ),
                          _buildPasswordTF(),
                          _buildForgotPasswordBtn(context),
                          //_buildRememberMeCheckbox(),
                          _buildLoginBtn(context),
                          _buildSignInWithText(),
                          _buildSocialBtnRow(),
                          _buildSignupBtn(context),
                        ],
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context, String message) {
  // Create button
  Widget okButton = FlatButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Auth"),
    content: Text(message),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
