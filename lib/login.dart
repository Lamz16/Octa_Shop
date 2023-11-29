import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  String _username = '';
  String _password = '';

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Username'),
              onChanged: (String value) {
                _username = value;
              },
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
              onChanged: (value) {
                _password = value;
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                String username = _username;
                showLoginSuccessDialog(context, username);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.deepPurple;
                    }
                    return Colors.deepPurpleAccent;
                  },
                ),
              ),
              child: const Text('Login'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text('Belum punya akun? Daftar sekarang'),
            ),
          ],
        ),
      ),
    );
  }
}

void showLoginSuccessDialog(BuildContext context, String username) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Selamat datang di Octa Shop'),
        content: Text('Selamat datang, $username!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushReplacementNamed(context, '/main');
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
