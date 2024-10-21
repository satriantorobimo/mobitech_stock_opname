import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_stock_opname/features/additional_request_detail_form/bloc/dd_employee_bloc/bloc.dart';
import 'package:mobile_stock_opname/features/additional_request_detail_form/bloc/dd_item_bloc/bloc.dart';
import 'package:mobile_stock_opname/features/additional_request_detail_form/bloc/dd_pc_bloc/bloc.dart';
import 'package:mobile_stock_opname/features/additional_request_detail_form/data/drop_down_employee.dart'
    as employee;
import 'package:mobile_stock_opname/features/additional_request_detail_form/data/drop_down_item_model.dart'
    as item;

import 'package:mobile_stock_opname/features/additional_request_detail_form/data/drop_down_model.dart'
    as pc;
import 'package:mobile_stock_opname/features/additional_request_detail_form/domain/repo/dd_repo.dart';
import 'package:mobile_stock_opname/utility/general_util.dart';

class DropDownScreen extends StatefulWidget {
  const DropDownScreen({super.key, required this.title});
  final String title;

  @override
  State<DropDownScreen> createState() => _DropDownScreenState();
}

class _DropDownScreenState extends State<DropDownScreen> {
  bool isLoading = true;
  List<String> location = [
    'BSD - Serpong Tangsel',
    'Alam Sutera - Tangerang',
    'Gading Serpong - Tangerang'
  ];

  List<String> condition = [
    'On Repair - External',
    'Replacement - External',
    'Sale - Internal'
  ];

  List<String> request = ['Sell', 'Register', 'Disposal', 'Maintenance'];
  List<String> reason = ['Broken'];
  List<String> type = ['Maintenance 5000km'];

  List<String> status = ['Available - Used'];

  DDItemBloc ddItemBloc = DDItemBloc(dropDownRepo: DropDownRepo());
  DDpcBloc dDpcBloc = DDpcBloc(dropDownRepo: DropDownRepo());
  DDemployeeBloc dDemployeeBloc = DDemployeeBloc(dropDownRepo: DropDownRepo());

  List<item.Data> dropDownItemModel = [];
  List<pc.Data> dropDownModel = [];
  List<employee.Data> dropDownEmployeeModel = [];
  List<item.Data> dropDownItemModelTemp = [];
  List<pc.Data> dropDownModelTemp = [];
  List<employee.Data> dropDownEmployeeModelTemp = [];

