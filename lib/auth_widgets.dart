import 'package:flutter/material.dart';

const Color kPrimary = Color(0xFF344E41);
const Color kAccent = Color(0xFF588157);
const Color kBackground = Color(0xFFF7F7F0);

final RegExp _emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

String? validateEmail(String? v) {
  final value = v?.trim() ?? '';
  if (value.isEmpty) return 'Email is required';
  if (!_emailRegex.hasMatch(value)) return 'Enter a valid email';
  return null;
}

String? validatePassword(String? v) {
  final value = v ?? '';
  if (value.isEmpty) return 'Password is required';
  if (value.length < 6) return 'Password must be at least 6 characters';
  return null;
}

InputDecoration authInputDecoration({
  required String label,
  required IconData icon,
  Widget? suffix,
}) {
  OutlineInputBorder border(Color color, [double width = 1]) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: color, width: width),
      );

  return InputDecoration(
    labelText: label,
    prefixIcon: Icon(icon, color: kAccent),
    suffixIcon: suffix,
    filled: true,
    fillColor: Colors.white,
    border: border(Colors.black26),
    enabledBorder: border(Colors.black26),
    focusedBorder: border(kPrimary, 2),
    errorBorder: border(Colors.red.shade400),
    focusedErrorBorder: border(Colors.red.shade400, 2),
    floatingLabelStyle: const TextStyle(color: kPrimary),
  );
}

class AuthButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AuthButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
