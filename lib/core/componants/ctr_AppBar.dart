import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../TextManager/generalText.dart';

class ctr_AppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final double? titleSpacing;
  final bool? isViewArrowBack;
  final bool? isViewConnectionStatue;
  final List<Widget>? OtherWidgetBar;
  final void Function()? onFilter;
  final void Function()? onLoadData;
  final void Function()? onSave;
  final void Function()? onClose;
  final void Function()? onPrint;
  final void Function()? onShare;

  ctr_AppBar({
    this.title,
    this.titleSpacing,
    this.isViewArrowBack = true,
    this.isViewConnectionStatue = true,
    this.OtherWidgetBar,
    this.onFilter,
    this.onLoadData,
    this.onSave,
    this.onClose,
    this.onPrint,
    this.onShare,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      titleSpacing: titleSpacing,
      actions: buildActionBar(context),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  buildActionBar(BuildContext context) {
    List<Widget> lst = [
      // Filter
      if (onFilter != null)
        IconButton(
          onPressed: onFilter,
          icon: Icon(Icons.filter_alt, size: 30),
        ),

      // Load Data
      if (onLoadData != null)
        IconButton(
          onPressed: onLoadData,
          icon: Icon(Icons.cloud_download_rounded),
        ),

      // Save
      if (onSave != null)
        IconButton(
          onPressed: onSave,
          icon: Icon(Icons.save),
        ),

      // close
      if (onClose != null)
        IconButton(
          onPressed: onClose,
          icon: Icon(Icons.cancel),
        ),

      // print
      if (onPrint != null)
        IconButton(
          onPressed: onPrint,
          icon: Icon(Icons.print),
        ),

      // share
      if (onShare != null)
        IconButton(
          onPressed: onShare,
          icon: Icon(Icons.share),
        ),

      // Connection
      Row(
        children: [
          Text(
            generalText.isConnected,
          ),
        ],
      ),

      // back
      if (isViewArrowBack!)
        IconButton(
          onPressed: () => Get.back(), // onArrowBackClick,
          icon: const Icon(Icons.arrow_back, textDirection: TextDirection.ltr),
        ),
    ];

    if (OtherWidgetBar != null && OtherWidgetBar!.length > 0) {
      lst.addAll(OtherWidgetBar!);
    }
    return lst;
  }
}
