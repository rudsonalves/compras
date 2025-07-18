class Route {
  final String name;
  final String path;

  const Route(this.name, this.path);
}

abstract final class Routes {
  static const home = Route('home', '/');
  static const shopping = Route('shopping', '/shopping');
  static const editShopping = Route('editShopping', '/edit-shopping');
  static const addProductCart = Route(
    'addProductCart',
    'add-product-cart', // Relative route here!
  );
  static const scanner = Route('scanner', '/scanner');
  static const searchCategory = Route('searchCategory', '/search-category');
}
