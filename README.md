# compras

A new Flutter project.

# Changelog

## 2025/06/25 home_view-01 - by rudsonalves

### Add core theming, dimensions, fonts, and common UI components

This commit introduces a centralized design system and a suite of reusable UI components. It adds responsive dimension and font abstractions, integrates Google Fonts and Material Symbols, and provides commonly used widgets (buttons, dialogs, form fields, controllers, and utilities). The router import order is also cleaned up to align with provider conventions.

### Modified Files

* **lib/routing/router.dart**

  * Moved `provider` import up to group with other package imports.
* **pubspec.yaml**

  * Added `material_symbols_icons: ^4.2815.1` and `intl: ^0.20.2` dependencies for icons and date formatting.

### New Files

* **lib/ui/core/themes/dimens.dart**
  Defines `Dimens` abstraction for mobile and desktop paddings, spacing, and border radii.
* **lib/ui/core/themes/fonts.dart**
  Declares `FontsTheme` and `AppFontsStyle` for responsive text styles using custom font families.
* **lib/ui/core/themes/util.dart**
  Adds `createTextTheme()` helper to merge Google Fonts into `TextTheme`.
* **lib/ui/core/ui/buttons/big\_button.dart**
  Reusable large button with loading state and icon support.
* **lib/ui/core/ui/buttons/icon\_back\_button.dart**
  Standard back button using Material Symbols.
* **lib/ui/core/ui/dialogs/app\_snack\_bar.dart**
  Bottom snack bar helpers for success and error messages.
* **lib/ui/core/ui/dialogs/botton\_sheet\_message.dart.dart**
  Modal bottom sheet component with customizable content and actions.
* **lib/ui/core/ui/dialogs/simple\_dialog.dart**
  Alert dialog wrapper with rich text support.
* **lib/ui/core/ui/dismissibles/dismissible\_card.dart**
  Dismissible card widget for edit and delete actions.
* **lib/ui/core/ui/dismissibles/dismissible\_container.dart**
  Styled background container for dismissible widgets.
* **lib/ui/core/ui/editing\_controllers/currency\_editing\_controller.dart**
  Text controller that masks and parses currency input.
* **lib/ui/core/ui/editing\_controllers/masked\_editing\_controller.dart**
  Generic mask controller for text fields.
* **lib/ui/core/ui/form\_fields/basic\_form\_field.dart**
  Styled `TextFormField` wrapper with label, icons, and validation.
* **lib/ui/core/ui/form\_fields/date\_form\_field.dart**
  Date picker form field with formatted input.
* **lib/ui/core/ui/form\_fields/enum\_form\_field.dart**
  `FormField` implementation for selecting `Enum` values via toggle buttons.
* **lib/ui/core/ui/form\_fields/widgets/toggle\_buttons\_text.dart**
  Helper widget for labeled toggle buttons with selection indicator.
* **lib/ui/core/ui/texts/parse\_rich\_text.dart**
  Parses markdown-like `*` and `**` syntax in strings and prepends icons for list items.
* **lib/utils/extensions/date\_time\_extensions.dart**
  Date formatting and mapping extension methods.
* **lib/utils/extensions/string\_extentions.dart**
  String helpers for digit extraction and date validation.
* **lib/utils/validates/generic\_validations.dart**
  Common validation rules for names, numbers, dates, and phone numbers.

### Conclusion

All new theming layers and UI building blocks are in place, providing a consistent and flexible foundation for the app’s interface.


## 2025/06/25 home_view - by rudsonalves

### Update Android NDK, integrate shopping & products modules, and apply theming

This commit pins the Android NDK version, registers the shopping repository and adds the products repository interface and stub implementation. Dependency injection is updated to provide the new repositories. The app’s theme system is introduced via `MaterialTheme` and a Google Fonts utility, and the main application and router are wired to use the shopping feature. Finally, build dependencies are aligned in `pubspec.yaml`.

### Modified Files

* **android/app/build.gradle.kts**

  * Hardcoded `ndkVersion` to `"27.0.12077973"` instead of using `flutter.ndkVersion`.
