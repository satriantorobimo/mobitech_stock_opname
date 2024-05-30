import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_stock_opname/features/navbar/navbar_provider.dart';
import 'package:mobile_stock_opname/utility/drop_down_util.dart';
import 'package:mobile_stock_opname/utility/general_util.dart';
import 'package:mobile_stock_opname/utility/string_router_util.dart';

import 'package:provider/provider.dart';

class AdditionalRequestDetailFormScreen extends StatefulWidget {
  const AdditionalRequestDetailFormScreen({super.key});

  @override
  State<AdditionalRequestDetailFormScreen> createState() =>
      _AdditionalRequestDetailFormScreenState();
}

enum Answer { internal, external }

class _AdditionalRequestDetailFormScreenState
    extends State<AdditionalRequestDetailFormScreen> {
  final TextEditingController _picCtrl = TextEditingController();
  final TextEditingController _assetNameCtrl = TextEditingController();
  final TextEditingController _serialNoCtrl = TextEditingController();
  final TextEditingController _warrantyCtrl = TextEditingController();
  final TextEditingController _priceCtrl = TextEditingController();
  final TextEditingController _totalCtrl = TextEditingController();
  final TextEditingController _netCtrl = TextEditingController();
  final TextEditingController _requestorCtrl = TextEditingController();
  double cardRadius = 40.0;
  String selectedLocation = '';
  String selectedCondition = '';
  String selectedStatus = '';
  String selectedReason = '';
  String selectedType = '';
  String selectRequest = 'Sell';

  Map<int, Answer?> answerVal = {};

  Future<void> _showBottomAttachment(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.6),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 24.0, left: 16, right: 16),
                  child: Text(
                    'Select Options',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 16.0),
                    child: InkWell(
                      onTap: () {},
                      child: const Text(
                        'Camera',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 16.0),
                    child: InkWell(
                      onTap: () {},
                      child: const Text(
                        'Gallery',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                    )),
                const SizedBox(height: 24),
              ],
            ),
          );
        });
  }

  @override
  void initState() {
    _assetNameCtrl.text = 'PRINTER EPSON L-5290';
    _serialNoCtrl.text = '0011.AS.2401.00004';
    _requestorCtrl.text = 'Naomi';
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
              Text('Additional Request',
                  style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 20,
                      color: Colors.white)),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shrinkWrap: true,
            children: [
              Stack(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.qr_code_2_rounded,
                        size: 100,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'PRINTER EPSON L-5290',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '0011.AS.2401.00004',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                          Text(
                            'Available - Used',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                          Text(
                            'Location  : Head Office',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                          Text(
                            'PIC           : Leonardo',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    right: 16,
                    bottom: 0,
                    child: GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/imgs/map.png',
                        width: 40,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Request Process To',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: () async {
                  await Navigator.pushNamed(
                          context, StringRouterUtil.dropDownScreenRoute,
                          arguments: 'Request')
                      .then((val) {
                    if (val != null) {
                      setState(() {
                        selectRequest = val.toString();
                      });
                    }
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.5, color: Color(0xFFE6E7E8)),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      selectRequest == ''
                          ? Text(
                              'Select Request',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 16,
                              ),
                            )
                          : Text(
                              selectRequest,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 16,
                              ),
                            ),
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              selectRequest == 'Sell'
                  ? formSell()
                  : selectRequest == 'Register'
                      ? formRegister()
                      : selectRequest == 'Disposal'
                          ? formDisposal()
                          : selectRequest == 'Maintenance'
                              ? formMaintenance()
                              : Container(),
              GestureDetector(
                onTap: () {
                  _showBottomAttachment(context);
                },
                child: DottedBorder(
                  color: Color(0xFFE6E7E8).withOpacity(0.5),
                  strokeWidth: 2,
                  radius: Radius.circular(cardRadius),
                  dashPattern: [10, 5],
                  customPath: (size) {
                    return Path()
                      ..moveTo(cardRadius, 0)
                      ..lineTo(size.width - cardRadius, 0)
                      ..arcToPoint(Offset(size.width, cardRadius),
                          radius: Radius.circular(cardRadius))
                      ..lineTo(size.width, size.height - cardRadius)
                      ..arcToPoint(Offset(size.width - cardRadius, size.height),
                          radius: Radius.circular(cardRadius))
                      ..lineTo(cardRadius, size.height)
                      ..arcToPoint(Offset(0, size.height - cardRadius),
                          radius: Radius.circular(cardRadius))
                      ..lineTo(0, cardRadius)
                      ..arcToPoint(Offset(cardRadius, 0),
                          radius: Radius.circular(cardRadius));
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 95,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.cloud_upload_rounded,
                          size: 60,
                          color: Color(0xFF7FE8EB),
                        ),
                        Text('Upload you file here!',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: 55,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [Color(0xFF5FF3131), Color(0xFFFF914D)],
                            begin: FractionalOffset(0.0, 0.0),
                            end: FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Center(
                        child: Text('Cancel',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  InkWell(
                    onTap: () {
                      var bottomBarProvider =
                          Provider.of<NavbarProvider>(context, listen: false);
                      bottomBarProvider.setPage(1);
                      bottomBarProvider.setTab(1);

                      GeneralUtil()
                          .showSnackBarSuccess(context, 'Berhasil Input Data');
                      Future.delayed(const Duration(seconds: 2), () {
                        Navigator.pushNamedAndRemoveUntil(
                            context,
                            StringRouterUtil.navbarScreenRoute,
                            (route) => false);
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: 55,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [Color(0xFF5DE0E6), Color(0xFF004AAD)],
                            begin: FractionalOffset(0.0, 0.0),
                            end: FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Center(
                        child: Text('Submit',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }

  Widget formSell() {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Remarks',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: _warrantyCtrl,
          maxLength: 500,
          minLines: 3,
          maxLines: 10,
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            counterStyle: TextStyle(color: Color(0xFFE6E7E8)),
            isDense: true,
            contentPadding: EdgeInsets.only(bottom: 16),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE6E7E8)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE6E7E8)),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  Widget formRegister() {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Asset Name',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: _assetNameCtrl,
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.only(bottom: 16),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE6E7E8)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE6E7E8)),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Serial No',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: _serialNoCtrl,
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.only(bottom: 16),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE6E7E8)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE6E7E8)),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Location',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        GestureDetector(
          onTap: () async {
            await Navigator.pushNamed(
                    context, StringRouterUtil.dropDownScreenRoute,
                    arguments: 'Location')
                .then((val) {
              if (val != null) {
                setState(() {
                  selectedCondition = val.toString();
                });
              }
            });
          },
          child: Container(
            width: double.infinity,
            height: 45,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.5, color: Color(0xFFE6E7E8)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                selectedLocation == ''
                    ? Text(
                        'Select Location',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 16,
                        ),
                      )
                    : Text(
                        selectedLocation,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 16,
                        ),
                      ),
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Condition',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        GestureDetector(
          onTap: () async {
            await Navigator.pushNamed(
                    context, StringRouterUtil.dropDownScreenRoute,
                    arguments: 'Condition')
                .then((val) {
              if (val != null) {
                setState(() {
                  selectedCondition = val.toString();
                });
              }
            });
          },
          child: Container(
            width: double.infinity,
            height: 45,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.5, color: Color(0xFFE6E7E8)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                selectedCondition == ''
                    ? Text(
                        'Select Condition',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 16,
                        ),
                      )
                    : Text(
                        selectedCondition,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 16,
                        ),
                      ),
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Status',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        GestureDetector(
          onTap: () async {
            await Navigator.pushNamed(
                    context, StringRouterUtil.dropDownScreenRoute,
                    arguments: 'Status')
                .then((val) {
              if (val != null) {
                setState(() {
                  selectedStatus = val.toString();
                });
              }
            });
          },
          child: Container(
            width: double.infinity,
            height: 45,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.5, color: Color(0xFFE6E7E8)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                selectedStatus == ''
                    ? Text(
                        'Select Status',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 16,
                        ),
                      )
                    : Text(
                        selectedStatus,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 16,
                        ),
                      ),
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'PIC',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: _picCtrl,
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.only(bottom: 16),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE6E7E8)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE6E7E8)),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Remarks',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: _warrantyCtrl,
          maxLength: 500,
          minLines: 3,
          maxLines: 10,
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            counterStyle: TextStyle(color: Color(0xFFE6E7E8)),
            isDense: true,
            contentPadding: EdgeInsets.only(bottom: 16),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE6E7E8)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE6E7E8)),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Opname Location',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          padding: EdgeInsetsDirectional.only(bottom: 16),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1.5, color: Color(0xFFE6E7E8)),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: const [
                  Text(
                    'Longitude  : ......',
                    style: TextStyle(fontSize: 16, color: Color(0xFFBFBFBF)),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Latitude     : ......',
                    style: TextStyle(fontSize: 16, color: Color(0xFFBFBFBF)),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: Image.asset(
                  'assets/imgs/map.png',
                  width: 40,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }

  Widget formDisposal() {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Asset Name',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: _assetNameCtrl,
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.only(bottom: 16),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE6E7E8)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE6E7E8)),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Serial No',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: _serialNoCtrl,
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.only(bottom: 16),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE6E7E8)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE6E7E8)),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Location',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        GestureDetector(
          onTap: () async {
            await Navigator.pushNamed(
                    context, StringRouterUtil.dropDownScreenRoute,
                    arguments: 'Location')
                .then((val) {
              if (val != null) {
                setState(() {
                  selectedCondition = val.toString();
                });
              }
            });
          },
          child: Container(
            width: double.infinity,
            height: 45,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.5, color: Color(0xFFE6E7E8)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                selectedLocation == ''
                    ? Text(
                        'Select Location',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 16,
                        ),
                      )
                    : Text(
                        selectedLocation,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 16,
                        ),
                      ),
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Purchase Price',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: _priceCtrl,
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.only(bottom: 16),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE6E7E8)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE6E7E8)),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Total Depre. Comm.',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: _totalCtrl,
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.only(bottom: 16),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE6E7E8)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE6E7E8)),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Net Book Value',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: _netCtrl,
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.only(bottom: 16),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE6E7E8)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE6E7E8)),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Requestor',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: _requestorCtrl,
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.only(bottom: 16),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE6E7E8)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE6E7E8)),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Reason',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        GestureDetector(
          onTap: () async {
            await Navigator.pushNamed(
                    context, StringRouterUtil.dropDownScreenRoute,
                    arguments: 'Reason')
                .then((val) {
              if (val != null) {
                setState(() {
                  selectedReason = val.toString();
                });
              }
            });
          },
          child: Container(
            width: double.infinity,
            height: 45,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.5, color: Color(0xFFE6E7E8)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                selectedReason == ''
                    ? Text(
                        'Select Reason',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 16,
                        ),
                      )
                    : Text(
                        selectedReason,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 16,
                        ),
                      ),
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Remarks',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: _warrantyCtrl,
          maxLength: 500,
          minLines: 3,
          maxLines: 10,
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            counterStyle: TextStyle(color: Color(0xFFE6E7E8)),
            isDense: true,
            contentPadding: EdgeInsets.only(bottom: 16),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE6E7E8)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE6E7E8)),
            ),
          ),
        ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }

  Widget formMaintenance() {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Asset Name',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: _assetNameCtrl,
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.only(bottom: 16),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE6E7E8)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE6E7E8)),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Serial No',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: _serialNoCtrl,
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.only(bottom: 16),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE6E7E8)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE6E7E8)),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Location',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        GestureDetector(
          onTap: () async {
            await Navigator.pushNamed(
                    context, StringRouterUtil.dropDownScreenRoute,
                    arguments: 'Location')
                .then((val) {
              if (val != null) {
                setState(() {
                  selectedCondition = val.toString();
                });
              }
            });
          },
          child: Container(
            width: double.infinity,
            height: 45,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.5, color: Color(0xFFE6E7E8)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                selectedLocation == ''
                    ? Text(
                        'Select Location',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 16,
                        ),
                      )
                    : Text(
                        selectedLocation,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 16,
                        ),
                      ),
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Maintenance By',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Theme(
          data: Theme.of(context).copyWith(
              unselectedWidgetColor: Colors.white, disabledColor: Colors.white),
          child: Row(
            children: [
              Expanded(
                child: RadioListTile<Answer>(
                  title: const Text(
                    'Internal',
                    style: TextStyle(fontSize: 13, color: Colors.white),
                  ),
                  value: Answer.internal,
                  groupValue: answerVal[0],
                  activeColor: Colors.white,
                  onChanged: (Answer? value) {
                    setState(() {
                      answerVal[0] = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: RadioListTile<Answer>(
                  title: const Text(
                    'External',
                    style: TextStyle(fontSize: 13, color: Colors.white),
                  ),
                  value: Answer.external,
                  activeColor: Colors.white,
                  groupValue: answerVal[0],
                  onChanged: (Answer? value) {
                    setState(() {
                      answerVal[0] = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Requestor',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: _requestorCtrl,
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.only(bottom: 16),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE6E7E8)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE6E7E8)),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Type of Service',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        GestureDetector(
          onTap: () async {
            await Navigator.pushNamed(
                    context, StringRouterUtil.dropDownScreenRoute,
                    arguments: 'Type of Service')
                .then((val) {
              if (val != null) {
                setState(() {
                  selectedType = val.toString();
                });
              }
            });
          },
          child: Container(
            width: double.infinity,
            height: 45,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.5, color: Color(0xFFE6E7E8)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                selectedType == ''
                    ? Text(
                        'Select Type of Service',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 16,
                        ),
                      )
                    : Text(
                        selectedType,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 16,
                        ),
                      ),
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Remarks',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: _warrantyCtrl,
          maxLength: 500,
          minLines: 3,
          maxLines: 10,
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            counterStyle: TextStyle(color: Color(0xFFE6E7E8)),
            isDense: true,
            contentPadding: EdgeInsets.only(bottom: 16),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE6E7E8)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE6E7E8)),
            ),
          ),
        ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }

  Widget mainContent() {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Condition',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        GestureDetector(
          onTap: () async {
            await Navigator.pushNamed(
                    context, StringRouterUtil.dropDownScreenRoute,
                    arguments: 'Condition')
                .then((val) {
              if (val != null) {
                setState(() {
                  selectedCondition = val.toString();
                });
              }
            });
          },
          child: Container(
            width: double.infinity,
            height: 45,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.5, color: Color(0xFFE6E7E8)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                selectedCondition == ''
                    ? Text(
                        'Select Condition',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 16,
                        ),
                      )
                    : Text(
                        selectedCondition,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 16,
                        ),
                      ),
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Status',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        GestureDetector(
          onTap: () async {
            await Navigator.pushNamed(
                    context, StringRouterUtil.dropDownScreenRoute,
                    arguments: 'Status')
                .then((val) {
              if (val != null) {
                setState(() {
                  selectedStatus = val.toString();
                });
              }
            });
          },
          child: Container(
            width: double.infinity,
            height: 45,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.5, color: Color(0xFFE6E7E8)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                selectedStatus == ''
                    ? Text(
                        'Select Status',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 16,
                        ),
                      )
                    : Text(
                        selectedStatus,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 16,
                        ),
                      ),
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'PIC',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: _picCtrl,
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.only(bottom: 16),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE6E7E8)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE6E7E8)),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Remarks',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: _warrantyCtrl,
          maxLength: 500,
          minLines: 3,
          maxLines: 10,
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            counterStyle: TextStyle(color: Color(0xFFE6E7E8)),
            isDense: true,
            contentPadding: EdgeInsets.only(bottom: 16),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE6E7E8)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE6E7E8)),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Opname Location',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          padding: EdgeInsetsDirectional.only(bottom: 16),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1.5, color: Color(0xFFE6E7E8)),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: const [
                  Text(
                    'Longitude  : ......',
                    style: TextStyle(fontSize: 16, color: Color(0xFFBFBFBF)),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Latitude     : ......',
                    style: TextStyle(fontSize: 16, color: Color(0xFFBFBFBF)),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: Image.asset(
                  'assets/imgs/map.png',
                  width: 40,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
