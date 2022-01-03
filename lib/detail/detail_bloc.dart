
import 'package:flutter_gus/common/bloc/common_bloc.dart';

class DetailBloc extends CommonBloc{

  bool isFirst = true;
  @override
  loadData() async{
    await Future.delayed(Duration(seconds: 2),(){});
    emit(CommonState(pageStatus: isFirst?PageStatus.Failed:PageStatus.Success,data: 'success'));
    isFirst = false;
  }
}