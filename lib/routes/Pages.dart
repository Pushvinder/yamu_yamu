import 'package:get/get.dart';
import 'package:yamu/routes/Routes.dart';
import 'package:yamu/screens/auth/forget_password/forget_pass_binding.dart';
import 'package:yamu/screens/auth/forget_password/forget_pass_view.dart';
import 'package:yamu/screens/auth/login/login_binding.dart';
import 'package:yamu/screens/auth/login/login_view.dart';
import 'package:yamu/screens/auth/onboarding/onboarding_binding.dart';
import 'package:yamu/screens/auth/onboarding/onboarding_view.dart';
import 'package:yamu/screens/auth/signup/profile_complete_view.dart';
import 'package:yamu/screens/auth/signup/ready_to_go_view.dart';
import 'package:yamu/screens/auth/signup/set_password_view.dart';
import 'package:yamu/screens/auth/signup/signup_binding.dart';
import 'package:yamu/screens/auth/signup/signup_view.dart';
import 'package:yamu/screens/dashboard/bottom_nav/dashboard_binding.dart';
import 'package:yamu/screens/dashboard/bottom_nav/dashboard_view.dart';
import 'package:yamu/screens/dashboard/cart/checkout/checkout_binding.dart';
import 'package:yamu/screens/dashboard/cart/checkout/checkout_view.dart';
import 'package:yamu/screens/dashboard/cart/my_cart/cart_binding.dart';
import 'package:yamu/screens/dashboard/cart/my_cart/cart_view.dart';
import 'package:yamu/screens/dashboard/cart/track_order/track_order_binding.dart';
import 'package:yamu/screens/dashboard/cart/track_order/track_order_view.dart';
import 'package:yamu/screens/dashboard/home/my_home/category_products.dart';
import 'package:yamu/screens/dashboard/home/my_home/home_binding.dart';
import 'package:yamu/screens/dashboard/home/product_detail/product_detail_view.dart';
import 'package:yamu/screens/dashboard/home/product_detail/product_details_binding.dart';
import 'package:yamu/screens/dashboard/home/product_detail/review/review_binding.dart';
import 'package:yamu/screens/dashboard/home/product_detail/review/review_view.dart';
import 'package:yamu/screens/dashboard/home/search/search_binding.dart';
import 'package:yamu/screens/dashboard/orders/order_details/order_details_binding.dart';
import 'package:yamu/screens/dashboard/orders/order_details/order_details_view.dart';
import 'package:yamu/screens/dashboard/orders/orders_binding.dart';
import 'package:yamu/screens/dashboard/profile/edit_profile/edit_profile_binding.dart';
import 'package:yamu/screens/dashboard/profile/edit_profile/edit_profile_view.dart';
import 'package:yamu/screens/dashboard/profile/my_address/add_address.dart';
import 'package:yamu/screens/dashboard/profile/my_address/my_address_binding.dart';
import 'package:yamu/screens/dashboard/profile/my_address/my_address_view.dart';
import 'package:yamu/screens/dashboard/profile/my_profile/profile_binding.dart';
import 'package:yamu/screens/dashboard/profile/notification/notification_binding.dart';
import 'package:yamu/screens/dashboard/profile/notification/notification_view.dart';
import 'package:yamu/screens/dashboard/profile/promos/promo_binding.dart';
import 'package:yamu/screens/dashboard/profile/promos/promo_view.dart';
import 'package:yamu/screens/dashboard/wishlist/wishlist_binding.dart';
import 'package:yamu/screens/splash/SplashView.dart';

import '../screens/dashboard/home/search/search_view.dart';

class Pages {
  static final routes = [
    GetPage(name: Routes().splash, page: () => const SplashView()),
    GetPage(
        name: Routes().onBoarding,
        page: () => const OnBoardingView(),
        binding: onBoardingBinding()),
    GetPage(
        name: Routes().login,
        page: () => const LoginView(),
        binding: LoginBinding()),
    GetPage(
        name: Routes().signup,
        page: () => const SignUpView(),
        binding: SignUpBinding()),
    GetPage(
        name: Routes().forgetPassword,
        page: () => const ForgetPassView(),
        binding: ForgetPassBinding()),
    GetPage(
        name: Routes().editProfile,
        page: () => const EditProfileView(),
        binding: EditProfileBinding()),
    GetPage(
        name: Routes().myAddress,
        page: () => const MyAddressView(),
        binding: MyAddressBinding()),
    GetPage(
        name: Routes().promo,
        page: () => const PromoView(),
        binding: PromoBinding()),
    GetPage(
        name: Routes().cart,
        page: () => const CartView(),
        binding: CartBindings()),
    GetPage(
        name: Routes().checkout,
        page: () => const CheckoutView(),
        binding: CheckoutBinding()),
    GetPage(
        name: Routes().notification,
        page: () => const NotificationView(),
        binding: NotificationBinding()),
    GetPage(
        name: Routes().trackOrder,
        page: () => TrackOrderView(),
        binding: TrackOrderBinding()),
    GetPage(
        name: Routes().review,
        page: () => const ReviewView(),
        binding: ReviewBinding()),
  GetPage(
        name: Routes().orderDetails,
        page: () => const OrderDetailsView(),
        binding: OrderDetailsBinding()),
    GetPage(
        name: Routes().search,
        page: () => const SearchView(),
        binding: SearchBinding()),
    GetPage(
        name: Routes().productDetails,
        page: () => const ProductDetailsView(),
        binding: ProductDetailsBindings()),
    // GetPage(name: Routes().otp, page: () => const OtpView()),
    // GetPage(
    //     name: Routes().resetPassword, page: () => const ResetPasswordView()),
    GetPage(name: Routes().readyToGo, page: () => const ReadyToGoView()),
    GetPage(name: Routes().categoryProducts, page: () =>  CategoryProducts()),
    GetPage(name: Routes().setPassword, page: () => const SetPasswordView()),
    GetPage(name: Routes().addAddress, page: () =>  AddAddressView()),
    GetPage(
        name: Routes().profileComplete,
        page: () => const ProfileCompleteView()),
    GetPage(name: Routes().dashboard, page: () => DashboardView(), bindings: [
      DashboardBinding(),
      ProfileBindings(),
      HomeBindings(),
      OrdesBindings(),
      WishlistBindings()
    ]),
  ];
}
