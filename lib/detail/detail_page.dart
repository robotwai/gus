import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gus/common/bloc/common_bloc.dart';
import 'package:flutter_gus/common/common_page.dart';
import 'package:flutter_gus/detail/detail_bloc.dart';
import 'package:flutter_gus/global/global_bloc.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return DetailBloc() as CommonBloc;
      },
      child: DetailBody(),
    );
  }
}


class DetailBody extends CommonPage{

  @override
  Widget buildBody(String? data) {
    return Container(
      child: Center(
        child:  Text('${data}'),
      ),
    );
  }
}