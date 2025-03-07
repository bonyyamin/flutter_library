import 'package:flutter/material.dart';
import '../utils/validators.dart';
import '../styles/ecommerce_colors.dart';

/// A sign-up screen component with input validation and loading state.
class SignupScreen extends StatefulWidget {
  final Function(String name, String email, String password) onSignup;
  final VoidCallback onLogin;

  const SignupScreen({
    Key? key,
    required this.onSignup,
    required this.onLogin,
  }) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _loading = false;
  bool _obscurePassword = true;

  void _handleSignup() {
    if (_formKey.currentState!.validate()) {
      if (_passwordController.text != _confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Passwords do not match")),
        );
        return;
      }

      setState(() => _loading = true);
      Future.delayed(const Duration(seconds: 2), () {
        setState(() => _loading = false);
        widget.onSignup(_nameController.text, _emailController.text, _passwordController.text);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up"), backgroundColor: EcommerceColors.primary),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Create Your Account", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),

              // Name Field
              _buildTextField(
                controller: _nameController,
                label: "Full Name",
                icon: Icons.person,
                validator: Validators.validateName,
              ),

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

              // Confirm Password Field
              _buildTextField(
                controller: _confirmPasswordController,
                label: "Confirm Password",
                icon: Icons.lock,
                obscureText: true,
                validator: (value) => value == _passwordController.text ? null : "Passwords do not match",
              ),

              const SizedBox(height: 20),

              // Sign Up Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _loading ? null : _handleSignup,
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
                      : const Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),

              const SizedBox(height: 20),

              // Already Have an Account? Log In
              Center(
                child: TextButton(
                  onPressed: widget.onLogin,
                  child: const Text("Already have an account? Log In", style: TextStyle(color: EcommerceColors.primary)),
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
SignupScreen(
  onSignup: (name, email, password) {
    print("Signing up with Name: $name, Email: $email, Password: $password");
  },
  onLogin: () {
    print("Navigating to Login");
  },
)
*/

/*
Key Features of This Widget:
✅ Validates Name, Email, and Password Fields – Uses validators.dart for validation.
✅ Password Visibility Toggle – Users can show/hide passwords.
✅ Confirm Password Field – Ensures passwords match before submission.
✅ Sign-Up Button with Loading Indicator – Prevents multiple taps.
✅ "Already Have an Account? Log In" Link – Allows navigation to the login screen.
*/