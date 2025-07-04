# Changelog

This is a list of changes made to the codebase since the last release.

## 2025/07/04 last_price_repository-09 - rudsonalves

### Refactor repo structure, add CartItemDto and SuggestionTextField

This commit reorganizes the cart items repository paths, enriches category and product repository interfaces and implementations, and introduces robust error handling in the database layer. It also adds a new `CartItemDto` for decoupling item creation from domain models, enhances the `ProductDto` and `ProductModel` to support category metadata, and implements a `SuggestionTextField` component for improved category/subcategory selection in the UI.

### Modified Files

* **docs/Diagrama\_de\_Classes.drawio**

  * Updated Draw\.io file to the latest version metadata.

* **lib/config/dependencies.dart**

  * Adjusted import paths for `cart_items` repositories.
  * Initialized `CategoryRepository` before providing it.
  * Replaced inline provider creation with the pre-initialized `categoryRepository` instance.

* **lib/data/repositories/cart\_items/**

  * Renamed `items/cart_items_repository.dart` and `items/i_cart_items_repository.dart` to `cart_items/cart_items_repository.dart` and `cart_items/i_cart_items_repository.dart`.

* **lib/data/repositories/category/category\_repository.dart**

  * Renamed `fetchCategories` → `fetchAllCategories` and `fetchSubCategories` → `fetchAllSubCategories`.
  * Removed single `_categoryId` field in favor of a `_loadsCategoryIds` cache list.
  * Added `category(String)` getter, `getSubCategory(...)` async lookup, and private helper `_subCategoriesList(...)`.
  * Updated `updateSubCategory` signature casing.
  * Streamlined subcategory caching logic.

* **lib/data/repositories/category/i\_category\_repository.dart**

  * Updated interface to match renamed methods: `fetchAllCategories`, `fetchAllSubCategories`.
  * Added getters `subCategories`, `getSubCategory(...)`, and `category(String)`.

* **lib/data/repositories/products/i\_products\_repository.dart**

  * Added `fetchByBarCode(String barCode)` to interface.

* **lib/data/repositories/products/products\_repository.dart**

  * Implemented `fetchByBarCode` with filter query and in-memory caching.

* **lib/data/services/database/database\_service.dart**

  * Imported `RecordNotFoundException`.
  * Replaced all generic `Exception('No record found…')` throws with `RecordNotFoundException` for consistency.

* **lib/data/services/database/tables/sql\_tables.dart**

  * Added `categoryName` and `subCategoryName` columns to `ProductColumns` and SQL table schema.

* **lib/domain/dto/product/product\_dto.dart**

  * Imported `ProductModel`.
  * Added `category` and `subCategory` fields.
  * Introduced `isEqualModel` method to compare DTO and model.

* **lib/domain/models/product/product\_model.dart**

  * Added `category` and `subCategory` fields and updated JSON serialization in `.g.dart`.

* **lib/domain/user\_cases/shopping\_cart\_user\_case.dart**

  * Updated imports to new `cart_items` path.
  * Exposed `categories` and `subCategories` getters.
  * Implemented `findProductByBarCode` to fetch the product and preload subcategories.
  * Renamed and added helper methods for subcategory fetching.

* **lib/routing/router.dart**

  * Updated import for cart items repository.
  * Changed AddProductCart route builder to accept `ShoppingModel` via `state.extra`.

* **lib/ui/core/ui/form\_fields/basic\_form\_field.dart**

  * Added `errorText`, `labelStyle`, `onFieldSubmitted`, `initialValue` parameters.
  * Wired `initialValue`, `errorText`, `labelStyle` into `InputDecoration` and field callbacks.

* **lib/ui/view/cart\_shopping/add\_product\_cart/add\_product\_cart\_view\.dart**

  * Switched to `SugestionTextField` for category/subcategory input.
  * Added `ShoppingModel` to widget constructor and route passing.
  * Introduced `RecordNotFoundException`–based UI messaging.
  * Updated save logic to build `CartItemDto`.

* **lib/ui/view/cart\_shopping/add\_product\_cart/add\_product\_cart\_view\_model.dart**

  * Switched save command to accept `CartItemDto`.
  * Added `fetchAllSubcategories` command.
  * Implemented product creation/update before item save.

* **lib/ui/view/cart\_shopping/cart\_shopping\_view\_model.dart**

  * Updated import path for cart items repository.

### New Files

* **lib/data/services/exceptions/exceptions.dart** — Defines `RecordNotFoundException` for clearer error handling.
* **lib/domain/dto/cart\_item\_dto/cart\_item\_dto.dart** — Freezed DTO for cart item creation.
* **lib/ui/core/ui/form\_fields/sugestion\_text\_field.dart** — New auto-complete text field for suggestion-based input.

### Conclusions

All changes are complete and the system remains fully functional.


## 2025/07/03 last_price_repository-08 - by rudsonalves

### Enhance category repo, add QR scanner flow, and rename number controller

This update improves subcategory loading by ID, integrates a QR code scanner into the “Add Product” workflow, and standardizes numeric input handling. It refactors product DTO/model fields to use `category_id` and `sub_category_id`, injects new commands into the view model, and adds utility and scanner view files.

### Modified Files

* **Makefile**

  * Added `run_build_runner_watch` target and swapped its behavior with `run_build_runner`.

* **lib/config/dependencies.dart**

  * Registered `ICategoryRepository` with `CategoryRepository(dbService)`.

* **lib/data/repositories/category/category\_repository.dart**

  * Introduced `_loadsCategoryIds` to avoid redundant subcategory fetches.
  * Removed unnecessary clearing of `_subCategories`.
  * Added `fetchSubCategory(String)` to load a single subcategory by ID.
  * Moved and documented `_findCategoryId` and `_findSubCategoryId` helper methods.

* **lib/data/repositories/category/i\_category\_repository.dart**

  * Extended interface with `fetchSubCategory` declaration and detailed DartDoc for each method.

* **lib/domain/dto/product/product\_dto.dart**

  * Renamed `category` → `@JsonKey('category_id') categoryId` and `subcategory` → `@JsonKey('sub_category_id') subCategoryId`.

* **lib/domain/models/product/product\_model.dart**

  * Updated model fields to match DTO: `categoryId` and `subCategoryId`.

* **lib/domain/user\_cases/shopping\_cart\_user\_case.dart**

  * Injected `ICategoryRepository`.
  * Added `findProductByBarCode` and `getSubCategory` methods to support lookup by barcode and subcategory retrieval.

* **lib/routing/router.dart**

  * Provided `categoryRepository` to `ShoppingCartUserCase`.
  * Added `GoRoute` for the scanner view.
  * Imported `QrCodeScannerView`.

* **lib/routing/routes.dart**

  * Declared new `scanner` route constant.

* **lib/ui/core/ui/editing\_controllers/number\_editing\_controller.dart**

  * Renamed from `currency_editing_controller.dart` to `number_editing_controller.dart`.
  * Changed regex to allow digits only and renamed `currencyValue` → `numberValue`.

* **lib/ui/view/cart\_shopping/add\_product\_cart/add\_product\_cart\_view\.dart**

  * Integrated snack bar feedback and GoRouter push to the scanner route.
  * Added listener for `findProductByBarCode`, showing a loading dialog and populating fields on success.
  * Captured scanned code and triggered barcode lookup.
  * Stored `categoryId`/`subCategoryId` for subsequent subcategory fetch.

* **lib/ui/view/cart\_shopping/add\_product\_cart/add\_product\_cart\_view\_model.dart**

  * Added `findProductByBarCode` and `getSubCategory` `Command1` instances.

### New Files

* **lib/ui/view/scanner\_barcode/scanner\_barcode\_view\.dart**
  Implements a full-screen QR/barcode scanner using `mobile_scanner`, returning the scanned value on pop.

* **lib/utils/extensions/list\_equality.dart**
  Provides `ListEquality` for deep list comparisons, copied from the Dart `collection` package.

### Conclusion

With these changes, the app now supports barcode-driven product lookup, efficient subcategory fetching, and a unified numeric input controller, ensuring a smoother “Add Product” experience.


## 2025/07/02 last_price_repository-07 - by rudsonalves

### Implement category management layer and enrich DatabaseService documentation

This commit introduces a new category management layer by defining the `ICategoryRepository` interface, its `CategoryRepository` implementation, and the `SubCategoryDto`. It also registers the category repository in the dependency graph and enriches the `DatabaseService` with detailed documentation for common CRUD operations.

### Modified Files

* **Makefile**

  * Added `run_build_runner_watch` target for selective build\_runner watching.
  * Swapped the definitions of `run_build_runner_watch` and `run_build_runner` commands.

* **lib/config/dependencies.dart**

  * Imported `ICategoryRepository` and `CategoryRepository`.
  * Provided `CategoryRepository(dbService)` under `ICategoryRepository` in the dependency list.

* **lib/data/services/database/database\_service.dart**

  * Added XML-style DartDoc comments for `fetchById`, `fetchByFilter`, `fetchAll`, `insert`, `set`, `update`, `updateWhere`, `delete`, and `deleteWhere`.
  * Clarified parameter descriptions and return semantics for each CRUD method.

* **lib/domain/dto/product/product\_dto.dart**

  * Adjusted import to use project-root relative path for `SaleBy` enum (`/domain/enums/enums.dart`).

* **lib/domain/models/sub\_category/sub\_category\_model.dart**

  * Imported `SubCategoryDto`.
  * Added `factory SubCategoryModel.fromDto(String id, SubCategoryDto dto)` for DTO-to-model mapping.

### New Files

* **lib/data/repositories/category/i\_category\_repository.dart**
  Defines the `ICategoryRepository` interface for fetching, inserting, updating, and deleting categories and subcategories.

* **lib/data/repositories/category/category\_repository.dart**
  Implements `ICategoryRepository`, managing in-memory caches and delegating CRUD calls to `DatabaseService`.

* **lib/domain/dto/sub\_category/sub\_category\_dto.dart**
  Freezed DTO class for serializing and deserializing subcategory payloads, with JSON support.

### Conclusion

Category management infrastructure is now in place, and the `DatabaseService` is fully documented for robust data operations.


## 2025/07/02 last_price_repository-06 - by rudsonalves

### Implement category support, saleBy enums, and enhance cart flow

This commit introduces full support for product categories and subcategories across the database, DTOs, models, and UI. It also replaces the deprecated `isUnitPrice` flag with a `SaleBy` enum, updates routing for the cart flow, and enriches the “Add to Cart” form with quantity, weight, and category selectors. Additionally, the database bootstrap now populates initial category data.

### Modified Files

* **Makefile**

  * Refined `run_build_runner` command to only watch domain models and DTOs under `lib/domain/models/**` and `lib/domain/dtos/**`.

* **docs/Diagrama\_de\_Classes.drawio**

  * Updated class diagram to reflect new `CategoryModel`, `SubCategoryModel`, and `SaleBy` relationships.

* **ios/Runner/Info.plist**

  * Added `NSCameraUsageDescription` and `NSPhotoLibraryUsageDescription` keys for QR code scanning and photo library access.

* **lib/data/repositories/items/cart\_items\_repository.dart**

  * Removed obsolete `_isInitialized` flag.
  * Changed initialization guard to check `_shoppingId` equality instead of a boolean.

* **lib/data/services/database/database\_manager.dart**

  * Imported `CategoryModel`, `SubCategoryModel`, and `Uuid`.
  * Created `categories` and `subCategories` tables and indexes in `_onCreate`.
  * Added `_populateCategoriesTables` to seed initial category/subcategory data on database creation.

* **lib/data/services/database/tables/sql\_configurations.dart**

  * Defined `categories` map constant with all category names and their subcategories.

* **lib/data/services/database/tables/sql\_tables.dart**

  * Added `Tables.categories`, `Tables.subCategories`, `CategoriesColumns`, and `SubCategoriesColumns`.
  * Modified `products`, `items`, and `lastPrice` table definitions to include `sale_by`, `category_id`, and `sub_category_id` columns, plus corresponding foreign keys.
  * Added creation statements and indexes for `categories` and `sub_categories` tables.

* **lib/domain/dto/product/product\_dto.dart**

  * Replaced `isUnitPrice` boolean with `saleBy: SaleBy` enum.
  * Added optional `category` and `subcategory` fields.

* **lib/domain/enums/enums.dart**

  * Renamed `byUnit`/`byWeight` to `unit`/`weight` in `SaleBy` enum, updating their labels.

* **lib/domain/user\_cases/shopping\_cart\_user\_case.dart**

  * Added `save` and `update` stubs returning delayed `Result.success`, preparing for real repository calls.

* **lib/routing/router.dart**

  * Switched `GoRoute` for `/shopping` into a `ShellRoute`, providing `ShoppingCartUserCase` via `Provider`.
  * Updated nested routes for `addProductCart`, passing `userCase` to view models.

* **lib/routing/routes.dart**

  * Adjusted `addProductCart` route’s path to be relative under `/shopping`.

* **lib/ui/core/ui/form\_fields/basic\_form\_field.dart**

  * Added `prefixIcon`, `suffixIcon`, `prefixText`, `suffixText`, and `textAlign` properties.
  * Defaulted to `widget.border` or an `OutlineInputBorder` from theme.
  * Unified icon logic to respect provided widgets over icons.

* **lib/ui/view/cart\_shopping/add\_product\_cart/add\_product\_cart\_view\.dart**

  * Integrated `_barCodeController`, category and subcategory text fields.
  * Introduced `ValueNotifier<SaleBy>` to switch between unit/weight modes.
  * Added quantity increment/decrement and weight input logic.
  * Wrapped action button in `ListenableBuilder` and replaced with `BigButton`.
  * Disposed all controllers in `dispose()`.

* **lib/ui/view/cart\_shopping/add\_product\_cart/add\_product\_cart\_view\_model.dart**

  * Injected `ShoppingCartUserCase` dependency.
  * Defined `save` and `update` commands invoking user case methods.

* **lib/ui/view/cart\_shopping/cart\_shopping\_view\.dart**

  * Updated `_addProductCart()` to push nested route including shopping path and extra model.

* **lib/utils/validates/generic\_validations.dart**

  * Added `notZero` validator to ensure numeric inputs are greater than zero.

* **pubspec.yaml**

  * Bumped `go_router` to `^16.0.0`.
  * Added `mobile_scanner: ^7.0.1` dependency for barcode scanning.

### New Files

* **lib/domain/models/category/category\_model.dart**
  Defines the `CategoryModel` Freezed data class for product categories.

* **lib/domain/models/sub\_category/sub\_category\_model.dart**
  Defines the `SubCategoryModel` Freezed data class, linking to `CategoryModel`.

### Conclusion

With these changes, category management and the enhanced cart workflow—including sale modes, routing, and form improvements—are fully integrated and functional.


## 2025/07/01 last_price_repository-05 - by rudsonalves

### Refactor cart dependencies and implement AddProductCart feature

This commit refactors dependency imports and the shopping cart flow to support a new “Add Product to Cart” feature. It standardizes import paths, replaces the cart items provider with `ChangeNotifierProvider`, and renames existing shopping views and view models to the cart-specific equivalents. A new screen and view model for adding products to the cart have also been added.

### Modified Files

#### `lib/config/dependencies.dart`

* Switched relative imports to absolute imports for repository interfaces and implementations.
* Replaced `Provider<ICartItemsRepository>` with `ChangeNotifierProvider<ICartItemsRepository>` for cart items.

#### `lib/domain/enums/enums.dart`

* Introduced a new `SaleBy` enum with two values (`byUnit` and `byWeight`) and associated labels.

#### `lib/routing/router.dart`

* Updated imports to include `CartShoppingView`, `CartShoppingViewModel`, `AddProductCartView`, and `AddProductCartViewModel`.
* Renamed the shopping route builder to return `CartShoppingView` with `CartShoppingViewModel`.
* Added a new `GoRoute` for the `/add-product-cart` path.

#### `lib/routing/routes.dart`

* Added a new `addProductCart` constant route.

#### `lib/ui/view/cart_shopping/cart_shopping_view.dart`

* Renamed `ShoppingView` to `CartShoppingView`.
* Updated constructor and state class names accordingly.
* Changed the floating action button’s callback to navigate to the new add-product-cart route.

#### `lib/ui/view/cart_shopping/cart_shopping_view_model.dart`

* Renamed `ShoppingViewModel` to `CartShoppingViewModel` and updated constructor to match the new class name.

### New Files

#### `lib/ui/view/cart_shopping/add_product_cart/add_product_cart_view.dart`

Defines a stateful form view for adding a product to the cart, including fields for name, description, sale type, price, and quantity, plus a barcode scanner button placeholder.

#### `lib/ui/view/cart_shopping/add_product_cart/add_product_cart_view_model.dart`

Introduces an empty `AddProductCartViewModel` class as the view model for the add-product-cart screen.

### Conclusion

All cart-related dependencies and views have been updated, and the Add Product to Cart feature is now integrated and ready for further development.


## 2025/06/30 last_price_repository-04 - by rudsonalves

### Rename item repository to cart repository and integrate shopping cart user case

This commit refactors the item repository into a cart-specific implementation with ChangeNotifier support, updates dependency injection and routing to use the new `ShoppingCartUserCase`, and enhances the edit and shopping views to handle both create and update workflows. The `ShoppingModel` default `totalPrice` is adjusted to 0, and the class diagram is updated to reflect the renamed components. UI and view models are wired to the new use case for a cohesive shopping cart flow.

### Alterations

* **docs/Diagrama\_de\_Classes.drawio**

  * Update mxGraphModel `dx` and `dy` values for layout adjustment.
  * Rename diagram shapes: `ItemsRepository` → `CartItemsRepository` and `ShoppingUserCase` → `ShoppingCartUserCase`.

* **lib/config/dependencies.dart**

  * Replace imports of `i_items_repository.dart`/`items_repository.dart` with `i_cart_items_repository.dart`/`cart_items_repository.dart`.
  * Update provider registration to use `ICartItemsRepository` and `CartItemsRepository`.

* **lib/data/repositories/items/cart\_items\_repository.dart** (formerly `items_repository.dart`)

  * Rename class to `CartItemsRepository`, implement `ICartItemsRepository`, and mix in `ChangeNotifier`.
  * Add `notifyListeners()` calls after each mutation of `_items`.
  * Update constructor signature to `CartItemsRepository`.

* **lib/data/repositories/items/i\_cart\_items\_repository.dart** (formerly `i_items_repository.dart`)

  * Rename abstract class to `ICartItemsRepository` extending `ChangeNotifier`.

* **lib/data/repositories/shopping/shopping\_repository.dart**

  * Mix in `ChangeNotifier` on `ShoppingRepository`.
  * Import `package:flutter/material.dart` to support listener notifications.

* **lib/domain/models/shopping/shopping\_model.dart**

  * Change `totalPrice` to use `@Default(0)` and remove `required`.
  * Provide default value `0` in the factory constructor.

* **lib/routing/router.dart**

  * Add imports for `ICartItemsRepository`, `IProductsRepository`, `ILastPriceRepository`, and `ShoppingCartUserCase`.
  * Modify `EditShopping` route builder to accept a `ShoppingModel` via `state.extra`.
  * Wire `ShoppingCartUserCase` into `ShoppingViewModel` builder for the shopping route.

* **lib/ui/view/home/edit\_shopping/edit\_shopping\_view\.dart**

  * Import `ShoppingModel` and add optional `shopping` parameter to `EditShoppingView`.
  * Introduce `_isEditing` flag and `_initializeForm()` to prefill fields when editing.
  * Adjust AppBar title, button label, and icon based on mode.
  * Listen to both `saving` and new `update` commands and execute update flow when editing.

* **lib/ui/view/home/edit\_shopping/edit\_shopping\_view\_model.dart**

  * Add `update` `Command1<ShoppingModel, ShoppingModel>` for record updates.
  * Implement `_update()` method calling `shoppingRepository.update()` and logging the result.

* **lib/ui/view/home/home\_view\.dart**

  * Rename `_newShopping()` to `_addShopping()` and update `floatingActionButton.onPressed`.
  * Enable edit navigation by calling `context.push(Routes.editShopping.path, extra: shopping)` in `_editShopping()`.

* **lib/ui/view/home/shopping/shopping\_view\.dart**

  * Add a `FloatingActionButton` placeholder for future cart actions.
  * Wrap body in `ListenableBuilder` listening to `viewModel.cartNotifier` to react to cart changes.

* **lib/ui/view/home/shopping/shopping\_view\_model.dart**

  * Implement `ShoppingViewModel` to depend on `ShoppingCartUserCase`.
  * Initialize `load` command to invoke `userCase.load()` and expose `cartNotifier`.

### New Files

* **lib/domain/user\_cases/shopping\_cart\_user\_case.dart**
  Introduce `ShoppingCartUserCase` to coordinate initialization of product, cart items, and last price repositories for a given `ShoppingModel`.

### Conclusion

The refactor is complete and the shopping cart flow is now fully functional.


## 2025/06/28 last_price_repository-03 - by rudsonalves

### Refactor Shopping flow to use IShoppingRepository and introduce edit route

This commit abstracts `ShoppingRepository` behind the `IShoppingRepository` interface, updates DI and routing to use the new interface type, and renames the “new shopping” feature into a unified edit flow with dedicated views and view models. Navigation paths and provider registrations now reflect the interface contract.

### Modified Files

* **lib/config/dependencies.dart**

  * Imported `IShoppingRepository` and registered it with `ChangeNotifierProvider<IShoppingRepository>` instead of concrete `ShoppingRepository`.

* **lib/data/repositories/shopping/i\_shopping\_repository.dart**

  * Extended `ChangeNotifier` in `IShoppingRepository` to support UI listeners.

* **lib/data/repositories/shopping/shopping\_repository.dart**

  * Removed `ChangeNotifier` mixin and `implements`; now extends `IShoppingRepository`.

* **lib/routing/router.dart**

  * Swapped `ShoppingRepository` references for `IShoppingRepository` in builders.
  * Renamed `newShopping` route to `editShopping` and added a `shopping` detail route.
  * Adjusted route imports and added `ShoppingView` entry.

* **lib/routing/routes.dart**

  * Renamed `new_shopping` to `editShopping` (`/edit-shopping`) and added `shopping` (`/shopping`) path.

* **lib/ui/view/home/home\_view\.dart**

  * Tweaked import order.
  * Updated `_newShopping` to push `editShopping` route.
  * Updated `_openShopping` to push new `shopping` route with extra model.

* **lib/ui/view/home/home\_view\_model.dart**

  * Changed type of `_shoppingRepository` parameter from concrete to `IShoppingRepository`.

### New Files

* **lib/ui/view/home/edit\_shopping/edit\_shopping\_view\.dart**
  Renamed and refactored from `new_shopping.dart` to handle both creation and editing flows.

* **lib/ui/view/home/edit\_shopping/edit\_shopping\_view\_model.dart**
  Renamed view model to `EditShoppingViewModel` matching the updated view.

* **lib/ui/view/home/shopping/shopping\_view\.dart**
  New detail screen displaying a single `ShoppingModel`.

* **lib/ui/view/home/shopping/shopping\_view\_model.dart**
  Placeholder view model for the new `ShoppingView`.

### Conclusion

The shopping creation and editing flows now share a unified interface via `IShoppingRepository`, and routing has been updated to support both listing and detail views. The refactor aligns DI, routing, and UI layers under the new interface abstraction.


## 2025/06/28 last_price_repository-02 - by rudsonalves

### Introduce DatabaseManager, DI updates, and refactor DatabaseService

This commit centralizes database initialization into a new `DatabaseManager` class, refactors `DatabaseService` to consume a managed `Database` instance, and updates dependency injection to provide the new manager and service. Repository providers and integration tests are adjusted accordingly.

### Modified Files

* **lib/config/dependencies.dart**

  * Replaced direct `DatabaseService.initialize` with `DatabaseManager` and injected both manager and service.
  * Registered `IProductsRepository`, `IItemsRepository`, and `ILastPriceRepository` alongside existing `ShoppingRepository`.

* **lib/data/services/database/database\_service.dart**

  * Removed internal initialization logic; now accepts a pre-initialized `Database` instance.
  * All `_db` references replaced with the injected `_database` field.

* **lib/data/services/database/tables/sql\_tables.dart**

  * Added foreign key constraints to `items` and `lastPrices` tables for cascading deletes.

* **lib/domain/models/last\_price/last\_price\_model.dart**

  * Corrected import order to prioritize DTO and helper imports after annotations.

* **test/data/repositories/products/products\_repository\_test.dart**

  * Switched to use `DatabaseManager` for setup and teardown instead of manual `DatabaseService` init/close.

* **test/data/repositories/shopping/shopping\_repository\_test.dart**

  * Updated to initialize `DatabaseService` via `DatabaseManager` and close manager in `tearDown`.

### New Files

* **lib/data/services/database/database\_manager.dart**
  Manages SQLite database lifecycle: creation, configuration (foreign keys), upgrades/downgrades, and closing.

* **lib/data/services/database/tables/sql\_configurations.dart**
  Defines database name, version, and PRAGMA statements for configuration.

### Conclusion

Database initialization is now unified under `DatabaseManager`, DI graph updated, and tests adapted—ensuring consistent database handling across the app.


## 2025/06/27 last_price_repository-01 - by rudsonalves

### Extend SQLite boolean handling and add LastPrice repository/tests

This commit refines SQLite integer-to-boolean conversion via a new `SqliteHelpers` utility, updates schema columns for `is_unit_price` fields, and integrates a full-featured LastPrice repository with corresponding interfaces and unit tests. Repository interfaces for items now include `totalPrice()`, and the shared `Result` class gains success/failure flags.

### Modified Files

* **docs/Diagrama\_de\_Classes.drawio**

  * Updated internal diagram dimensions to match the latest class revisions.

* **docs/images/Diagrama\_de\_Classes.png**, **docs/images/MVVM.png**

  * Replaced with refreshed exports reflecting updated column and model changes.

* **lib/data/repositories/items/i\_items\_repository.dart**

  * Added `totalPrice()` signature to the items repository interface.

* **lib/data/repositories/items/items\_repository.dart**

  * Implemented `@override totalPrice()` annotation for consistency.

* **lib/data/services/database/tables/sql\_tables.dart**

  * Changed DDL default types for `is_unit_price` from BOOLEAN to INTEGER (0/1).

* **lib/domain/dto/last\_price/last\_price\_dto.dart**

  * Introduced `fromJson`/`toJson` converters (`SqliteHelpers`) on `isUnitPrice` key.

* **lib/domain/dto/product/product\_dto.dart**

  * Applied same integer-to-boolean converters to `ProductDto.isUnitPrice`.

* **lib/domain/models/item/item\_model.dart**

  * Added JSON converters on `ItemModel.isUnitPrice`.

* **lib/domain/models/last\_price/last\_price\_model.dart**

  * Applied converters to `LastPriceModel.isUnitPrice`.

* **lib/domain/models/product/product\_model.dart**

  * Integrated converters on `ProductModel.isUnitPrice`.

* **lib/utils/result.dart**

  * Introduced `isSuccess` and `isFailure` getters to simplify result checking.

* **pubspec.yaml**

  * Added `sqflite_common_ffi` dependency for desktop testing and `path_provider`.

### New Files

* **lib/domain/models/sqlite\_helpers.dart**
  Utility class for converting between Dart `bool` and SQLite integer (0/1).

* **lib/data/repositories/last\_price/i\_last\_price\_repository.dart**
  Repository interface defining CRUD operations for last-price entries.

* **lib/data/repositories/last\_price/last\_price\_repository.dart**
  Concrete implementation managing in-memory cache and database persistence of last-price records.

* **test/data/repositories/products/products\_repository\_test.dart**
  Integration tests for `ProductsRepository` using in-memory SQLite via `sqflite_common_ffi`.

* **test/data/repositories/shopping/shopping\_repository\_test.dart**
  Integration tests for `ShoppingRepository` with desktop SQLite support.

### Conclusion

All changes for integer-based boolean handling and the new LastPrice feature are in place, and comprehensive tests confirm full functionality.


## 2025/06/27 structural_adjustments-01 - by rudsonalves

### Add last-price tracking and unit-price support across data models

This commit extends the shopping app’s data model and persistence layer to support “last price” records and unify unit-based pricing. Schema definitions, repositories, DTOs, and domain models have been updated accordingly, and documentation (README and class diagrams) reflects these enhancements.

### Modified Files

* **README.md**

  * Expanded project description with MVVM architecture overview.
  * Added class- and MVVM-diagram image references.
  * Clarified three-layer structure (Data, Domain, UI) and main architectural branches.

* **docs/Diagrama\_de\_Classes.drawio**

  * Adjusted `mxGraphModel` dimensions to match updated diagrams.

* **lib/data/repositories/items/items\_repository.dart**

  * Renamed `prince` → `unitPrice` field.
  * Updated `totalPrice()` to use `unitPrice` instead of legacy `prince`.

* **lib/data/services/database/database\_service.dart**

  * Included execution of `lastPrices` table and its index in batch setup.
  * Added grouping comments for “Tables” and “Indexes”.

* **lib/data/services/database/tables/sql\_tables.dart**

  * Added `last_price` table DDL and index.
  * Introduced `is_unit_price`, `unit_price`, and `created_at` columns for `items`.
  * Added `is_unit_price` flag to `products`.

* **lib/domain/dto/product/product\_dto.dart**

  * Added `isUnitPrice` boolean (default `true`) to `ProductDto` fields and factory.

### New Files

* **docs/images/Diagrama\_de\_Classes.png**
  PNG export of the updated class diagram.

* **docs/images/MVVM.png**
  Visualization of the MVVM architecture branches.

* **lib/domain/dto/last\_price/last\_price\_dto.dart**
  Freezed DTO for “last price” records, including `productId`, `isUnitPrice`, `lastUnitPrice`, and `createdAt`.

* **lib/domain/models/last\_price/last\_price\_model.dart**
  Domain model for “last price” entries with factory constructors and JSON support.

### Assets and Test Data

* **Diagram Images**

  * `docs/images/Diagrama_de_Classes.png`
  * `docs/images/MVVM.png`

### Conclusion

All enhancements for last-price tracking and unit-based pricing are in place, and the application is now fully functional.


## 2025/06/27 home_view-test-01 - by rudsonalves

### Update class diagram, dependency injection, repositories, DTOs, and UI enhancements

This commit refines the class diagram geometry, modernizes dependency registration to use `ChangeNotifierProvider`, enriches repositories with notification support, adds default values and nullability to DTOs, introduces rich UI interactions in the Home view (including swipe-to-edit/delete and a shopping list tile), embeds new enum icons, and extends the diagram with a `LastPriceModel` swimlane.

### Modified Files

* **docs/Diagrama\_de\_Classes.drawio**

  * adjusted `dx`/`dy` values, swimlane geometries, and edge point arrays
  * highlighted `ShoppingDto`/`ProductDto` parameters in bold
  * added `LastPriceModel` swimlane with fields and repository edges
* **lib/config/dependencies.dart**

  * replaced dual `Provider<IShoppingRepository>` with a single `ChangeNotifierProvider<ShoppingRepository>`
  * commented out legacy interface provider
* **lib/data/repositories/shopping/shopping\_repository.dart**

  * extended `ShoppingRepository` from `ChangeNotifier`
  * added `notifyListeners()` on insert, update, delete, and load
  * imported `flutter/material.dart` to support `ChangeNotifier`
* **lib/domain/dto/shopping/shopping\_dto.dart**

  * moved `totalPrice` default into constructor, removed explicit `required`
* **lib/domain/enums/enums.dart**

  * added `IconData iconData` to `ShoppingType` enum entries
  * imported `material_symbols_icons`
* **lib/routing/router.dart**

  * reordered imports, read repository via `ctx.read<ShoppingRepository>()`
  * aligned builder contexts (`ctx` vs `context`)
* **lib/ui/view/home/home\_view\.dart**

  * wired `HomeViewModel.delete` listener for delete feedback
  * wrapped body in `ListenableBuilder` showing loading, empty state, or `ListView`
  * implemented swipe-to-edit and swipe-to-delete via `Dismissible`
* **lib/ui/view/home/home\_view\_model.dart**

  * switched from interface to `ShoppingRepository` dependency
  * initialized `load` immediately and added `delete` command
  * exposed `shoppings` and `notifier` from repository
* **lib/ui/view/new\_shoppint/new\_shopping.dart**

  * switched to `ShoppingDto.create(...)` factory
* **lib/ui/view/new\_shoppint/new\_shopping\_view\_model.dart**

  * removed artificial 2 s delay after save
* **lib/domain/dto/shopping/shopping\_dto.freezed.dart** and **.g.dart**

  * no manual edits (regenerated by build runner)

### New Files

* **lib/ui/view/home/widgets/shopping\_list\_tile.dart**
  Stateless widget displaying each shopping entry with leading icon, title, subtitle, formatted date, price label, and swipe actions for edit/delete.

### Conclusion

All components are now reactive with provider notifications, DTOs are safer with defaults and nullability, and the UI supports robust list interactions—system is ready for further feature development.


## 2025/06/26 home_view-04 - by rudsonalves

### Add nullable timestamps, default values, NewShopping feature, and build runner command

These changes enhance data handling by making `createdAt`/`updatedAt` fields nullable and providing default values, streamline development with a new `run_build_runner` target, and introduce a complete “New Shopping” flow. UI components, routing, and theming adjustments ensure consistency and usability across the app.

### Modified Files

* **Makefile**

  * appended a `run_build_runner` target to watch code generation
* **docs/Diagrama\_de\_Classes.drawio**

  * adjusted geometry coordinates and updated swimlane labels for consistency
* **lib/config/dependencies.dart**

  * removed duplicate `IShoppingRepository` provider registration
* **lib/domain/dto/product/product\_dto.dart**

  * changed `createdAt`/`updatedAt` to nullable
* **lib/domain/dto/product/product\_dto.freezed.dart**

  * updated copyWith and constructor signatures to accept nullable timestamps
* **lib/domain/dto/product/product\_dto.g.dart**

  * added null checks when parsing/serializing JSON dates
* **lib/domain/dto/shopping/shopping\_dto.dart**

  * introduced default `totalPrice` of 0 and made timestamps nullable
* **lib/domain/dto/shopping/shopping\_dto.freezed.dart**

  * adjusted generated code for default value and nullable fields
* **lib/domain/dto/shopping/shopping\_dto.g.dart**

  * support null JSON timestamps and default `total_price`
* **lib/domain/models/product/product\_model.dart**

  * made `createdAt`/`updatedAt` nullable
* **lib/domain/models/product/product\_model.freezed.dart**

  * updated generated code to handle nullable timestamps
* **lib/domain/models/product/product\_model.g.dart**

  * added null checks in JSON parsing/serialization
* **lib/domain/models/shopping/shopping\_model.dart**

  * made `createdAt`/`updatedAt` nullable
* **lib/domain/models/shopping/shopping\_model.freezed.dart**

  * updated generated code for nullable timestamps
* **lib/domain/models/shopping/shopping\_model.g.dart**

  * handle optional JSON date fields
* **lib/routing/router.dart**

  * imported and registered `NewShopping` route
* **lib/routing/routes.dart**

  * added `newShopping` route constant
* **lib/ui/core/themes/dimens.dart**

  * increased `spacingVertical` from 12.0 to 18.0
* **lib/ui/core/ui/buttons/big\_button.dart**

  * commented out unused `colorScheme` reference
* **lib/ui/core/ui/form\_fields/basic\_form\_field.dart**

  * removed unused import and commented out default border logic
* **lib/ui/core/ui/form\_fields/enum\_form\_field.dart**

  * introduced `EnumFormLayout` enum and added layout–dependent rendering (`Wrap`, `Row`)
* **lib/ui/view/home/home\_view\.dart**

  * simplified new-shopping action to use `context.push` with GoRouter

### New Files

* **lib/ui/view/new\_shoppint/new\_shopping.dart**
  Provides the UI scaffolding and form for creating a new shopping entry, including validation and feedback.
* **lib/ui/view/new\_shoppint/new\_shopping\_view\_model.dart**
  Implements the view model for shopping creation, orchestrating repository calls and handling success/error logging.

### Conclusion

All changes implemented successfully and the New Shopping feature is fully functional.


## 2025/06/26 home_view-03 - by rudsonalves

### Add ItemsRepository and item table support; unify database APIs and adjust repository imports

### Introduction

This commit introduces a new `IItemsRepository` interface and its `ItemsRepository` implementation to manage shopping items. The database service gains `fetchByFilter`, `updateWhere`, and `deleteWhere` methods; SQL table definitions now include an `items` table with appropriate columns and primary keys. Repository constructors are standardized to use a single `_dbService` instance, and import ordering is aligned. Freezed annotation import is repositioned in the shopping model.

### Modified Files

* **`lib/data/repositories/products/products_repository.dart`**

  * Renamed `_databaseService` to `_dbService` and updated constructor parameter.
  * Switched to `insert<ProductDto>` and `fetchById`/`fetchAll`/`update`/`delete` methods on `_dbService`.
* **`lib/data/repositories/shopping/shopping_repository.dart`**

  * Renamed `_database` to `_dbService` and updated constructor.
  * Standardized initialization to await `fetchAll` and handle success/failure cases.
  * Swapped to `insert<ShoppingDto>` and `fetchById`/`fetchAll`/`update`/`delete` on `_dbService`.
* **`lib/data/services/database/database_service.dart`**

  * Added `fetchByFilter`, `updateWhere`, and `deleteWhere` methods for filtered operations.
  * Adjusted `fetchAll` signature to accept nullable `limit` and `offset`.
  * Executed `SqlTables.items` creation during initialization.
* **`lib/data/services/database/tables/sql_tables.dart`**

  * Extended `Tables` constants with `items`.
  * Expanded `SqlTables` to define `items` table SQL (with composite primary key).
  * Replaced `productShoppingIDIndex` with `productNameIndex` for product name lookups.
  * Updated `ShoppingColumns` and `ProductColumns` to reflect renamed fields.
* **`lib/domain/models/shopping/shopping_model.dart`**

  * Moved `freezed_annotation` import above DTO import for consistency.

### New Files

* **`lib/data/repositories/items/i_items_repository.dart`**
  Defines the `IItemsRepository` interface with CRUD and initialization methods for `ItemModel`.
* **`lib/data/repositories/items/items_repository.dart`**
  Implements `IItemsRepository`, managing an in-memory map of `ItemModel` instances and persisting via the enhanced `DatabaseService`.

### Conclusion

With item support fully integrated and database operations unified, the data layer is now more robust and consistent. The system compiles and item management functions are ready for testing.


## 2025/06/26 home_view-02 - by rudsonalves

### Refactor repository structure to use DTOs, Freezed models, and absolute imports; enhance UI components and update linting


This commit restructures the data layer by introducing `*Dto` classes and migrating existing models to Freezed, streamlines repository interfaces and implementations, and standardizes import paths to absolute references. It also adds UI helpers (button signatures and bottom sheet dialogs), updates lint rules, and refines theme dimensions. The `.gitignore` and analysis options are adjusted, and a Draw\.io class diagram is added under `docs/`.

### Modified Files

* **`.gitignore`**

  * Added `*.bkp` pattern to exclude backup files.
* **`analysis_options.yaml`**

  * Ignored `invalid_annotation_target` analyzer error.
* **`lib/config/dependencies.dart`**

  * Switched to absolute imports for repository and service files.
* **`lib/data/repositories/products/i_products_repository.dart`**

  * Updated method signatures to accept `ProductDto` and removed shoppingId parameter.
* **`lib/data/repositories/products/products_repository.dart`**

  * Introduced `_isInitialized` flag, adapted `insert`, `fetchAll`, `update`, and `delete` to use DTO-to-model mapping and Freezed `fromJson`.
* **`lib/data/repositories/shopping/i_shopping_repository.dart`**

  * Changed `insert` to accept `ShoppingDto`.
* **`lib/data/repositories/shopping/shopping_repository.dart`**

  * Refactored `insert`, `fetchAll`, and `update` to use DTOs and Freezed mapping; adjusted default fetch limit.
* **`lib/main.dart`**, **`lib/main_app.dart`**, **`lib/routing/router.dart`**

  * Converted all package imports to absolute (`/…`) paths.
* **`lib/ui/core/themes/dimens.dart`**

  * Increased `spacingVertical` from `6.0` to `12.0`.
* **`lib/ui/core/ui/form_fields/basic_form_field.dart`**

  * Extracted `border` definition into a variable and reused in `InputDecoration`.
* **`lib/ui/view/home/home_view.dart`**

  * Imported new dialog and form-field widgets; added `_newShopping` method to show a bottom sheet for creating purchases.

### New Files

* **`docs/Diagrama_de_Classes.drawio`**
  Draw\.io class diagram illustrating the domain entities, DTOs, repositories, services, and view models.
* **`lib/domain/dto/product/product_dto.dart`**, **`.freezed.dart`**, **`.g.dart`**
  Defines `ProductDto` with factory constructors for creation and JSON serialization.
* **`lib/domain/dto/shopping/shopping_dto.dart`**, **`.freezed.dart`**, **`.g.dart`**
  Defines `ShoppingDto` analogously for shopping records.
* **`lib/domain/enums/enums.dart`**
  Introduces `ShoppingType` enum with localized labels.
* **`lib/domain/models/item/item_model.dart`**, **`.freezed.dart`**, **`.g.dart`**
  New `ItemModel` Freezed class with default quantity.
* **`lib/domain/models/product/product_model.dart`**, **`.freezed.dart`**, **`.g.dart`**
  Freezed-based `ProductModel` with `fromDto` and `fromJson` factories.
* **`lib/domain/models/shopping/shopping_model.dart`**, **`.freezed.dart`**, **`.g.dart`**
  Freezed-based `ShoppingModel` mirroring the DTO and domain logic.
* **`lib/ui/core/ui/buttons/button_signature.dart`**
  Generic `ButtonSignature` class to unify button definitions in dialogs.
* **`lib/ui/core/ui/dialogs/bottom_sheet_dialog.dart`**
  Reusable bottom sheet dialog widget accepting a title, body content, and button signatures.

### Assets and Test Data

* **Draw\.io diagram** under `docs/Diagrama_de_Classes.drawio`

### Conclusion

All layers have been refactored to use DTOs and Freezed models with consistent import paths. New UI components and lint settings are in place, and the system builds and runs as expected.


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
