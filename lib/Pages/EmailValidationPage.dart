// import 'package:flutter/material.dart';
// import 'package:flutter_applicationgoogle_drive/Pages/InheritedWidgetPage.dart';
// import 'package:flutter_applicationgoogle_drive/bloc/bloc/bloc/email_validation_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../Modeles/field_error.dart';

// class FormScreen extends StatefulWidget {
//   const FormScreen({Key? key}) : super(key: key);

//   @override
//   _FormScreenState createState() => _FormScreenState();
// }

// class _FormScreenState extends State<FormScreen> {
//   late EmailValidationBloc _bloc;

//   final _emailController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final bool? isNetworkAvailable =
//         InheritedNetworkHandler.of(context)?.isNetworkAvailable;
//     debugPrint("Network Availability $isNetworkAvailable");
//     return BlocListener<EmailValidationBloc, EmailValidationState>(
//       bloc: _bloc,
//       listener: (context, state) {
//         state.when(
//             initial: () {},
//             FormScreenState:
//                 (bool isBusy, FieldError? emailError, bool? submissionSuccess) {
//               if (submissionSuccess = true) {
//                 showDialog(
//                   context: context,
//                   builder: (ctx) => AlertDialog(
//                     title: const Text("Alert Dialog Box"),
//                     content: const Text("You have raised a Alert Dialog Box"),
//                     actions: <Widget>[
//                       TextButton(
//                         onPressed: () {
//                           Navigator.of(ctx).pop();
//                         },
//                         child: Container(
//                           color: Colors.green,
//                           padding: const EdgeInsets.all(14),
//                           child: const Text("okay"),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               }
//             });
//       },
//       child: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 30),
//           child: Center(
//             child: BlocBuilder<EmailValidationBloc, EmailValidationState>(
//                 bloc: _bloc,
//                 builder: (context, state) {
//                   state.when(initial: () {
//                     return const CircularProgressIndicator();
//                   }, FormScreenState: (bool isBusy, FieldError? emailError,
//                       bool? submissionSuccess) {
//                     return Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           TextField(
//                             controller: _emailController,
//                             style: TextStyle(
//                               color: _hasEmailError(emailError)
//                                   ? Colors.red
//                                   : Colors.black,
//                             ),
//                             decoration: InputDecoration(
//                               hintText: 'Email',
//                               labelStyle: TextStyle(
//                                 color: _hasEmailError(emailError)
//                                     ? Colors.red
//                                     : Colors.black,
//                               ),
//                               hintStyle: TextStyle(
//                                 color: _hasEmailError(emailError)
//                                     ? Colors.red
//                                     : Colors.black,
//                               ),
//                               enabledBorder: _renderBorder(emailError),
//                               focusedBorder: _renderBorder(emailError),
//                             ),
//                           ),
//                           if (_hasEmailError(emailError)) ...[
//                             const SizedBox(height: 5),
//                             Text(
//                               _emailErrorText(emailError!),
//                               style: const TextStyle(color: Colors.red),
//                             ),
//                           ] else ...[
//                             const SizedBox(height: 30),
//                           ]

//                           // RaisedButton(
//                           //   child: const Text('Submit'),
//                           //   onPressed: () => _bloc.add(
//                           //       EmailValidationEvent.FormScreenEventSubmit(
//                           //           _emailController.text)),
//                           // ),
//                         ]);
//                   });
                  
//                 }),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _bloc.close();
//     super.dispose();
//   }

//   @override
//   void initState() {
//     _bloc = EmailValidationBloc();
//     super.initState();
//   }

//   String _emailErrorText(FieldError? error) {
//     switch (error) {
//       case FieldError.Empty:
//         return 'You need to enter an email address';
//       case FieldError.Invalid:
//         return 'Email address invalid';
//       default:
//         return '';
//     }
//   }

//   bool _hasEmailError(FieldError? emailError) => emailError != null;

//   UnderlineInputBorder _renderBorder(FieldError? emailError) =>
//       UnderlineInputBorder(
//         borderSide: BorderSide(
//             color: _hasEmailError(emailError = FieldError.Empty)
//                 ? Colors.red
//                 : Colors.black,
//             width: 1),
//       );
// }
