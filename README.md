# compras

A new Flutter project.

# Changelog

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
