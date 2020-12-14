import 'package:flutter/material.dart';
import 'package:personalcv/src/features/base_viewmodel.dart';
import 'package:provider/provider.dart';

class ViewModelProvider<T extends BaseViewModel> extends StatelessWidget{
  final T viewModel;
  final Widget Function(T viewModel) builder;

  const ViewModelProvider({Key key,@required this.viewModel,@required this.builder}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   return ChangeNotifierProvider<T>(
        create: (_) => viewModel,
     child: Consumer<T>(
       builder:(BuildContext context,T value, Widget child)=> builder(value) ,
     ),
   );
  }

}