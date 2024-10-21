import 'dart:developer';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_stock_opname/features/additional_request_detail_form/bloc/submit_add_req_bloc/bloc.dart';
import 'package:mobile_stock_opname/features/additional_request_detail_form/bloc/upload_doc_req_bloc/bloc.dart';
import 'package:mobile_stock_opname/features/additional_request_detail_form/data/argument_add_request.dart';
import 'package:mobile_stock_opname/features/additional_request_detail_form/data/attachment_list.dart';
import 'package:mobile_stock_opname/features/additional_request_detail_form/data/submit_request_model.dart';
import 'package:mobile_stock_opname/features/additional_request_detail_form/data/upload_doc_request_model.dart';
import 'package:mobile_stock_opname/features/additional_request_detail_form/domain/repo/submit_add_req_repo.dart';
import 'package:mobile_stock_opname/features/navbar/navbar_provider.dart';
import 'package:mobile_stock_opname/utility/general_util.dart';
import 'package:mobile_stock_opname/utility/string_router_util.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart' as path;
import 'package:provider/provider.dart';

class AdditionalRequestDetailFormScreen extends StatefulWidget {
  const AdditionalRequestDetailFormScreen(
      {super.key, required this.argumentAddReq});
  final ArgumentAddReq argumentAddReq;

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
  final TextEditingController _remarksCtrl = TextEditingController();

  double cardRadius = 40.0;
  String selectedLocation = '';
  String selectedPurchaseCondition = '';
  String selectedStatus = '';
  String selectedReason = '';
  String selectedType = '';
  String selectRequest = 'Register';
  String itemCode = '';
  String picCode = '';
  bool isLoading = false;
  bool isSubmit = false;
  String assetCode = '';
  int counter = 0;

  Map<int, Answer?> answerVal = {};

  List<AttachmentList> attachmentList = [];

  SubmitAddReqBloc submitAddReqBloc =
      SubmitAddReqBloc(submitAddReqRepo: SubmitAddReqRepo());

  UploadDocReqBloc uploadDocReqBloc =
      UploadDocReqBloc(submitAddReqRepo: SubmitAddReqRepo());

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
                      onTap: () {
                        pickImage().then((value) {
                          if (value == 'big') {
                            GeneralUtil()
                                .showSnackBarError(context, 'Size Maximal 2MB');
                          }
                          Navigator.pop(context);
                        });
                      },
                      child: const Text(
                        'Gallery',
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
                      onTap: () {
                        pickFile().then((value) {
                          if (value == 'big') {
                            GeneralUtil()
                                .showSnackBarError(context, 'Size Maximal 2MB');
                          }
                          Navigator.pop(context);
                        });
                      },
                      child: const Text(
                        'File Explorer',
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
    super.initState();
  }

  Future<String> pickFile() async {
    var maxFileSizeInBytes = 2 * 1048576;
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'png', 'doc', 'docx'],
    );

