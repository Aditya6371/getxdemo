# getxdemo

Commonly used GetX Features

Breakdown into Categories

1. Navigation:
    Get.to(NextPage()): Navigate to a new page.
    Get.offAndToNamed(‘/newPage’): Navigate to a new page and remove the previous routes.
    Get.toNamed(‘/details’): Navigate to a named route.
    Get.offNamed(‘/login’): Navigate to a named route and remove previous routes.
    Get.back(): Pop the current route and return to the previous page.
    Get.offAllNamed(‘/home’): Navigate to a named route and remove all previous routes.
    Get.offAll(HomePage()): Navigate to a new page and remove all previous routes.
    Get.off(Home()): Navigate to a new page and remove the previous route.
2. State Management:
    Get.find<MyController>(): Retrieve a registered instance of a controller or service.
    Get.lazyPut<MyController>(() => MyController()): Lazily creates and registers a controller instance.
3. Dialogs and Snackbars:
    Get.defaultDialog(title: ‘Alert’, middleText: ‘This is an alert message.’): Show a default dialog.
    Get.closeCurrentSnackbar(): Closes the currently displayed snackbar.
    GetSnackBar(title: ‘Success’, message: ‘Operation completed.’): A customizable snackbar widget.
4. Route Configuration:
    GetPage(name: ‘/details’, page: () => DetailsPage()): Represents a configuration for a named route.
5. Locale Management:
    Get.updateLocale(Locale(‘en’)): Updates the locale of the app.
6. Checking Dark Mode:
    bool isDarkMode = Get.isDarkMode: Checks if the app’s theme is in dark mode.
7. Context and Dimensions:
    BuildContext context = Get.context: Gets the current context.
    double screenWidth = Get.width: Gets the screen width.
8. Key Management:
    GlobalKey<MyWidgetState> myWidgetKey = Get.key: Used to get the current key for the widget.


   
