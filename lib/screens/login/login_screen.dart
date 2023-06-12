import 'package:data_on_test/homepage.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;

  void _hiddenPassowrd() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future getData(BuildContext context) async {
    String username = userController.text;
    String password = passwordController.text;

    if (username == '' || password == '') {
      SnackBar snackBar =
          const SnackBar(content: Text('invalid Username or Password'));
      return ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      Navigator.of(context).pushReplacementNamed(HomePage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Container(
            width: width,
            // height: height,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            // color: Colors.white,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                logo(),
                const SizedBox(height: 30),
                usernameField(),
                const SizedBox(height: 30),
                passwordField(context),
                const SizedBox(height: 30),
                loginButton(context),
              ],
            ),
          ),
        ),
      )),
    );
  }

  Widget logo() {
    return Column(
      children: [
        Container(
          height: 175,
          width: 175,
          child: Image.network('https://picsum.photos/250?image=9'),
        ),
        const SizedBox(height: 30),
        const Text(
          'DataOn Test',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  TextFormField usernameField() {
    return TextFormField(
      controller: userController,
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        prefixIcon: Icon(
          Icons.person,
          size: 20,
        ),
        labelText: 'Username',
      ),
    );
  }

  TextFormField passwordField(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      obscureText: _obscureText,
      onEditingComplete: () => getData(context),
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        prefixIcon: const Icon(
          Icons.lock,
          size: 20,
        ),
        suffixIcon: GestureDetector(
          onTap: _hiddenPassowrd,
          child: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
        ),
        labelText: 'Password',
      ),
    );
  }

  Widget loginButton(BuildContext context) {
    return Card(
      color: Color(0XFF1C499E),
      elevation: 5,
      child: Container(
        height: 50,
        width: 200,
        child: InkWell(
          splashColor: Colors.white60,
          onTap: () => getData(context),
          child: const Center(
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
