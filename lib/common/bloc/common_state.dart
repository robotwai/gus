part of 'common_bloc.dart';

class CommonState extends Equatable {
  PageStatus pageStatus;
  String data;
  CommonState({this.pageStatus = PageStatus.Loading,this.data = ''});

  @override
  List<Object> get props => [pageStatus,data];
}

enum PageStatus {Loading,Empty,Success,Failed}
