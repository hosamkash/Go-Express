import 'package:flutter/material.dart';
import 'package:get/get.dart';
 import '../Resources/valuesManager.dart';

class ctr_DropDowenList extends StatefulWidget {
  @override
  _ctr_DropDowenListState createState() => _ctr_DropDowenListState();

  int? selectedValue;
  final String hintLable;
  final bool showClearIcon;
  final List<DropDowenDataSource> lstDataSource;
  final TextStyle? itemsTextStyle;
  final TextStyle? hintTextStyle;
  final EdgeInsets? padding;

  // double? height;
  late final bool? readOnly;
  final double? menuMaxHeightValue;
  final BorderRadius? borderRadius;
  late final int? Function(int? selectedID)? OnChanged;
  late final String? Function(int?)? OnValidate;

  ctr_DropDowenList({
    // this.autoSelectedFrist,
    this.selectedValue,
    this.showClearIcon = true,
    this.hintLable = '',
    this.lstDataSource = const [],
    this.itemsTextStyle,
    this.hintTextStyle,
    this.padding,
    // this.height = 50,
    this.readOnly = false,
    this.menuMaxHeightValue,
    this.borderRadius,
    this.OnChanged,
    this.OnValidate,
  });
}

class DropDowenDataSource {
  final int? branchID;
  final int valueMember;
  final String displayMember;
  final String displayMemberMore;

  DropDowenDataSource({required this.valueMember, required this.displayMember, this.displayMemberMore = '', this.branchID});
}

class _ctr_DropDowenListState extends State<ctr_DropDowenList> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: widget.padding,
            // height: widget.height ,
            child: DropdownButtonFormField<int>(
              value: widget.selectedValue,
              hint: Text(widget.hintLable),
               iconSize: 22,
              items: widget.lstDataSource.map((selectedItem) {
                return DropdownMenuItem<int>(
                  value: selectedItem.valueMember,
                  child: Text('${selectedItem.displayMember}${selectedItem.displayMemberMore.isEmpty ? '' : ' ${selectedItem.displayMemberMore}'}', overflow: TextOverflow.ellipsis,maxLines: 1,),
                );
              }).toList(),
              onChanged: onChangedCheckReadOnly(),
              validator: widget.OnValidate,
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(valuesManager.numberDouble.n10),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: valuesManager.numberDouble.n02,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(valuesManager.numberDouble.n10),
                  borderSide: BorderSide(
                    color: Colors.grey ,
                    width: valuesManager.numberDouble.n02,
                  ),
                ),
              ),
              dropdownColor: Colors.white,
              elevation: valuesManager.numberInt.n02,
              menuMaxHeight: widget.menuMaxHeightValue ?? 250,
              borderRadius: widget.borderRadius,
            ),
          ),
        ),
        if (widget.showClearIcon == true)
          InkWell(
              onTap: () => setState(() {
                    // print('selectedValue --------- ${widget.selectedValue}');
                    widget.selectedValue = null;
                    widget.OnChanged!(null);
                  }),
              child: Icon(
                Icons.clear,
                color: Colors.black,
              ))
      ],
    );
  }

  dynamic onChangedCheckReadOnly() {
    if (widget.readOnly == true) {
      return null;
    } else {
      return (int? newId) {
        setState(() {
          widget.selectedValue = newId;
          if (widget.OnChanged != null) {
            widget.OnChanged!(widget.selectedValue!);
          }
        });
      };
    }
  }
}
