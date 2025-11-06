
## 🖼️ Wallpaper Studio App

A beautifully designed **Flutter application** that allows users to explore, browse, and favorite stunning wallpapers.
This project features a **fully responsive layout**, a **custom navigation drawer**, and an elegant, minimalist UI built with **Google Fonts** and **Material Design principles**.

---

### 🚀 Features

* **Responsive UI**

  * Automatically adapts between mobile, tablet, and desktop screen sizes.
  * Navbar for large screens and drawer for small screens.

* **Navigation Drawer**

  * Smooth slide-in drawer with interactive icons and routes.
  * Active state highlighting for the selected screen.

* **AppBar Design**

  * Custom logo with border-bottom styling.
  * Right-aligned hamburger menu for small screens.

* **Dynamic Categories**

  * Organized wallpaper collections with clean typography.
  * Fully scrollable layout with responsive spacing.

* **Interactive Elements**

  * Clickable logo image that navigates to the home screen.
  * Smooth transitions between screens using named routes.

---

### 🧱 Project Structure

```
lib/
│
├── main.dart 
|-- app.dart
| -- provider
|      └── wallpapper_provider.dart                    
│
├── screens/
│   └── initial_screen.dart  
|   └── home_screen.dart  
|   └── setting_screen.dart  
|   └── favourites_screen.dart     
|   └── wallpapper_screen.dart   
|   └── browse_screen.dart   
│
├── utils/
│   └── route_generator.dart   
|   └── responsive_breakpoints.dart     
│
├── widgets/
│   └── components/
│       ├── navbar.dart          
│       ├── navbar_drawer.dart    
│       └── categories.dart      
│
└── assets/
    └── images/                  
```

---

### 🧩 Tech Stack

* **Framework:** Flutter
* **Language:** Dart
* **UI Library:** Material Design
* **Fonts:** Google Fonts (Poppins)
* **Routing:** Named Routes (`RouteGenerator`)

---

### ⚙️ Installation & Setup

1. **Clone the repository:**

   ```bash
   git clone https://github.com/Douglasemmanuel/HNG13-STAGE-3-MOBILE-DEVELOPMENT.git
   cd wallpaper_studio_app
   ```

2. **Install dependencies:**

   ```bash
   flutter pub get
   ```

3. **Run the app:**

   ```bash
   flutter run
   ```

4. **(Optional)** For web:

   ```bash
   flutter run -d chrome
   ```

---

### 📸 Screenshots

* **Initial Screen**
  <img src="assets/images/createproduct.jpeg" alt="Main Screen" width="400" height="500"/>

* **Home Screen**
  <img src="assets/images/productDetails.jpeg" alt="Main Screen" width="400" height="500"/>

* **Browse Screen**
  <img src="assets/images/editproduct.jpeg" alt="Main Screen" width="400" height="500"/>

* **Setting Screen**
  <img src="assets/images/searchproducts.jpeg" alt="Main Screen" width="400" height="500"/>

* **Favourites Screen**
  <img src="assets/images/homescreen.jpeg" alt="Main Screen" width="400" height="500"/>


---

## Deployed App

Try the deployed web version of the app: [Live App Link]()

---

## Demo

* **Video Demonstration:**
  Watch the full workflow of the app in action: [Demo Video](https://drive.google.com/file/d/1xU6fyrmvf5kJcw0lXPocyabK1EzddxmV/view?pli=1)

---

### 🪪 License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.

---