* **lib/config/dependencies.dart**

  * Imported `IShoppingRepository` and `ShoppingRepository`.
  * Added provider for `IShoppingRepository` with `ShoppingRepository(database)`.
* **lib/data/repositories/shopping/shopping\_repository.dart**

  * Changed `shoppingList` getter to return an unmodifiable list.
  * Removed redundant duplicate initialization check in `insert()`.
  * Adjusted default `limit` in `fetchAll()` from `9999` and passed it correctly to the database call.
* **lib/data/services/database/database\_service.dart**

  * In `initialize()`, executed `SqlTables.products` and created indexes for `productShoppingIDIndex` and `productBarCodeIndex`.
* **lib/data/services/database/tables/sql\_tables.dart**

  * Extended SQL schema: added `shopping_id` and `description` columns to `products` table.
  * Added `productShoppingIDIndex` and `productBarCodeIndex` definitions.
* **lib/main\_app.dart**

  * Imported theme and util modules.
  * Initialized a `brightness` field and selected light/dark theme via `MaterialTheme`.
* **lib/routing/router.dart**

  * Injected `IShoppingRepository` into `HomeViewModel` via `context.read`.
* **lib/ui/view/home/home\_view\.dart**

  * Added elevation to the AppBar for visual depth.
* **lib/ui/view/home/home\_view\_model.dart**

  * Updated `HomeViewModel` to accept `IShoppingRepository`, initialize with a `Command0`, and expose `shopping` getter.
* **pubspec.yaml**

  * Added `google_fonts: ^6.2.1` dependency.

### New Files

* **lib/data/repositories/products/i\_products\_repository.dart**
  Defines the `IProductsRepository` interface for product CRUD operations scoped to a shopping list.
* **lib/data/repositories/products/products\_repository.dart**
  Provides a stub implementation of `ProductsRepository` with in-memory caching, `initialize`, `insert`, `fetch`, and `fetchAll`; `update` and `delete` methods marked `TODO`.
* **lib/ui/core/themes/theme.dart**
  Introduces `MaterialTheme` class with light and dark color schemes (multiple contrast levels) using Material 3 `ColorScheme`.
* **lib/ui/core/themes/util.dart**
  Adds `createTextTheme()` helper to combine Google Fonts for body and display text styles.

### Conclusion

All updates are implemented successfully and the new shopping, products, and theming modules are fully wired and ready for further development.


## 2025/06/24 shopping_repository - by rudsonalves

### Add Makefile, shopping repository, and enhance database service

This commit introduces a Makefile for streamlined development commands, implements a new shopping feature with repository interfaces and implementations, and augments the `DatabaseService` to support ordering, pagination, and extended SQL table definitions. These changes lay the groundwork for CRUD operations on a shopping list.

### Modified Files

* **lib/data/services/database/database\_service.dart**

  * Added optional `orderBy`, `limit`, and `offset` parameters to query methods.
  * Defaulted `sortBy` to `'created_at ASC'` when no ordering is provided.
  * Passed `orderBy`, `limit`, and `offset` through to `_db!.query`.
* **lib/data/services/database/tables/sql\_tables.dart**

  * Renamed standalone `SqlTables` to include a `shopping` table constant.
  * Added `Tables.shopping` and `Tables.products` to the table definitions.

### New Files

* **Makefile**
  Defines common development tasks:

  * `diff` to stage and view pending changes.
  * `push` and `push_branch` to enforce branch protection on `main`/`master`.
  * `rebuild` for Flutter clean and fetch.
  * `test_coverage` and `test_serial` for running tests with coverage.
  * `update_splash` and `update_launcher_icons` to regenerate assets via CLI.
* **lib/data/repositories/shopping/i\_shopping\_repository.dart**
  Declares the `IShoppingRepository` interface for shopping list CRUD operations and initialization.
* **lib/data/repositories/shopping/shopping\_repository.dart**
  Implements `ShoppingRepository` with in-memory caching, initialize logic, and `insert`, `fetch`, `fetchAll`, `update`, and `delete` methods using `DatabaseService`.

### Conclusion

All tasks are implemented and the shopping feature is fully integrated and ready for use.
