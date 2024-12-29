import 'package:equatable/equatable.dart';

import '../TextManager/failuerStrings.dart';


abstract class failuer extends Equatable {}

class failuer_ServerConnection extends failuer{
  @override

  List<Object?> get props => [];
}

class failuer_ServerError extends failuer{
  @override

  List<Object?> get props => [];
}

class failuer_DataNotFount extends failuer{
  @override

  List<Object?> get props => [];
}

class failuer_ConnectionInternet extends failuer{
  @override

  List<Object?> get props => [];
}


class failuerMessage extends failuer{


  static String getMessage(failuer failuerType){

    if(failuerType ==  failuer_ConnectionInternet){
      return failuerStrings.connectionInternetText;
    }
    else if(failuerType ==  failuer_ServerConnection){
      return failuerStrings.serverConnectionText;
    }
    else if(failuerType ==  failuer_ServerError){
      return failuerStrings.failuer_ServerErrorText;
    }
    else if(failuerType ==  failuer_DataNotFount){
      return failuerStrings.failuer_DataNotFountText;
    }
    else {
      return failuerStrings.failuer_UnDefiendText;
    }

  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}