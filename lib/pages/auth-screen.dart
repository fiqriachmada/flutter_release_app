import 'package:flutter/material.dart';
import 'package:flutter_evaluasi/pages/notes-screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _pin = TextEditingController();

  bool checkValid = true;
  bool passwordHidden = true;

  void _login() {
    if (_pin.text.isNotEmpty) {
      setState(() {
        if (_pin.text == "123456") {
          checkValid = true;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const MyNotesPage();
              },
            ),
          );
          const snackBar = SnackBar(
            content: Text('Log In Succesfully!'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          checkValid = false;
          const snackBar = SnackBar(
            content: Text('Something wrong, check your PIN again'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      });
    } else {
      const snackBar = SnackBar(
        content: Text('Oops, something went wrong!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void _showPassword() {
    setState(() {
      passwordHidden = !passwordHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(right: 20.0, left: 20.0),
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 80),
                child: const Image(
                  image: AssetImage('CR.png'),
                  width: 120,
                ),
              ),
              TextField(
                controller: _pin,
                obscureText: passwordHidden,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Masukkan PIN Anda",
                  suffixIcon: IconButton(
                    onPressed: () {
                      _showPassword();
                    },
                    icon: (passwordHidden)
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: ListTile(
                  title: const Text(
                    "Log In",
                    textAlign: TextAlign.center,
                  ),
                  onTap: _login,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
