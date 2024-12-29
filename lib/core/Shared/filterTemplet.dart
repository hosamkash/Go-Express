import 'package:flutter/material.dart';

import '../Enumerators/en_LoadType.dart';
import '../ManageTables/ManageBLL.dart';


class filterTemplet {

  en_LoadType loadType = en_LoadType.loadOnly;
  TextEditingController contDateTo = TextEditingController(text: '');
  TextEditingController contDateFrom = TextEditingController(text: '');
  TextEditingController controllerfilter = TextEditingController(text: '');
  bool isGetAllDates = false;
  List<BLLCondions>? condionsToFilter;
  int? branchID;

}