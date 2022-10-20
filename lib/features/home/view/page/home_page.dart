import 'package:chex_test_case/features/home/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/home_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
@override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
    Provider.of<HomeViewModel>(context,listen: false).initView();
  });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, homeViewModel, child) {
      return SafeArea(
        child: Scaffold(
          body: homeViewModel.isLoad?const Center(child: CircularProgressIndicator()):const HomeBody(),
        ),
      );
      
    },
    );
  }
}
  
