// import 'package:flutter/material.dart';
// import 'package:hucel_core/hucel_core.dart';

// import '../view_model/register_viewmodel.dart';

// class RegisterScreen extends BaseStateless {
//   RegisterScreen({Key? key}) : super(key: key);
//   late RegisterScreenViewModel _viewModel;
//   late BuildContext _context;
//   @override
//   Widget build(BuildContext context) {
//     return BaseView<RegisterScreenViewModel>(
//       viewModel: RegisterScreenViewModel(),
//       onModelReady: (model) {
//         model.setContext(context);
//         model.init();
//       },
//       onPageBuilder: (BuildContext context, RegisterScreenViewModel viewModel) {
//         _viewModel = viewModel;
//         _context = context;
//         return _scaffold();
//       },
//     );
//   }

//   Scaffold _scaffold() => const Scaffold();
// }
