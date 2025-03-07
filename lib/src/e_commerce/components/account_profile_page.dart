import 'package:flutter/material.dart';
import '../styles/ecommerce_colors.dart';

/// Model for user profile data
class UserProfile {
  final String name;
  final String email;
  final String phone;
  final String address;
  final String profileImageUrl;

  UserProfile({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.profileImageUrl,
  });
}

/// Page to display user account profile.
class AccountProfilePage extends StatelessWidget {
  final UserProfile user;
  final VoidCallback onEditProfile;

  const AccountProfilePage({
    Key? key,
    required this.user,
    required this.onEditProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        backgroundColor: EcommerceColors.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Picture
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(user.profileImageUrl),
              ),
            ),
            const SizedBox(height: 10),

            // User Info
            _buildInfoTile(Icons.person, "Name", user.name),
            _buildInfoTile(Icons.email, "Email", user.email),
            _buildInfoTile(Icons.phone, "Phone", user.phone),
            _buildInfoTile(Icons.home, "Address", user.address),

            const SizedBox(height: 20),

            // Edit Profile Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onEditProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: EcommerceColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Text("Edit Profile", style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Helper method to build user info rows.
  Widget _buildInfoTile(IconData icon, String label, String value) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: EcommerceColors.primary),
        title: Text(label, style: const TextStyle(fontSize: 14, color: EcommerceColors.textHint)),
        subtitle: Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }
}



//how to use
/*
AccountProfilePage(
  user: UserProfile(
    name: "John Doe",
    email: "john@example.com",
    phone: "+1 234 567 890",
    address: "123 Main St, New York, USA",
    profileImageUrl: "https://via.placeholder.com/150",
  ),
  onEditProfile: () {
    print("Edit Profile clicked!");
  },
)
*/


/*
Key Features of This Page:
✅ Displays User Profile Details – Includes name, email, phone, address, and profile image.
✅ Editable Profile – Provides an "Edit Profile" button with a callback function.
✅ Clean UI – Uses ListTile & Card for better readability.
*/