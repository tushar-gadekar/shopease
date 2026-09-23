# ShopEase - Flutter E-Commerce Assessment

A responsive, high-performance Flutter shopping application built to demonstrate state management, clean architecture, and UI/UX best practices. This project uses the **GetX MVC/Feature Architecture** to ensure clean separation of concerns and a highly reactive user interface.

---

## 🏗️ Architecture

The codebase strictly adheres to the **GetX MVC Pattern**:
- **Models** (`lib/models/`): Defines data structures (e.g., `ProductModel`, `CartItemModel`).
- **Views** (`lib/views/`): Pure UI components. Contains absolutely zero business logic.
- **Controllers** (`lib/controllers/`): Handles all business logic, API/mock data fetching, and reactive state management (`ProductController`, `CartController`, `AuthController`, `ThemeController`).
- **Bindings** (`lib/bindings/`): Manages dependency injection (e.g., `InitialBinding`) to ensure controllers are lazily loaded or initialized right when needed.
- **Routes** (`lib/routes/`): Clean, centralized named route definitions (`app_pages.dart`, `app_routes.dart`).

---

## ✨ Features Implemented

### Core Requirements (100% Completed)
- **Home Screen**: A responsive grid displaying 10 mock products.
- **Search & Filter**: Real-time reactive search by product name and filtering by category.
- **Product Details**: A detailed view with Hero animations and a dynamic quantity selector. 
  - *Note:* The quantity selector perfectly synchronizes with the actual cart state.
- **Dynamic Cart**: Real-time total amount calculations. Users can add, remove, and adjust quantities seamlessly.
- **State Management**: Fully powered by **GetX**. The app utilizes `Obx`, `RxList`, and `RxInt` for state management, entirely avoiding the use of `setState`.

### Bonus Features (Added for Premium UX)
- **Mock Authentication Layer**: Complete with an animated Splash Screen and a premium Login UI. *(Hint: You can use any dummy credentials to log in!)*
- **Local Persistence**: Powered by `get_storage`. The user's **Cart**, **Favorites**, and **Theme Mode** are saved locally and persist across app restarts.
- **Favorites System**: Users can like/unlike products, with a dedicated Favorites View to browse saved items.
- **Dark Mode**: A fully integrated Theme Controller allowing users to switch between System Default, Light, and Dark modes.
- **Animations**: Smooth `Hero` transitions between the catalog and product details.

---

## 🚀 How to Run the Project

1. **Clone/Download** the repository.
2. Navigate to the project directory in your terminal.
3. Fetch the dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app on your preferred emulator or device:
   ```bash
   flutter run
   ```

*Note: The app is fully responsive and supports both iOS and Android platforms.*

---

## 📦 Dependencies

- [`get`](https://pub.dev/packages/get): For state management, dependency injection, and route management.
- [`get_storage`](https://pub.dev/packages/get_storage): Fast, synchronous local key-value storage.
- [`flutter_launcher_icons`](https://pub.dev/packages/flutter_launcher_icons): For generating the custom app icon.

---

**Developed for the Flutter Developer Technical Assessment.**
