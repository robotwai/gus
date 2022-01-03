import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'common_event.dart';
part 'common_state.dart';

abstract class CommonBloc extends Bloc<CommonEvent, CommonState> {
  CommonBloc() : super(CommonState()) {
    on<PageLoadFinish>(_onLoadingFinish);
    on<PageLoading>(_onLoading);
    on<PageReload>(_onPageReload);
    loadData();
  }

  _onLoadingFinish(PageLoadFinish event,Emitter emit){
    if(event.data.data != null){
      if(event.data.code==200){
        emit(CommonState(pageStatus: PageStatus.Success,data: event.data.data!));
      }else{
        emit(CommonState(pageStatus: PageStatus.Failed,data: event.data.data!));
      }
    }
  }

  _onLoading(PageLoading event,Emitter emit){
    emit(CommonState(pageStatus: PageStatus.Loading,));
  }

  _onPageReload(PageReload event,Emitter emit){
    emit(CommonState(pageStatus: PageStatus.Loading,));
    loadData();
  }

  loadData();


}