    if (result != null) {
      var fileSize = result.files.first.size;
      if (fileSize <= maxFileSizeInBytes) {
        String filePath = result.files.single.path!;
        String basename = path.basename(filePath);
        final ext = path.extension(basename);
        setState(() {
          attachmentList.add(AttachmentList(filePath, basename, ext));
        });
      } else {
        return 'big';
      }
      return 'yes';
    } else {
      return 'notselect';
    }
  }

  Future<String> pickImage() async {
    try {
      var maxFileSizeInBytes = 2 * 1048576;
      ImagePicker imagePicker = ImagePicker();
      XFile? pickedImage = await imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 90,
      );
      if (pickedImage == null) return 'notselect';

      var imagePath = await pickedImage.readAsBytes();
      var fileSize = imagePath.length; // Get the file size in bytes
      if (fileSize <= maxFileSizeInBytes) {
        String basename = path.basename(pickedImage.path);
        final ext = path.extension(basename);
        setState(() {
          attachmentList.add(AttachmentList(pickedImage.path, basename, ext));
        });
      } else {
        return 'big';
      }

      return 'yes';
    } on PlatformException catch (e) {
      log('Failed to pick image: $e');
      return 'notselect';
    }
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
              widget.argumentAddReq.isNotfound
                  ? const Center(
                      child: Text(
                        'Asset Not Found',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    )
                  : Stack(
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
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                                Text(
                                  'Available - Used',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                                Text(
                                  'Location  : Head Office',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                                Text(
                                  'PIC           : Leonardo',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
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
                onTap: widget.argumentAddReq.isNotfound
                    ? null
                    : () async {
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
                  color: const Color(0xFFE6E7E8).withOpacity(0.5),
                  strokeWidth: 2,
                  radius: Radius.circular(cardRadius),
                  dashPattern: const [10, 5],
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
                      children: const [
                        Icon(
                          Icons.cloud_upload_rounded,
                          size: 60,
                          color: Color(0xFF7FE8EB),
                        ),
                        Text('Attach you file here!',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
              ),
              attachmentList.isNotEmpty
                  ? const SizedBox(
                      height: 8,
                    )
                  : Container(),
              attachmentList.isNotEmpty
                  ? Expanded(
                      child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12)),
                                  border: Border.all(color: Colors.white)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(attachmentList[index].fileName,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600)),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          if (attachmentList[index].fileType ==
                                              '.pdf') {
                                            await OpenFile.open(
                                                attachmentList[index].filePath);
                                          } else if (attachmentList[index]
                                                      .fileType ==
                                                  '.jpg' ||
                                              attachmentList[index].fileType ==
                                                  '.png' ||
                                              attachmentList[index].fileType ==
                                                  '.jpeg') {
                                            Navigator.pushNamed(
                                                context,
                                                StringRouterUtil
                                                    .docPreviewScreenRoute,
                                                arguments: attachmentList[index]
                                                    .filePath);
                                          } else {}
                                        },
                                        child: const Icon(
                                          Icons.preview_rounded,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            attachmentList.removeAt(index);
                                          });
                                        },
                                        child: const Icon(
                                          Icons.close_rounded,
                                          color: Colors.red,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 12);
                          },
                          itemCount: attachmentList.length))
                  : Container(),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: isSubmit
                        ? null
                        : () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            Navigator.pop(context);
                          },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: 55,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              isSubmit ? Colors.grey : const Color(0xff5ff3131),
                              isSubmit ? Colors.grey : const Color(0xFFFF914D)
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 0.0),
                            stops: const [0.0, 1.0],
                            tileMode: TileMode.clamp),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: const Center(
                        child: Text('Cancel',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  MultiBlocListener(
                    listeners: [
                      BlocListener(
                        bloc: submitAddReqBloc,
                        listener: (_, SubmitAddReqState state) {
                          if (state is SubmitAddReqLoading) {
                            setState(() {
                              isLoading = true;
                            });
                          }
                          if (state is SubmitAddReqLoaded) {
                            setState(() {
                              assetCode = state.generalResponseModel.code!;
                            });
                            uploadDocReqBloc.add(UploadDocReqAttempt(
                                uploadDocRequestModel: UploadDocRequestModel(
                                    pAssetRegisterCode: assetCode,
                                    filePath: attachmentList[counter].filePath,
                                    pFileName:
                                        attachmentList[counter].fileName)));
                          }
                          if (state is SubmitAddReqError) {
                            GeneralUtil()
                                .showSnackBarError(context, state.error!);
                            setState(() {
                              isLoading = false;
                            });
                          }
                          if (state is SubmitAddReqException) {
                            GeneralUtil()
                                .showSnackBarError(context, state.error);
                            setState(() {
                              isLoading = false;
                            });
                          }
                        },
                      ),
                      BlocListener(
                        bloc: uploadDocReqBloc,
                        listener: (_, UploadDocReqState state) {
                          if (state is UploadDocReqLoading) {
                            setState(() {
                              isLoading = true;
                            });
                          }
                          if (state is UploadDocReqLoaded) {
                            counter++;
                            if (counter < attachmentList.length) {
                              uploadDocReqBloc.add(UploadDocReqAttempt(
                                  uploadDocRequestModel: UploadDocRequestModel(
                                      pAssetRegisterCode: assetCode,
                                      filePath:
                                          attachmentList[counter].filePath,
                                      pFileName:
                                          attachmentList[counter].fileName)));
                            } else {
                              setState(() {
                                isLoading = false;
                                isSubmit = true;
                              });
                              var bottomBarProvider =
                                  Provider.of<NavbarProvider>(context,
                                      listen: false);
                              bottomBarProvider.setPage(2);
                              bottomBarProvider.setTab(2);
                              GeneralUtil().showSnackBarSuccess(
                                  context, 'Input Data Successfully');
                              Future.delayed(const Duration(seconds: 1), () {
                                Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    StringRouterUtil.navbarScreenRoute,
                                    (route) => false);
                              });
                            }
                          }
                          if (state is UploadDocReqError) {
                            GeneralUtil()
                                .showSnackBarError(context, state.error!);
                            setState(() {
                              isLoading = false;
                            });
                          }
                          if (state is UploadDocReqException) {
                            GeneralUtil()
                                .showSnackBarError(context, state.error);
                            setState(() {
                              isLoading = false;
                            });
                          }
                        },
                      ),
                    ],
                    child: isLoading
                        ? SizedBox(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: 55,
                            child: const Center(
                                child: CircularProgressIndicator()),
                          )
                        : InkWell(
                            onTap: isSubmit
                                ? null
                                : () {
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    if (selectRequest == 'Register') {
                                      if (attachmentList.isEmpty ||
                                          _assetNameCtrl.text == '' ||
                                          _assetNameCtrl.text.isEmpty ||
                                          selectedPurchaseCondition == '' ||
                                          _remarksCtrl.text == '' ||
                                          _remarksCtrl.text.isEmpty) {
                                        GeneralUtil().showSnackBarError(context,
                                            'Required field cannot be empty');
                                      } else {
                                        submitAddReqBloc.add(SubmitAddReqAttempt(
                                            submitRequestModel:
                                                SubmitRequestModel(
                                                    pItemCode: itemCode,
                                                    pPicCode: picCode,
                                                    pPurchaseCondition:
                                                        selectedPurchaseCondition,
                                                    pRemarksMobile:
                                                        _remarksCtrl.text)));
                                      }
                                    }
                                  },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.35,
                              height: 55,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      isSubmit
                                          ? Colors.grey
                                          : const Color(0xFF5DE0E6),
                                      isSubmit
                                          ? Colors.grey
                                          : const Color(0xFF004AAD)
                                    ],
                                    begin: const FractionalOffset(0.0, 0.0),
                                    end: const FractionalOffset(1.0, 0.0),
                                    stops: const [0.0, 1.0],
                                    tileMode: TileMode.clamp),
                                borderRadius: BorderRadius.circular(28),
                              ),
                              child: const Center(
                                child: Text('Submit',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600)),
                              ),
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
            'Item *',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Stack(
          children: [
            TextFormField(
              controller: _assetNameCtrl,
              readOnly: true,
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
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: GestureDetector(
                onTap: () async {
                  final result = await Navigator.pushNamed(
                      context, StringRouterUtil.dropDownScreenRoute,
                      arguments: 'item');

                  if (result != null && result is Map<String, String>) {
                    setState(() {
                      _assetNameCtrl.text = result['value']!;
                      itemCode = result['code']!;
                    });
                  }
                },
                child: const Icon(
                  Icons.search,
                  size: 32,
                  color: Color(0xFFE6E7E8),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Purchase Condition *',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        GestureDetector(
          onTap: () async {
            final result = await Navigator.pushNamed(
                context, StringRouterUtil.dropDownScreenRoute,
                arguments: 'pc');
            log(result.toString());
            if (result != null && result is Map<String, String>) {
              setState(() {
                selectedPurchaseCondition = result['value']!;
              });
            }
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
                selectedPurchaseCondition == ''
                    ? Text(
                        'Select Purchase Condition',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 16,
                        ),
                      )
                    : Text(
                        selectedPurchaseCondition,
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
        Stack(
          children: [
            TextFormField(
              controller: _picCtrl,
              style: const TextStyle(color: Colors.white),
              readOnly: true,
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
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: GestureDetector(
                onTap: () async {
                  final result = await Navigator.pushNamed(
                      context, StringRouterUtil.dropDownScreenRoute,
                      arguments: 'employee');

                  if (result != null && result is Map<String, String>) {
                    setState(() {
                      _picCtrl.text = result['value']!;
                      picCode = result['code']!;
                    });
                  }
                },
                child: const Icon(
                  Icons.search,
                  size: 32,
                  color: Color(0xFFE6E7E8),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Remarks *',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: _remarksCtrl,
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
                  selectedPurchaseCondition = val.toString();
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
                  selectedPurchaseCondition = val.toString();
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
                  selectedPurchaseCondition = val.toString();
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
                selectedPurchaseCondition == ''
                    ? Text(
                        'Select Condition',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 16,
                        ),
                      )
                    : Text(
                        selectedPurchaseCondition,
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
          padding: const EdgeInsetsDirectional.only(bottom: 16),
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
