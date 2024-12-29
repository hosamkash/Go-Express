import 'package:flutter/material.dart';
import 'package:get/get.dart';
 import '../Resources/valuesManager.dart';
import '../TextManager/generalText.dart';
import 'ctr_ElevatedButton.dart';

enum en_DialogType {
  AsIcon,
  AsElevatedButton,
}

class ctr_Dialog extends StatelessWidget {
  final BuildContext? context;
  final String? header;
  final String? message;
  final ShapeBorder? shape;
  final double? elevation;
  final bool? useSafeArea;
  final bool? barrierDismissible;
  final Widget? content;
  final Icon? icon;
  final en_DialogType? dialogType;
  final double? fontSizeButton;

  final void Function()? onDelete;

  ctr_Dialog(
    this.dialogType,
    this.context, {
    this.shape,
    this.header,
    this.message,
    this.elevation,
    this.useSafeArea,
    this.barrierDismissible,
    this.content,
    this.icon,
    this.fontSizeButton,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    if (dialogType == en_DialogType.AsIcon) {
      return buildAsIcon();
    } else if (dialogType == en_DialogType.AsElevatedButton) {
      return buildAsElevatedButton();
    } else
      return SizedBox();
  }

  buildAsIcon() {
    return InkWell(
      child: Icon(Icons.delete_forever_outlined),
      onTap: () {
        showFormDialog(
          context!,
          useSafeArea: true,
          content: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: valuesManager.numberDouble.n05),
                Text(header ?? 'هل تريد تأكيد حذف', ),
                SizedBox(height: valuesManager.numberDouble.n05),
                Text(message! ),
                // SizedBox(height: valuesManager.numberDouble.n10),
                Divider(
                  color: Colors.black,
                  indent: 20,
                  endIndent: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      child: Text(generalText.confirm, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17 , color: Colors.black), ),
                      onPressed: onDelete,
                    ),
                     SizedBox(width: valuesManager.numberDouble.n05),
                    TextButton(
                      child: Text(generalText.cancel, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17 , color: Colors.black) ),
                      onPressed: () async {
                        Navigator.of(context!).pop();
                      },
                    ),
                  ],
                ),
                // SizedBox(height: valuesManager.numberDouble.n10),
              ],
            ),
          ),
        );
      },
    );
  }

  buildAsElevatedButton() {
    return ctr_ElevatedButtonIcon(
      labelText: header,
      icon: icon,
      fontSize: fontSizeButton,
      onPressed: () async {
        showFormDialog(
          context!,
          useSafeArea: true,
          content: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: valuesManager.numberDouble.n05),
                Text( 'تأكيد',  ),
                SizedBox(height: valuesManager.numberDouble.n05),
                Text(message! ),
                Divider(
                  color: Colors.black,
                  indent: 20,
                  endIndent: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      child: Text('إلغاء', ),
                      onPressed: onDelete,
                    ),
                    // SizedBox(width: valuesManager.numberDouble.n05),
                    TextButton(
                      child: Text(generalText.cancel, ),
                      onPressed: () async {
                        Navigator.of(context!).pop();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future showFormDialog(
    BuildContext context, {
    ShapeBorder? shape,
    double? elevation,
    Widget? content,
    bool? useSafeArea,
    bool? barrierDismissible,
  }) {
    return showDialog(

      context: context,
      useSafeArea: useSafeArea ?? true,
      barrierDismissible: barrierDismissible ?? false,
      builder: (BuildContext context) {
        return Dialog(
          shape: shape ?? RoundedRectangleBorder(borderRadius: BorderRadius.circular(valuesManager.numberDouble.n20)),
          elevation: elevation ?? 4,
          child: content,
        );
      },
    );
  }
}
