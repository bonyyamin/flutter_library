import 'package:flutter/material.dart';
import '../utils/validators.dart';
import '../styles/ecommerce_colors.dart';

/// A login screen component with email & password input.
class LoginScreen extends StatefulWidget {
  final Function(String email, String password) onLogin;
  final VoidCallback onForgotPassword;
  final VoidCallback onSignUp;

  const LoginScreen({
    Key? key,
    required this.onLogin,
    required this.onForgotPassword,
    required this.onSignUp,
  }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _loading = false;
  bool _obscurePassword = true;

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      setState(() => _loading = true);
      Future.delayed(const Duration(seconds: 2), () {
        setState(() => _loading = false);
        widget.onLogin(_emailController.text, _passwordController.text);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login"), backgroundColor: EcommerceColors.primary),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Welcome Back!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),

              // Email Field
              _buildTextField(
                controller: _emailController,
                label: "Email",
                icon: Icons.email,
                validator: Validators.validateEmail,
              ),

              // Password Field
              _buildTextField(
                controller: _passwordController,
                label: "Password",
                icon: Icons.lock,
                obscureText: _obscurePassword,
                validator: Validators.validatePassword,
                suffixIcon: IconButton(
                  icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
                  onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                ),
              ),

              const SizedBox(height: 10),

              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: widget.onForgotPassword,
                  child: const Text("Forgot Password?", style: TextStyle(color: EcommerceColors.primary)),
                ),
              ),

              const SizedBox(height: 20),

              // Login Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _loading ? null : _handleLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: EcommerceColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: _loading
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                        )
                      : const Text("Login", style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),

              const SizedBox(height: 20),

              // Sign Up Link
              Center(
                child: TextButton(
                  onPressed: widget.onSignUp,
                  child: const Text("Don't have an account? Sign Up", style: TextStyle(color: EcommerceColors.primary)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Helper method to create text fields.
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscureText = false,
    String? Function(String?)? validator,
    Widget? suffixIcon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        obscureText: obscureText,
        validator: validator,
      ),
    );
  }
}


//how to use
/*
LoginScreen(
  onLogin: (email, password) {
    print("Logging in with Email: $email, Password: $password");
  },
  onForgotPassword: () {
    print("Forgot Password Clicked");
  },
  onSignUp: () {
    print("Navigating to Sign Up");
  },
)
*/


/*
Key Features of This Widget:
✅ Validates Email & Password – Uses validators.dart for input validation.
✅ Password Visibility Toggle – Users can show/hide their password.
✅ Login Button with Loading Indicator – Prevents multiple taps.
✅ Forgot Password & Sign-Up Links – Provides easy navigation options.
*/