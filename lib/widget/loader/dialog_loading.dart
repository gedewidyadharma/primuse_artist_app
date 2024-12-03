import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loading {
  static bool isShow = false;

  /// For showing dialog progress indicator
  void show({dismissable = false, message = "Please Wait..."}) {
    // if (!isShow) {
    //   isShow = true;
    //   Get.dialog(
    //       DialogStandarLoading(
    //         dissmissable: dismissable,
    //         message: message,
    //       ),
    //       barrierDismissible: dismissable);
    // }

    if (!isShow) {
      isShow = true;
      Get.dialog(
        DialogStandarLoading(
          dissmissable: dismissable,
          message: message,
        ),
        barrierDismissible: dismissable,
      ).then((_) {
        // Ensure state reset after dialog is dismissed
        isShow = false;
      });
    }
  }

  void hide() {
    if (isShow && Get.isDialogOpen == true) {
      Get.closeAllSnackbars();
      Get.back();
      isShow = false;
    }
  }
}

class DialogStandarLoading extends StatelessWidget {
  const DialogStandarLoading({super.key, this.dissmissable = true, required this.message});

  final bool dissmissable;
  final String message;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => dissmissable ? Get.back() : null,
      child: PopScope(
        onPopInvoked: (didPop) => Future.value(false),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(color: Color(0xE6FFFFFF), borderRadius: BorderRadius.all(Radius.circular(10))),
              margin: EdgeInsets.all(context.width * 0.1),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Container(
                  width: 43,
                  height: 40,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                Expanded(
                  child: Text(
                    message,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
