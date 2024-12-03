import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogMessage {
  final String? title;
  final double titleFontSize;
  final String message;
  final Widget? image;
  final String? textConfirm;
  final String? textCancel;
  final Function? onConfirm;
  final Function? onCancel;
  final bool dissmisable;

  const DialogMessage(
      {this.title,
      this.titleFontSize = 14,
      required this.message,
      this.image,
      this.textConfirm,
      this.textCancel,
      this.onConfirm,
      this.onCancel,
      this.dissmisable = true});

  show() {
    Get.dialog(
      DialogMessageView(
        title: title,
        titleFontSize: titleFontSize,
        message: message,
        image: image,
        textConfirm: textConfirm,
        textCancel: textCancel,
        onConfirm: onConfirm,
        onCancel: onCancel,
        dissmisable: dissmisable,
      ),
    );
  }
}

class DialogMessageView extends StatelessWidget {
  final String? title;
  final double? titleFontSize;
  final String message;
  final Widget? image;
  final String? textConfirm;
  final String? textCancel;
  final Function? onConfirm;
  final Function? onCancel;
  final bool? dissmisable;

  const DialogMessageView(
      {super.key,
      this.title,
      this.titleFontSize = 14,
      required this.message,
      this.image,
      this.textConfirm = "OK",
      this.textCancel = "Batal",
      this.onConfirm,
      this.onCancel,
      this.dissmisable = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => dissmisable! ? Get.back() : null,
      child: PopScope(
        onPopInvoked: (didPop) => Future.value(dissmisable),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              decoration: const BoxDecoration(color: Color(0xE6FFFFFF), borderRadius: BorderRadius.all(Radius.circular(10))),
              margin: EdgeInsets.all(context.width * 0.1),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (image != null) image!,
                  if (title != null)
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        title!,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: titleFontSize, fontWeight: FontWeight.w600,),
                      ),
                    ),
                    const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.black87, fontSize: 12, fontWeight: FontWeight.w500,),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(height: 1, width: Get.width, color: Colors.black26),
                  SizedBox(
                    height: 45,
                    child: Row(
                      children: [
                        if (onCancel != null)
                          Expanded(
                            child: TextButton(
                              onPressed: () => onCancel!(),
                              style: ButtonStyle(
                                overlayColor: WidgetStateProperty.all(Colors.transparent),
                              ),
                              child: Text(
                                textCancel ?? "Cancel",
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500,),
                              ),
                            ),
                          ),
                        if (onCancel != null)
                          Container(
                            height: 45,
                            width: 1,
                            color: Colors.black26,
                          ),
                        Expanded(
                          child: TextButton(
                            onPressed: () => onConfirm !=null ? onConfirm!() : Get.back(),
                            style: ButtonStyle(
                              overlayColor: WidgetStateProperty.all(Colors.transparent),
                            ),
                            child: Text(
                              textConfirm ?? "OK",
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.black87, fontSize: 12, fontWeight: FontWeight.w500,),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
