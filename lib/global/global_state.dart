part of 'global_bloc.dart';
class GlobalState extends Equatable {
   //用户设备
   DeviceType deviceType ;
   //用户信息
   User userInfo;
   GlobalState(this.userInfo,{this.deviceType = DeviceType.phone,});

   GlobalState copyWith({
     User? user,
     DeviceType? deviceType,
   }) {
     return GlobalState(
       user?? this.userInfo,
       deviceType: this.deviceType,
     );
   }

  @override
  List<Object> get props => [deviceType,userInfo];
}

