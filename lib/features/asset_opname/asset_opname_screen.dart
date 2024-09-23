import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_stock_opname/features/asset_opname_detail/bloc/asset_grow_bloc/bloc.dart';
import 'package:mobile_stock_opname/features/asset_opname_detail/data/arguments_asset_grow.dart';
import 'package:mobile_stock_opname/features/asset_opname_detail/data/asset_grow_request_model.dart';
import 'package:mobile_stock_opname/features/asset_opname_detail/domain/repo/asset_grow_repo.dart';
import 'package:mobile_stock_opname/utility/general_util.dart';
import 'package:mobile_stock_opname/utility/string_router_util.dart';

class AssetOpnameScreen extends StatefulWidget {
  const AssetOpnameScreen({super.key});

  @override
  State<AssetOpnameScreen> createState() => _AssetOpnameScreenState();
}

class _AssetOpnameScreenState extends State<AssetOpnameScreen> {
  bool readOnly = true;
  FocusNode assetFocus = FocusNode();
  final TextEditingController _assetCodeCtrl = TextEditingController();
  bool isLoading = false;
  AssetGrowBloc assetGrowBloc = AssetGrowBloc(assetGrowRepo: AssetGrowRepo());

  @override
  void dispose() {
    assetFocus.dispose();
    super.dispose();
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
              Text('Asset Opname',
                  style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 20,
                      color: Colors.white)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Asset',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                focusNode: assetFocus,
                controller: _assetCodeCtrl,
                style: const TextStyle(color: Colors.white),
                readOnly: readOnly,
                keyboardType: TextInputType.text,
                onEditingComplete: () {
                  setState(() {
                    readOnly = !readOnly;
                    try {
                      if (readOnly) {
                        assetFocus.unfocus();
                      } else {
                        assetFocus.requestFocus();
                      }
                    } catch (e) {
                      print(e);
                    }
                  });
                  assetGrowBloc.add(AssetGrowAttempt(
                      assetGrowRequestModel: AssetGrowRequestModel(
                          _assetCodeCtrl.text, 'BARCODE')));
                },
                decoration: InputDecoration(
                  hintText: 'Asset Code   -   Asset Name',
                  hintStyle: TextStyle(
                    color: const Color(0xFFBFBFBF).withOpacity(0.5),
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                  ),
                  isDense: true,
                  contentPadding: const EdgeInsets.only(bottom: 16),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE6E7E8)),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE6E7E8)),
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: isLoading
                        ? null
                        : () async {
                            await Navigator.pushNamed(context,
                                    StringRouterUtil.scannerScreenRoute)
                                .then((val) {
                              setState(() {
                                _assetCodeCtrl.text = val.toString();
                              });
                              assetGrowBloc.add(AssetGrowAttempt(
                                  assetGrowRequestModel: AssetGrowRequestModel(
                                      _assetCodeCtrl.text, 'BARCODE')));
                            });
                          },
                    child: BlocListener(
                        bloc: assetGrowBloc,
                        listener: (_, AssetGrowState state) {
                          if (state is AssetGrowLoading) {
                            setState(() {
                              isLoading = true;
                            });
                          }
                          if (state is AssetGrowLoaded) {
                            setState(() {
                              isLoading = false;
                            });
                            Navigator.pushNamed(context,
                                StringRouterUtil.assetOpnameDetailScreenRoute,
                                arguments: ArgumentsAssetGrow(
                                    false, state.assetGrowResponseModel));
                          }
                          if (state is AssetGrowError) {
                            GeneralUtil()
                                .showSnackBarError(context, state.error!);
                            setState(() {
                              isLoading = false;
                            });
                          }
                          if (state is AssetGrowException) {
                            GeneralUtil().showSnackBarError(
                                context, 'Terjadi Kesalahan Sistem');
                            setState(() {
                              isLoading = false;
                            });
                          }
                        },
                        child: BlocBuilder(
                            bloc: assetGrowBloc,
                            builder: (_, AssetGrowState state) {
                              return isLoading
                                  ? const Center(
                                      child: SizedBox(
                                        width: 45,
                                        height: 45,
                                        child: CircularProgressIndicator(),
                                      ),
                                    )
                                  : Column(
                                      children: [
                                        const Icon(
                                          Icons.photo_camera,
                                          size: 50,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          'Scan',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontFamily: GoogleFonts.poppins()
                                                .fontFamily,
                                          ),
                                        ),
                                      ],
                                    );
                            })),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        readOnly = !readOnly;
                        try {
                          if (readOnly) {
                            assetFocus.unfocus();
                          } else {
                            assetFocus.requestFocus();
                          }
                        } catch (e) {
                          print(e);
                        }
                      });
                    },
                    child: Column(
                      children: [
                        const Icon(
                          Icons.keyboard_outlined,
                          size: 50,
                          color: Colors.white,
                        ),
                        Text(
                          'Serial No',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}
