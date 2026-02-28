class TranslationModel {
  final String home;
  final String explore;
  final String cart;
  final String profile;
  final String addresses;
  final String orders;
  final String englishLanguage;
  final String darkTheme;
  final String notifications;

  TranslationModel.fromJson(Map<String, dynamic> json)
      : home = json['home'] ?? 'Home',
        explore = json['explore'] ?? 'Explore',
        cart = json['cart'] ?? 'Cart',
        profile = json['profile'] ?? 'Profile',
        addresses = json['addresses'] ?? 'Addresses',
        orders = json['orders'] ?? 'Orders',
        englishLanguage = json['englishLanguage'] ?? 'English Language',
        darkTheme = json['darkTheme'] ?? 'Dark Theme',
        notifications = json['notifications'] ?? 'Notifications';
}
