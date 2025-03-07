import 'package:flutter/material.dart';
import '../styles/ecommerce_colors.dart';

/// Model for a payment method option
class PaymentMethod {
  final String name;
  final IconData icon;
  final String id;

  PaymentMethod({required this.name, required this.icon, required this.id});
}

/// A widget for selecting a payment method.
class PaymentMethodSelector extends StatefulWidget {
  final List<PaymentMethod> paymentMethods;
  final Function(String selectedMethodId) onMethodSelected;

  const PaymentMethodSelector({
    Key? key,
    required this.paymentMethods,
    required this.onMethodSelected,
  }) : super(key: key);

  @override
  _PaymentMethodSelectorState createState() => _PaymentMethodSelectorState();
}

class _PaymentMethodSelectorState extends State<PaymentMethodSelector> {
  String? _selectedMethodId;

  @override
  void initState() {
    super.initState();
    _selectedMethodId = widget.paymentMethods.isNotEmpty ? widget.paymentMethods.first.id : null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Select Payment Method", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Column(
          children: widget.paymentMethods.map((method) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 6),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: Icon(method.icon, color: EcommerceColors.primary),
                title: Text(method.name, style: const TextStyle(fontSize: 16)),
                trailing: Radio<String>(
                  value: method.id,
                  groupValue: _selectedMethodId,
                  activeColor: EcommerceColors.primary,
                  onChanged: (value) {
                    setState(() => _selectedMethodId = value);
                    widget.onMethodSelected(value!);
                  },
                ),
                onTap: () {
                  setState(() => _selectedMethodId = method.id);
                  widget.onMethodSelected(method.id);
                },
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}


//how to use
/*
PaymentMethodSelector(
  paymentMethods: [
    PaymentMethod(name: "Credit Card", icon: Icons.credit_card, id: "credit_card"),
    PaymentMethod(name: "PayPal", icon: Icons.account_balance_wallet, id: "paypal"),
    PaymentMethod(name: "Apple Pay", icon: Icons.phone_iphone, id: "apple_pay"),
    PaymentMethod(name: "Google Pay", icon: Icons.android, id: "google_pay"),
  ],
  onMethodSelected: (selectedMethod) {
    print("Selected Payment Method: $selectedMethod");
  },
)
*/

/*
Key Features of This Widget:
✅ Lists Multiple Payment Methods – Supports Credit Card, PayPal, Google Pay, etc.
✅ Radio Button Selection – Only one payment method can be selected at a time.
✅ Customizable Options – Allows adding different payment providers.
✅ Returns Selected Payment Method ID – Triggers onMethodSelected() callback.
*/