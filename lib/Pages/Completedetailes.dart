import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_applicationgoogle_drive/Pages/bloc/completedetailes_bloc.dart';
import 'package:flutter_applicationgoogle_drive/bloc/service_area_bloc_bloc_bloc.dart';
import 'package:flutter_applicationgoogle_drive/bloc/validationBloc/validation_bloc.dart';
import 'package:flutter_applicationgoogle_drive/utilities/HelperTools.dart';
import 'package:flutter_applicationgoogle_drive/utilities/Sizeconfig.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Getdata {
  String pincode = "";
  String area = "";
  get getPincode => pincode;

  set setPincode(pincode) => this.pincode = pincode;

  get getArea => area;

  set setArea(area) => this.area = area;
}

class CompleteDetailes extends StatelessWidget {
  TextEditingController referralcodeController = TextEditingController();

  CompleteDetailes({Key? key}) : super(key: key);
  double srcwidth = 0.0;
  double srcheight = 0.0;
  String pincode = "";
  Getdata gtdata = Getdata();
  TextEditingController nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    srcwidth = MediaQuery.of(context).size.width;
    srcheight = MediaQuery.of(context).size.height;
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text("Complete detailes Page"),
          ),
          body: MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) =>
                      CompletedetailesBloc()..add(FetchPinEvent("9"))),
              BlocProvider(create: (context) => ServiceAreaBlocBlocBloc()),
              BlocProvider(create: (context) => ValidationBloc()),
            ],
            child: BlocConsumer<ValidationBloc, ValidationState>(
              listener: (context, state) {
                if (state is ValidationSuccess) {
                } else if (state is ValidationFailed) {
                  snackBarWidget(context, state.error, Icons.thumb_down,
                      const Color.fromARGB(255, 255, 26, 26), 1);

                  // HelperTools().snackBarWidget(context, state.error, Icons.thumb_down,
                  //
                  //     const Color.fromARGB(255, 255, 26, 26), 1);
                }
              },
              builder: (context, state) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 4,
                                child: Container(
                                  width: SizeConfig.screenWidth * .80,
                                  height: SizeConfig.screenHeight * .090,
                                  padding: const EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: TextFormField(
                                      controller: nameController,
                                      keyboardType: TextInputType.name,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                          (RegExp("[a-z A-Z.]")),
                                        )
                                      ],
                                      style: const TextStyle(fontSize: 15),
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      decoration: InputDecoration(
                                        isCollapsed: true,
                                        hintText: "Name",
                                        hintStyle: TextStyle(
                                          fontSize:
                                              SizeConfig.blockSizeHorizontal *
                                                  4,
                                          color: Colors.grey,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Card(
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: SizedBox(child: BlocBuilder<
                                          CompletedetailesBloc,
                                          CompletedetailesState>(
                                      builder: (context, state) {
                                    if (state is LocationSuccesss) {
                                      return SizedBox(
                                        width: srcwidth * .80,
                                        height: SizeConfig.screenHeight * .090,
                                        child: DropdownButtonFormField<dynamic>(
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                          validator: (value) {
                                            if (value == null) {
                                              return 'Pin Code Required';
                                            }
                                            return null;
                                          },
                                          onSaved: (value) {
                                            pincode = value;
                                          },
                                          onChanged: (newValue) {
                                            final fetchlocation = BlocProvider
                                                .of<ServiceAreaBlocBlocBloc>(
                                                    context);
                                            fetchlocation.add(FetchServiceAraea(
                                                "9", newValue.toString()));

                                            gtdata.setPincode =
                                                newValue.toString();

                                            pincode = newValue;
                                            if (kDebugMode) {
                                              print("pincode" + newValue);
                                            }
                                          },
                                          // value: state.selectedpincode.length > 0
                                          //     ? null
                                          //     : state.selectedpincode,
                                          items: state
                                                  .pincodes.result.isNotEmpty
                                              ? state.pincodes.result
                                                  .map<DropdownMenuItem>(
                                                      (var value1) {
                                                  return DropdownMenuItem(
                                                    value: value1.pincode,
                                                    child: Text(value1.pincode,
                                                        style: const TextStyle(
                                                            fontSize: 15)),
                                                  );
                                                }).toList()
                                              : null,
                                          decoration: InputDecoration(
                                            labelStyle: const TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold),
                                            hintText: 'Pin Code',
                                            hintStyle: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15),
                                            focusColor: Colors.grey,
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                borderSide: const BorderSide(
                                                  color: Colors.white12,
                                                )),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                borderSide: const BorderSide(
                                                  color: Colors.white12,
                                                )),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                borderSide: const BorderSide(
                                                  color: Colors.white12,
                                                )),
                                          ),
                                        ),
                                      );
                                    } else if (state is LocationErrorState) {
                                      return const SizedBox();
                                    } else if (state is LocationLoadingstate) {
                                      return SizedBox(
                                          width: srcwidth * .80,
                                          height:
                                              SizeConfig.screenHeight * .080,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: const [
                                              Text("Pin code"),
                                              SpinKitCircle(
                                                color: Colors.blue,
                                                size: 50.0,
                                              ),
                                            ],
                                          ));
                                    } else {
                                      return Container();
                                    }
                                  })),
                                ),
                                Card(
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: BlocBuilder<ServiceAreaBlocBlocBloc,
                                          ServiceAreaBlocBlocState>(
                                      builder: (context, state) {
                                    if (state is ServiceAreaSuccesss) {
                                      return SizedBox(
                                        width: srcwidth * .80,
                                        height: SizeConfig.screenHeight * .090,
                                        child: DropdownButtonFormField<dynamic>(
                                            isExpanded: true,

                                            // style: AppTextStyle.textField(),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Service Area required';
                                              }
                                              return null;
                                            },
                                            //value: selectdServiceArea.toString(),
                                            onChanged: (newValue) {
                                              gtdata.setArea =
                                                  newValue.toString();
                                            },
                                            items: state.pincodes.result
                                                .map<DropdownMenuItem>(
                                                    (value1) {
                                              // selectdServiceAreaName =
                                              //     value1.oalOfficeName;
                                              // selectdServiceArea=value1.oalOfficeAddressId;
                                              return DropdownMenuItem(
                                                onTap: () {},
                                                alignment: Alignment.centerLeft,
                                                value: value1.oalOfficeAddressId
                                                    .toString(),
                                                child: Text(
                                                    value1.oalOfficeName,
                                                    style: const TextStyle(
                                                        fontSize: 15)),
                                              );
                                            }).toList(),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding: EdgeInsets.symmetric(
                                                  horizontal: SizeConfig
                                                          .blockSizeHorizontal *
                                                      2),
                                              hintText: 'Service Area',
                                              errorStyle: const TextStyle(
                                                fontSize: 10.0,
                                              ),

                                              hintStyle: const TextStyle(
                                                  color: Colors.grey),
                                              labelStyle: const TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold),

                                              //isDense: true,
                                            )),
                                      );
                                    } else if (state is ServiceAreaErrorState) {
                                      return const SizedBox();
                                    } else if (state
                                        is ServiceAreaLoadingstate) {
                                      return SizedBox(
                                          width: srcwidth * .78,
                                          height: srcheight * .10,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: const [
                                              Text("Service Area"),
                                              SpinKitCircle(
                                                color: Color.fromARGB(
                                                    255, 15, 55, 125),
                                                size: 30.0,
                                              ),
                                            ],
                                          ));
                                    } else {
                                      return Container();
                                    }
                                  }),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 4,
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 10),
                                    width: SizeConfig.screenWidth * .80,
                                    height: SizeConfig.screenHeight * .090,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: TextFormField(
                                        controller: referralcodeController,
                                        keyboardType: TextInputType.text,
                                        style: const TextStyle(fontSize: 15),
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        decoration: const InputDecoration(
                                          counterText: "",
                                          isCollapsed: true,
                                          hintText: "Referral Code",
                                          hintStyle: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey,
                                          ),
                                          border: InputBorder.none,
                                        ),
                                        maxLength: 6,
                                        maxLengthEnforcement:
                                            MaxLengthEnforcement.enforced,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: SizedBox(
                                      width: SizeConfig.screenWidth * .50,
                                      height: SizeConfig.screenHeight * .070,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (kDebugMode) {
                                            print(gtdata.getPincode.toString());
                                            print(gtdata.getArea.toString());
                                          }
                                          final validatebloc =
                                              BlocProvider.of<ValidationBloc>(
                                                  context);
                                          validatebloc.add(ValidEvent(
                                              nameController.text.toString(),
                                              "9",
                                              gtdata.getPincode,
                                              gtdata.getArea));
                                        },
                                        child: const Text(
                                          "Next",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            elevation: 5,
                                            primary: Colors.blueGrey),
                                      )),
                                ),
                              ],
                            ),
                          ]),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      });
    });
  }

  snackBarWidget(
      context, String msg, IconData icons, Color iconcolor, int time) {
    final snackbar = SnackBar(
      elevation: 1,
      behavior: SnackBarBehavior.fixed,
      backgroundColor: Colors.purple,
      duration: Duration(seconds: time),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            msg,
            style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Colors.lightBlue),
          ),
          Icon(
            icons,
            color: iconcolor,
          )
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
