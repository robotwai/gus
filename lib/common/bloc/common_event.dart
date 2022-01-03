part of 'common_bloc.dart';
class CommonEvent extends Equatable {
  const CommonEvent();

  @override
  List<Object?> get props => [];
}

class PageLoadFinish extends CommonEvent{
  final HttpResponse data;

  PageLoadFinish(this.data);

  @override
  List<Object> get props => [data];
}

class PageReload extends CommonEvent{
  PageReload();

  @override
  List<Object> get props => [];
}

class PageLoading extends CommonEvent{

  PageLoading();

  @override
  List<Object> get props => [];
}

class HttpResponse{
  String? data;
  String? msg;
  int? code;
}
