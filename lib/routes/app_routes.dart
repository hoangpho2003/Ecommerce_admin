import 'package:ecommerce_admin/features/authentication/Screens/forget_password/forget_password.dart';
import 'package:ecommerce_admin/features/authentication/Screens/reset_password/reset_password.dart';
import 'package:ecommerce_admin/features/media/screens/media.dart';
import 'package:ecommerce_admin/routes/routes.dart';
import 'package:ecommerce_admin/routes/routes_middleware.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../features/authentication/Screens/login/login.dart';
import '../features/shop/screens/banner/all_banner/banner.dart';
import '../features/shop/screens/banner/create_banner/create_banner.dart';
import '../features/shop/screens/banner/edit_banner/edit_banner.dart';
import '../features/shop/screens/brand/all_brands/brands.dart';
import '../features/shop/screens/brand/create_brands/create_brand.dart';
import '../features/shop/screens/brand/edit_brands/edit_brand.dart';
import '../features/shop/screens/category/all_categories/categories.dart';
import '../features/shop/screens/category/create_category/create_category.dart';
import '../features/shop/screens/category/edit_category/edit_category.dart';
import '../features/shop/screens/customer/all_customers/customers.dart';
import '../features/shop/screens/customer/customer_detail/customer_detail.dart';
import '../features/shop/screens/dashboard/dashboard.dart';
import '../features/shop/screens/product/all_product/product.dart';
import '../features/shop/screens/product/create_product/create_product.dart';

class HptAppRoute {
  static final List<GetPage> pages = [
    GetPage(name: HptRoutes.login, page: () => const LoginScreen()),
    GetPage(name: HptRoutes.forgetPassword, page: () => const ForgetPasswordScreen()),
    GetPage(name: HptRoutes.resetPassword, page: () => const ResetPasswordScreen()),
    GetPage(name: HptRoutes.dashboard, page: () => const DashboardScreen(), middlewares: [HptRouteMiddleware()]),
    GetPage(name: HptRoutes.media, page: () => const MediaScreen(), middlewares: [HptRouteMiddleware()]),

    GetPage(name: HptRoutes.categories, page: () => const CategoriesScreen(), middlewares: [HptRouteMiddleware()]),
    GetPage(name: HptRoutes.createCategory, page: () => const CreateCategoryScreen(), middlewares: [HptRouteMiddleware()]),
    GetPage(name: HptRoutes.editCategory, page: () => const EditCategoryScreen(), middlewares: [HptRouteMiddleware()]),

    GetPage(name: HptRoutes.brands, page: () => const BrandsScreen(), middlewares: [HptRouteMiddleware()]),
    GetPage(name: HptRoutes.createBrand, page: () => const CreateBrandScreen(), middlewares: [HptRouteMiddleware()]),
    GetPage(name: HptRoutes.editBrand, page: () => const EditBrandScreen(), middlewares: [HptRouteMiddleware()]),

    GetPage(name: HptRoutes.banners, page: () => const BannersScreen(), middlewares: [HptRouteMiddleware()]),
    GetPage(name: HptRoutes.createBanner, page: () => const CreateBannerScreen(), middlewares: [HptRouteMiddleware()]),
    GetPage(name: HptRoutes.editBanner, page: () => const EditBannerScreen(), middlewares: [HptRouteMiddleware()]),

    GetPage(name: HptRoutes.products, page: () => const ProductScreen(), middlewares: [HptRouteMiddleware()]),
    GetPage(name: HptRoutes.createProduct, page: () => const CreateProductScreen(), middlewares: [HptRouteMiddleware()]),
    // GetPage(name: HptRoutes.editProduct, page: () => const EditProductScreen(), middlewares: [HptRouteMiddleware()]),

    GetPage(name: HptRoutes.customers, page: () => const CustomerScreen(), middlewares: [HptRouteMiddleware()]),
    GetPage(name: HptRoutes.customerDetails, page: () => const CustomerDetailScreen(), middlewares: [HptRouteMiddleware()]),
  ];
}
