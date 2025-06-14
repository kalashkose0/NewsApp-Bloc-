// import 'package:flutter/material.dart';
// import 'package:newsapp/Screens/homePage.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();

//   void login() async {
//     if (_formKey.currentState!.validate()) {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       await prefs.setBool('isLoggedIn', true);
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (_) => HomePage()),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('News App Login')),
//       body: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: emailController,
//                 decoration: InputDecoration(labelText: 'Email'),
//                 validator: (value) {
//                   if (value!.isEmpty) return 'Required';
//                   if (!value.contains('@')) return 'Enter valid email';
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16),
//               TextFormField(
//                 controller: passwordController,
//                 obscureText: true,
//                 decoration: InputDecoration(labelText: 'Password'),
//                 validator: (value) =>
//                     value!.isEmpty ? 'Password required' : null,
//               ),
//               SizedBox(height: 32),
//               ElevatedButton(
//                 onPressed: login,
//                 child: Text('Login'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