  @override
  void initState() {
    if (widget.title == 'item') {
      ddItemBloc.add(const DDItemAttempt(action: 'default'));
    } else if (widget.title == 'employee') {
      dDemployeeBloc.add(const DDemployeeAttempt(action: 'default'));
    } else {
      dDpcBloc.add(const DDpcAttempt(action: 'SGC.2410.00007'));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF130139),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.06,
                left: 16.0,
                right: 16.0),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Text(widget.title,
                    style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 20,
                        color: Colors.white)),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Material(
              elevation: 6,
              shadowColor: Colors.grey.withOpacity(0.4),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(width: 1.0, color: Color(0xFFEAEAEA))),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    setState(() {
                      if (widget.title == 'item') {
                        dropDownItemModelTemp = dropDownItemModel
                            .where((item) => item.itemName!
                                .toUpperCase()
                                .contains(value.toUpperCase()))
                            .toList();
                      } else if (widget.title == 'employee') {
                        dropDownEmployeeModelTemp = dropDownEmployeeModel
                            .where((item) => item.employeeName!
                                .toUpperCase()
                                .contains(value.toUpperCase()))
                            .toList();
                      } else {
                        dropDownModelTemp = dropDownModel
                            .where((item) => item.description!
                                .toUpperCase()
                                .contains(value.toUpperCase()))
                            .toList();
                      }
                    });
                  },
                  decoration: InputDecoration(
                      hintText: 'Search',
                      contentPadding: const EdgeInsets.only(top: 32, left: 16),
                      hintStyle: TextStyle(
                          fontSize: 18,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          color: Colors.grey.withOpacity(0.5)),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      )),
                ),
              ),
            ),
          ),
          MultiBlocListener(
            listeners: [
              BlocListener(
                bloc: ddItemBloc,
                listener: (_, DDItemState state) {
                  if (state is DDItemLoading) {
                    setState(() {
                      isLoading = true;
                    });
                  }
                  if (state is DDItemLoaded) {
                    setState(() {
                      isLoading = false;
                      dropDownItemModel = state.downItemModel.data!;
                      dropDownItemModelTemp = state.downItemModel.data!;
                    });
                  }
                  if (state is DDItemError) {
                    GeneralUtil().showSnackBarError(context, state.error!);
                    setState(() {
                      isLoading = false;
                    });
                  }
                  if (state is DDItemException) {
                    GeneralUtil().showSnackBarError(context, state.error);
                    setState(() {
                      isLoading = false;
                    });
                  }
                },
              ),
              BlocListener(
                bloc: dDpcBloc,
                listener: (_, DDpcState state) {
                  if (state is DDpcLoading) {
                    setState(() {
                      isLoading = true;
                    });
                  }
                  if (state is DDpcLoaded) {
                    setState(() {
                      isLoading = false;
                      dropDownModel = state.dropDownModel.data!;
                      dropDownModelTemp = state.dropDownModel.data!;
                    });
                  }
                  if (state is DDpcError) {
                    GeneralUtil().showSnackBarError(context, state.error!);
                    setState(() {
                      isLoading = false;
                    });
                  }
                  if (state is DDpcException) {
                    GeneralUtil().showSnackBarError(context, state.error);
                    setState(() {
                      isLoading = false;
                    });
                  }
                },
              ),
              BlocListener(
                bloc: dDemployeeBloc,
                listener: (_, DDemployeeState state) {
                  if (state is DDemployeeLoading) {
                    setState(() {
                      isLoading = true;
                    });
                  }
                  if (state is DDemployeeLoaded) {
                    setState(() {
                      isLoading = false;
                      dropDownEmployeeModel = state.dropDownEmployee.data!;
                      dropDownEmployeeModelTemp = state.dropDownEmployee.data!;
                    });
                  }
                  if (state is DDemployeeError) {
                    GeneralUtil().showSnackBarError(context, state.error!);
                    setState(() {
                      isLoading = false;
                    });
                  }
                  if (state is DDemployeeException) {
                    GeneralUtil().showSnackBarError(context, state.error);
                    setState(() {
                      isLoading = false;
                    });
                  }
                },
              )
            ],
            child: isLoading
                ? const Center(
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Expanded(
                    child: ListView.separated(
                        separatorBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 16, bottom: 16),
                            child: Container(
                              width: double.infinity,
                              height: 1,
                              color: Colors.grey.withOpacity(0.6),
                            ),
                          );
                        },
                        itemCount: widget.title == 'item'
                            ? dropDownItemModelTemp.isNotEmpty
                                ? dropDownItemModelTemp.length
                                : dropDownItemModel.length
                            : widget.title == 'pc'
                                ? dropDownModelTemp.isNotEmpty
                                    ? dropDownModelTemp.length
                                    : dropDownModel.length
                                : widget.title == 'employee'
                                    ? dropDownEmployeeModelTemp.isNotEmpty
                                        ? dropDownEmployeeModelTemp.length
                                        : dropDownEmployeeModel.length
                                    : widget.title == 'Location'
                                        ? location.length
                                        : widget.title == 'Condition'
                                            ? condition.length
                                            : widget.title == 'Request'
                                                ? request.length
                                                : widget.title == 'Reason'
                                                    ? reason.length
                                                    : widget.title ==
                                                            'Type of Service'
                                                        ? type.length
                                                        : status.length,
                        padding: const EdgeInsets.only(
                            left: 24.0, right: 24.0, bottom: 16, top: 16),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pop(context, {
                                'value': widget.title == 'item'
                                    ? dropDownItemModelTemp.isNotEmpty
                                        ? dropDownItemModelTemp[index].itemName
                                        : dropDownItemModel[index].itemName
                                    : widget.title == 'pc'
                                        ? dropDownModelTemp.isNotEmpty
                                            ? dropDownModelTemp[index]
                                                .description
                                            : dropDownModel[index].description
                                        : widget.title == 'employee'
                                            ? dropDownEmployeeModelTemp
                                                    .isNotEmpty
                                                ? dropDownEmployeeModelTemp[
                                                        index]
                                                    .employeeName
                                                : dropDownEmployeeModel[index]
                                                    .employeeName
                                            : widget.title == 'Location'
                                                ? location[index]
                                                : widget.title == 'Condition'
                                                    ? condition[index]
                                                    : widget.title == 'Request'
                                                        ? request[index]
                                                        : widget.title ==
                                                                'Reason'
                                                            ? reason[index]
                                                            : widget.title ==
                                                                    'Type of Service'
                                                                ? type[index]
                                                                : status[index],
                                'code': widget.title == 'item'
                                    ? dropDownItemModelTemp.isNotEmpty
                                        ? dropDownItemModelTemp[index].itemCode
                                        : dropDownItemModel[index].itemCode
                                    : widget.title == 'pc'
                                        ? dropDownModelTemp.isNotEmpty
                                            ? dropDownModelTemp[index].code
                                            : dropDownModel[index].code
                                        : widget.title == 'employee'
                                            ? dropDownEmployeeModelTemp
                                                    .isNotEmpty
                                                ? dropDownEmployeeModelTemp[
                                                        index]
                                                    .employeeCode
                                                : dropDownEmployeeModel[index]
                                                    .employeeCode
                                            : ''
                              });
                            },
                            child: Text(
                              widget.title == 'item'
                                  ? dropDownItemModelTemp.isNotEmpty
                                      ? dropDownItemModelTemp[index].itemName!
                                      : dropDownItemModel[index].itemName!
                                  : widget.title == 'pc'
                                      ? dropDownModelTemp.isNotEmpty
                                          ? dropDownModelTemp[index]
                                              .description!
                                          : dropDownModel[index].description!
                                      : widget.title == 'employee'
                                          ? dropDownEmployeeModelTemp.isNotEmpty
                                              ? dropDownEmployeeModelTemp[index]
                                                  .employeeName!
                                              : dropDownEmployeeModel[index]
                                                  .employeeName!
                                          : widget.title == 'Location'
                                              ? location[index]
                                              : widget.title == 'Condition'
                                                  ? condition[index]
                                                  : widget.title == 'Request'
                                                      ? request[index]
                                                      : widget.title == 'Reason'
                                                          ? reason[index]
                                                          : widget.title ==
                                                                  'Type of Service'
                                                              ? type[index]
                                                              : status[index],
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          );
                        }),
                  ),
          ),
        ]));
  }
}
