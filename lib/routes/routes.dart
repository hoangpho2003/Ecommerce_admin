class HptRoutes {
  static const login = '/login';
  static const forgetPassword = '/forget-password/';
  static const resetPassword = '/reset-password';
  static const dashboard = '/dashboard';
  static const media = '/media';
  static const banners = '/banners';
  static const createBanner = '/createBanner';
  static const editBanner = '/editBanner';
  static const products = '/products';
  static const createProduct = '/createProducts';
  static const editProduct = '/editProduct';
  static const categories = '/categories';
  static const createCategory = '/createCategory';
  static const editCategory = '/editCategory';
  static const brands = '/brands';
  static const createBrand = '/createBrand';
  static const editBrand = '/editBrand';
  static const customers = '/customers';
  static const createCustomer = '/createCustomer';
  static const customerDetails = '/customerDetails';
  static const orders = '/orders';
  static const ordersDetails = '/ordersDetails';
  static const coupons = '/coupons';
  static const settings = '/settings';
  static const logout = '/login';

  static List sidebarMenuItems = [
    dashboard,
    media,
    categories,
    brands,
    banners,
    products
  ];
}
