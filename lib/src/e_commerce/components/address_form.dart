import 'package:flutter/material.dart';
import '../utils/validators.dart';
import '../styles/ecommerce_colors.dart';

/// A form widget for collecting shipping or billing addresses.
class AddressForm extends StatefulWidget {
  final Function(Map<String, String>) onSubmit;

  const AddressForm({Key? key, required this.onSubmit}) : super(key: key);

  @override
  _AddressFormState createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _zipController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      widget.onSubmit({
        "name": _nameController.text,
        "phone": _phoneController.text,
        "street": _streetController.text,
        "city": _cityController.text,
        "state": _stateController.text,
        "zip": _zipController.text,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Shipping Address", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),

              _buildTextField(_nameController, "Full Name", Icons.person, Validators.validateName),
              _buildTextField(_phoneController, "Phone Number", Icons.phone, Validators.validatePhone),
              _buildTextField(_streetController, "Street Address", Icons.home, Validators.validateAddress),
              _buildTextField(_cityController, "City", Icons.location_city, Validators.validateName),
              _buildTextField(_stateController, "State", Icons.map, Validators.validateName),
              _buildTextField(_zipController, "ZIP Code", Icons.local_post_office, Validators.validateZipCode),

              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: EcommerceColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Text("Save Address", style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Helper method to build text fields with icons.
  Widget _buildTextField(TextEditingController controller, String label, IconData icon, String? Function(String?) validator) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        validator: validator,
      ),
    );
  }
}



//how to use
/*
AddressForm(
  onSubmit: (address) {
    print("Saved Address: $address");
  },
)
*/


/*
Key Features of This Widget:
✅ Collects Full Address Details – Includes name, phone, street, city, state, and ZIP code.
✅ Form Validation – Uses validators.dart to validate inputs.
✅ Auto-Calls onSubmit When Valid – Returns entered address as a Map.
✅ User-Friendly UI – Uses icons, labels, and clear layout.
*/