import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_stock_opname/features/asset_opname_detail/content_data_widget.dart';
import 'package:mobile_stock_opname/features/asset_opname_detail/data/arguments_asset_grow.dart';
import 'package:mobile_stock_opname/features/asset_opname_detail/data/data_content.dart';
import 'package:mobile_stock_opname/utility/string_router_util.dart';

class AssetOpnameDetailScreen extends StatefulWidget {
  const AssetOpnameDetailScreen({super.key, required this.argumentsAssetGrow});
  final ArgumentsAssetGrow argumentsAssetGrow;

  @override
  State<AssetOpnameDetailScreen> createState() =>
      _AssetOpnameDetailScreenState();
}

class _AssetOpnameDetailScreenState extends State<AssetOpnameDetailScreen> {
  List<DataContent> dataContent = [];

  @override
  void initState() {
    setState(() {
      if (widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
              .assetTypeCode ==
          'VHCL') {
        setState(() {
          dataContent.add(DataContent(
              'Item',
              '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].code!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].itemName!}',
              false));
          dataContent.add(DataContent(
              'FA Type & Category',
              '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].typeAndCategoryName!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].itemName!}',
              false));
          dataContent.add(DataContent(
              'Merk - Model - Type',
              '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].merkName!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].modelName!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].typeName!}',
              false));
          dataContent.add(DataContent(
              'Colour',
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .colourName!,
              false));
          dataContent.add(DataContent(
              'Manufacturing Year',
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .manufacturingYear!,
              false));
          dataContent.add(DataContent(
              'Chasis No.',
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .chassisNo!,
              false));
          dataContent.add(DataContent(
              'Engine No.',
              widget
                  .argumentsAssetGrow.assetGrowResponseModel.data![0].engineNo!,
              false));
          dataContent.add(DataContent(
              'Cylinder Capacity',
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .cylinderCapacity!,
              false));
          dataContent.add(DataContent(
              'Fuel Type',
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .fuelTypeCode!,
              false));
          dataContent.add(DataContent(
              'Passenger Capacity',
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .passengerCapacity!,
              false));
          dataContent.add(DataContent(
              'License Plate',
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0].platNo!,
              false));
          dataContent.add(DataContent(
              'BPKB No. / SPPBPKB',
              '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].bpkbNo!} / ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].spbpkbNo!}',
              false));
          dataContent.add(DataContent(
              'STNK No.',
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0].stnkNo!,
              false));
          dataContent.add(DataContent(
              'STNK Tax Date',
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .stnkTaxDate!,
              false));
          dataContent.add(DataContent(
              'STNK Exp. Date',
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .stnkExpiredDate!,
              false));
          dataContent.add(DataContent(
              'Insured',
              '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].isInsured!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].numberOfCoverage!} year',
              false));
          dataContent.add(DataContent(
              'Coverage Type',
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .coverageType!,
              false));
          dataContent.add(DataContent(
              'Factory Warranty',
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                          .factoryWarrantyPeriodTypeName!
                          .toUpperCase() ==
                      'PERIODIC'
                  ? '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].factoryWarrantyPeriodTypeName!} |  ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].factoryWarrantyStartDate!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].factoryWarrantyEndDate!}'
                  : widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                              .factoryWarrantyPeriodTypeName!
                              .toUpperCase() ==
                          'LIFETIME'
                      ? '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].factoryWarrantyPeriodTypeName!} |  ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].factoryWarrantyStartDate!}'
                      : '-',
              false));
          dataContent.add(DataContent(
              'Vendor Warranty',
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                          .vendorWarrantyPeriodTypeName!
                          .toUpperCase() ==
                      'PERIODIC'
                  ? '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].vendorWarrantyPeriodTypeName!} |  ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].vendorWarrantyStartDate!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].vendorWarrantyEndDate!}'
                  : widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                              .vendorWarrantyPeriodTypeName!
                              .toUpperCase() ==
                          'LIFETIME'
                      ? '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].vendorWarrantyPeriodTypeName!} |  ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].vendorWarrantyStartDate!}'
                      : '-',
              false));
          dataContent.add(DataContent(
              'Maintenance Routine',
              '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].maintenanceStartDate!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].maintenanceEndDate!}',
              false));
          dataContent.add(DataContent(
              'Purchasing Date',
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .purchaseDate!,
              false));
          dataContent.add(DataContent(
              'Purchase Asset Condition',
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .condition!,
              false));
          dataContent.add(DataContent(
              'PO No. & PO Date',
              '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].purchaseOrderNo!} | ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].purchaseDate!}',
              false));
          dataContent.add(DataContent(
              'GRN No. & GRN Date',
              '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].grnNo!} | ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].grnDate!}',
              false));
          dataContent.add(DataContent(
              'Invoice No. & Invoice Date',
              '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].invoiceNo!} | ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].invoiceDate!}',
              false));
          dataContent.add(DataContent(
              'Vendor',
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .vendorName!,
              false));
          dataContent.add(DataContent(
              'Vendor Rating',
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .averageRating!
                  .toString(),
              false));
          dataContent.add(DataContent(
              'Depreciation',
              '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].isDepre!} -  ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].methodTypeComm!}',
              false));
          dataContent.add(DataContent(
              'Asset Location',
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .locationName!,
              true));
        });
      } else {
        dataContent.add(DataContent(
            'Item',
            '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].code!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].itemName!}',
            false));
        dataContent.add(DataContent(
            'FA Type & Category',
            '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].typeAndCategoryName!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].itemName!}',
            false));
        dataContent.add(DataContent(
            'Merk - Model - Type',
            '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].merkName!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].modelName!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].typeName!}',
            false));
        dataContent.add(DataContent(
            'Colour',
            widget
                .argumentsAssetGrow.assetGrowResponseModel.data![0].colourName!,
            false));
        dataContent.add(DataContent(
            'Serial No.',
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0].serialNo!,
            false));
        dataContent.add(DataContent(
            'IMEI',
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0].imei!,
            false));
        dataContent.add(DataContent(
            'Insured',
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                        .isInsured! ==
                    'No'
                ? widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .isInsured!
                : '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].isInsured!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].numberOfCoverage!} year',
            false));
        dataContent.add(DataContent(
            'Factory Warranty',
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                        .factoryWarrantyPeriodTypeName!
                        .toUpperCase() ==
                    'PERIODIC'
                ? '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].factoryWarrantyPeriodTypeName!} |  ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].factoryWarrantyStartDate!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].factoryWarrantyEndDate!}'
                : widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                            .factoryWarrantyPeriodTypeName!
                            .toUpperCase() ==
                        'LIFETIME'
                    ? '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].factoryWarrantyPeriodTypeName!} |  ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].factoryWarrantyStartDate!}'
                    : '-',
            false));
        dataContent.add(DataContent(
            'Vendor Warranty',
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                        .vendorWarrantyPeriodTypeName!
                        .toUpperCase() ==
                    'PERIODIC'
                ? '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].vendorWarrantyPeriodTypeName!} |  ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].vendorWarrantyStartDate!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].vendorWarrantyEndDate!}'
                : widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                            .vendorWarrantyPeriodTypeName!
                            .toUpperCase() ==
                        'LIFETIME'
                    ? '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].vendorWarrantyPeriodTypeName!} |  ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].vendorWarrantyStartDate!}'
                    : '-',
            false));
        dataContent.add(DataContent(
            'Maintenance Routine',
            '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].maintenanceStartDate!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].maintenanceEndDate!}',
            false));
        dataContent.add(DataContent(
            'Purchasing Date',
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                .purchaseDate!,
            false));
        dataContent.add(DataContent(
            'Purchase Asset Condition',
            widget
                .argumentsAssetGrow.assetGrowResponseModel.data![0].condition!,
            false));
        dataContent.add(DataContent(
            'PO No. & PO Date',
            '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].purchaseOrderNo!} | ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].purchaseDate!}',
            false));
        dataContent.add(DataContent(
            'GRN No. & GRN Date',
            '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].grnNo!} | ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].grnDate!}',
            false));
        dataContent.add(DataContent(
            'Invoice No. & Invoice Date',
            '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].invoiceNo!} | ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].invoiceDate!}',
            false));
        dataContent.add(DataContent(
            'Vendor',
            widget
                .argumentsAssetGrow.assetGrowResponseModel.data![0].vendorName!,
            false));
        dataContent.add(DataContent(
            'Vendor Rating',
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                .averageRating!
                .toString(),
            false));
        dataContent.add(DataContent(
            'Depreciation',
            '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].isDepre!} -  ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].methodTypeComm!}',
            false));
        dataContent.add(DataContent(
            'Asset Location',
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                .locationName!,
            true));
      }
    });
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
              Text('Asset Opname',
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
              Container(
                decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xFFbfbfbf), width: 2.5)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.28,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Color(0xFFf15959),
                                borderRadius: BorderRadius.all(Radius.circular(
                                        16.0) //                 <--- border radius here
                                    ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32, vertical: 8),
                                child: Text(
                                  widget.argumentsAssetGrow
                                      .assetGrowResponseModel.data![0].status!,
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Icon(
                                  Icons.qr_code_2_rounded,
                                  size: 75,
                                  color: Colors.white,
                                ),
                                Icon(
                                  Icons.print_sharp,
                                  size: 33,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            const Text(
                              '0011.AS.2401.00004',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.46,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].itemName!} ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].description!}',
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text(
                              widget.argumentsAssetGrow.assetGrowResponseModel
                                  .data![0].code!,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.white),
                            ),
                            Text(
                              'Usefull life : ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].usefull!} Years',
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.white),
                            ),
                            Text(
                              'Location : ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].locationName!}',
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.white),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'PIC :',
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.36,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ' ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].picCode!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].picName!}',
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.white),
                                      ),
                                      Text(
                                        ' ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].picPositionName!}',
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'User :',
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.36,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ' ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].userCode!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].userName!}',
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.white),
                                      ),
                                      Text(
                                        ' ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].userPositionName!}',
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              ListView.separated(
                itemCount: dataContent.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 16,
                  );
                },
                itemBuilder: (context, index) {
                  return dataContent.isEmpty
                      ? Container()
                      : dataContent[index].isLocation == false
                          ? ContentDataWidget(
                              title: dataContent[index].title,
                              content: dataContent[index].value)
                          : Column(
                              children: [
                                Text(
                                  dataContent[index].title,
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.only(bottom: 8),
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                              width: 1,
                                              color: Color(0xFFE6E7E8)),
                                        ),
                                      ),
                                      child: Text(
                                        dataContent[index].value,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Color(0xFFbfbfbf)),
                                      ),
                                    ),
                                    Positioned(
                                      right: 8,
                                      top: 0,
                                      bottom: 8,
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
                              ],
                            );
                },
              ),
              const SizedBox(
                height: 24,
              ),
              Visibility(
                visible: !widget.argumentsAssetGrow.isInput,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context,
                        StringRouterUtil.assetOpnameDetailFormScreenRoute);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: 66,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [Color(0xFF5DE0E6), Color(0xFF004AAD)],
                            begin: FractionalOffset(0.0, 0.0),
                            end: FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('Next',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(width: 4),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
