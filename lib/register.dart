import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  String _username = '';
  String _password = '';

  RegisterPage({Key? key}) : super(key: key);

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
              onChanged: (String value) {
                _password = value;
              },
              obscureText: true,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
                showRegisterSuccessDialog(context, _username);
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
              child: const Text('Register'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Sudah punya akun? Masuk sekarang'),
            ),
          ],
        ),
      ),
    );
  }
}

void showRegisterSuccessDialog(BuildContext context, String username) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Selamat datang di Octa Shop'),
        content: Text('Yuk Login, $username!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushReplacementNamed(context, '/login');
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
