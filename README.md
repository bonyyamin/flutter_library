# 🛒 All in one Flutter Library  
A **modern, reusable, and scalable Flutter library** for building various apps. This library provides **prebuilt UI components**, **utilities**, and **theme styles** to streamline the development of high-performance flutter apps.  

![E-Commerce Flutter]([https://via.placeholder.com/1200x500](https://picsum.photos/1200/500.jpg))  

## 🚀 Features  
✅ **Beautiful UI Components** – Prebuilt widgets for product listings, shopping cart, checkout, and more.  
✅ **Dark & Light Mode Support** – Fully adaptable UI with `dynamicStyle()`.  
✅ **Reusable Utilities** – Includes formatters, validators, and helper functions.  
✅ **Customizable Themes** – Centralized theme management for buttons, text, and colors.  
✅ **Optimized for Performance** – Designed with best practices for efficiency.  

---

## 📦 Installation  
```sh
flutter pub add ecommerce_flutter_library
```

---

## 📚 Components  

### **🌟 UI Components**  
| Component | Description |
|-----------|------------|
| `ProductCard` | Displays product image, name, price, rating, and add-to-cart button. |
| `ProductListView` | Scrollable product list (used for categories and search results). |
| `ProductCarousel` | Horizontal scrollable featured product carousel. |
| `ProductDetailPage` | Full-page product details with price, rating, and description. |
| `ShoppingCartPage` | Full shopping cart page with order summary and checkout. |
| `OrderSummary` | Displays subtotal, tax, discount, and total price before checkout. |
| `OrderConfirmationPage` | Displays order success message with order details. |
| `WishlistPage` | Displays the user's wishlist with "Move to Cart" & "Remove" buttons. |
| `FilterBar` | UI for filtering products by category, price, and rating. |
| `SortBar` | UI for sorting products (e.g., price, popularity, rating). |
| `SearchBarWidget` | Search input field with real-time query updates. |
| `RatingStars` | Displays product ratings with half-star support. |
| `BannerSlider` | Swipeable promotional banner slider. |
| `ShoppingCartBadge` | Shopping cart icon with a dynamic item count badge. |
| `WishlistButton` | Toggle button to add/remove products from the wishlist. |
| `CheckoutButton` | Initiates the checkout process with a loading state. |
| `PaymentMethodSelector` | UI for selecting payment methods like Credit Card, PayPal, Google Pay. |
| `QuantityAndSizeSelector` | Allows users to select quantity, size, or color of a product. |
| `AddressForm` | Collects shipping and billing address details. |
| `LoginScreen` | Login form with email and password validation. |
| `SignupScreen` | Signup form with name, email, password, and validation. |
| `AccountProfilePage` | Displays user account details with edit profile functionality. |

---

### **🎨 Theme & Styles**  
| Component | Description |
|-----------|------------|
| `EcommerceColors` | Defines primary, secondary, accent, and background colors. |
| `EcommerceTextStyles` | Predefined text styles for headings, body, and captions. |
| `EcommerceButtonStyles` | Prebuilt button styles for primary, secondary, and outline buttons. |
| `EcommerceCardStyles` | Standardized card styles for product displays. |
| `EcommerceTheme` | Full dark/light mode theme configuration for the app. |

---

### **🛠 Utilities**  
| Component | Description |
|-----------|------------|
| `Formatters` | Utility functions for currency, date, number formatting. |
| `Validators` | Validates email, password, phone, ZIP code, and credit card fields. |

---

## 🏗 Example Usage  
### **📌 Display a Product Card**
```dart
ProductCard(
  product: Product(
    imageUrl: "https://via.placeholder.com/150",
    name: "Smartwatch",
    price: 199.99,
    oldPrice: 249.99,
    rating: 4.5,
    onAddToCart: () => print("Added Smartwatch to Cart"),
    onTap: () => print("Navigating to Smartwatch Details"),
  ),
);
```

### **📌 Use the `SearchBarWidget`**
```dart
SearchBarWidget(
  onSearch: (query) {
    print("Searching for: $query");
  },
);
```

### **📌 Display the Shopping Cart Page**
```dart
ShoppingCartPage(
  cartItems: [
    CartItem(
      imageUrl: "https://via.placeholder.com/150",
      name: "Laptop",
      price: 999.99,
      quantity: 1,
      onRemove: () => print("Removed Laptop from Cart"),
      onIncrease: () => print("Increased Quantity"),
      onDecrease: () => print("Decreased Quantity"),
    ),
  ],
  onCheckout: () => print("Proceeding to Checkout"),
);
```

### **📌 Use `OrderSummary`**
```dart
OrderSummary(
  orderData: OrderSummaryData(
    subtotal: 120.00,
    discount: 20.00,
    shippingFee: 5.99,
    tax: 2.50,
  ),
);
```

---

## 🎨 Theme Integration  
Apply the theme in `MaterialApp`:
```dart
MaterialApp(
  theme: EcommerceTheme.lightTheme,
  darkTheme: EcommerceTheme.darkTheme,
  themeMode: ThemeMode.system, // Auto-switch based on system setting
  home: YourHomePage(),
);
```

---

## 🏆 Why Use This Library?  
- **Saves Development Time** – Prebuilt components mean **faster app development**.  
- **Fully Customizable** – Easily tweak colors, fonts, and styles to match your branding.  
- **Flutter Best Practices** – Code is optimized, clean, and structured properly.  

---

## 🌍 Contributing  
We welcome contributions! To contribute:  
1. **Fork** this repo  
2. Create a **new branch** (`feature/new-widget`)  
3. **Commit** your changes  
4. Open a **Pull Request**  

---

## 📄 License  
This project is licensed under the **MIT License**.  

---

## ❤️ Support  
⭐ If you find this library useful, **give it a star on GitHub**! 🚀  

