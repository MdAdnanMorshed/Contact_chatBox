import 'package:get/get.dart';

import '../../main.dart';
import '../modules/chat/bindings/chat_binding.dart';
import '../modules/chat/views/chat_view.dart';
import '../modules/contact/bindings/contact_binding.dart';
import '../modules/contact/views/contact_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login_register/bindings/login_register_binding.dart';
import '../modules/login_register/views/login_register_view.dart';
import '../modules/message_history/bindings/message_history_binding.dart';
import '../modules/message_history/views/message_history_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static String INITIAL =
      prefs.getString('Token') == null ? Routes.WELCOME : Routes.CONTACT;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_REGISTER,
      page: () => const LoginRegisterView(),
      binding: LoginRegisterBinding(),
    ),
    GetPage(
      name: _Paths.CONTACT,
      page: () => const ContactView(),
      binding: ContactBinding(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => const ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: _Paths.MESSAGE_HISTORY,
      page: () => const MessageHistoryView(),
      binding: MessageHistoryBinding(),
    ),
  ];
}
