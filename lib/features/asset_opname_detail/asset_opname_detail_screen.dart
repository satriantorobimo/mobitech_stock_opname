import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_stock_opname/features/asset_opname_detail/data/arguments_asset_grow.dart';
import 'package:mobile_stock_opname/utility/string_router_util.dart';

class AssetOpnameDetailScreen extends StatefulWidget {
  const AssetOpnameDetailScreen({super.key, required this.argumentsAssetGrow});
  final ArgumentsAssetGrow argumentsAssetGrow;

  @override
  State<AssetOpnameDetailScreen> createState() =>
      _AssetOpnameDetailScreenState();
}

class _AssetOpnameDetailScreenState extends State<AssetOpnameDetailScreen> {
  final TextEditingController _itemCtrl = TextEditingController();
  final TextEditingController _typeCategoryCtrl = TextEditingController();
  final TextEditingController _merkModelTypeCtrl = TextEditingController();
  final TextEditingController _colourCtrl = TextEditingController();
  final TextEditingController _manufactureYearCtrl = TextEditingController();
  final TextEditingController _chasisCtrl = TextEditingController();
  final TextEditingController _engineCtrl = TextEditingController();
  final TextEditingController _cynlinderCtrl = TextEditingController();
  final TextEditingController _fuelTypeCtrl = TextEditingController();
  final TextEditingController _passangerCapacityCtrl = TextEditingController();
  final TextEditingController _licensePlateCtrl = TextEditingController();
  final TextEditingController _bpkbNoCtrl = TextEditingController();
  final TextEditingController _stnkNoCtrl = TextEditingController();
  final TextEditingController _stnkTaxDateCtrl = TextEditingController();
  final TextEditingController _stnkExpDateCtrl = TextEditingController();
  final TextEditingController _insuredCtrl = TextEditingController();
  final TextEditingController _coverageTypeCtrl = TextEditingController();
  final TextEditingController _factoryWarrantyCtrl = TextEditingController();
  final TextEditingController _vendorWarrantyCtrl = TextEditingController();
  final TextEditingController _maintenanceRoutineCtrl = TextEditingController();
  final TextEditingController _purchaseDateCtrl = TextEditingController();
  final TextEditingController _purchasAssetCondition = TextEditingController();
  final TextEditingController _poNoPoDateCtrl = TextEditingController();
  final TextEditingController _grnNoGrnDateCtrl = TextEditingController();
  final TextEditingController _invNoInvDateCtrl = TextEditingController();
  final TextEditingController _vendorCtrl = TextEditingController();
  final TextEditingController _vendorRatingCtrl = TextEditingController();
  final TextEditingController _depreciationCtrl = TextEditingController();
  final TextEditingController _assetLocationCtrl = TextEditingController();

  @override
  void initState() {
    setState(() {
      _itemCtrl.text =
          '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].code!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].itemName!}';
      _typeCategoryCtrl.text =
          '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].typeAndCategoryName!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].itemName!}';
      _merkModelTypeCtrl.text =
          '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].merkName!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].modelName!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].typeName!}';
      _colourCtrl.text =
          widget.argumentsAssetGrow.assetGrowResponseModel.data![0].colourName!;
      _manufactureYearCtrl.text = widget.argumentsAssetGrow
          .assetGrowResponseModel.data![0].manufacturingYear!;
      _chasisCtrl.text =
          widget.argumentsAssetGrow.assetGrowResponseModel.data![0].chassisNo!;
      _engineCtrl.text =
          widget.argumentsAssetGrow.assetGrowResponseModel.data![0].engineNo!;
      _cynlinderCtrl.text = widget
          .argumentsAssetGrow.assetGrowResponseModel.data![0].cylinderCapacity!;
      _fuelTypeCtrl.text = widget
          .argumentsAssetGrow.assetGrowResponseModel.data![0].fuelTypeCode!;
      _passangerCapacityCtrl.text = widget.argumentsAssetGrow
          .assetGrowResponseModel.data![0].passengerCapacity!;
      _licensePlateCtrl.text =
          widget.argumentsAssetGrow.assetGrowResponseModel.data![0].platNo!;
      _bpkbNoCtrl.text =
          widget.argumentsAssetGrow.assetGrowResponseModel.data![0].bpkbNo!;
      _stnkNoCtrl.text =
          widget.argumentsAssetGrow.assetGrowResponseModel.data![0].stnkNo!;
      _stnkTaxDateCtrl.text = widget
          .argumentsAssetGrow.assetGrowResponseModel.data![0].stnkTaxDate!;
      _stnkExpDateCtrl.text = widget
          .argumentsAssetGrow.assetGrowResponseModel.data![0].stnkExpiredDate!;
      _insuredCtrl.text =
          '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].isInsured!} - year';
      _coverageTypeCtrl.text = widget
          .argumentsAssetGrow.assetGrowResponseModel.data![0].coverageType!;
      _factoryWarrantyCtrl.text = widget.argumentsAssetGrow
          .assetGrowResponseModel.data![0].factoryWarrantyPeriodTypeName!;
      _vendorWarrantyCtrl.text = widget
          .argumentsAssetGrow.assetGrowResponseModel.data![0].isVendorWarranty!;
      _maintenanceRoutineCtrl.text =
          '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].stnkExpiredDate!} - ';
      _purchaseDateCtrl.text = widget
          .argumentsAssetGrow.assetGrowResponseModel.data![0].purchaseDate!;
      _purchasAssetCondition.text =
          widget.argumentsAssetGrow.assetGrowResponseModel.data![0].condition!;
      _poNoPoDateCtrl.text =
          '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].purchaseOrderNo!} | ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].purchaseDate!}';
      _grnNoGrnDateCtrl.text =
          '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].grnNo!} | ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].grnDate!}';
      _invNoInvDateCtrl.text =
          '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].invoiceNo!} | ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].invoiceDate!}';
      _vendorCtrl.text =
          widget.argumentsAssetGrow.assetGrowResponseModel.data![0].vendorName!;
      _vendorRatingCtrl.text = widget
          .argumentsAssetGrow.assetGrowResponseModel.data![0].averageRating!
          .toString();
      _depreciationCtrl.text = widget.argumentsAssetGrow.assetGrowResponseModel
          .data![0].depreCategoryCommName!;
      _assetLocationCtrl.text = widget
          .argumentsAssetGrow.assetGrowResponseModel.data![0].locationName!;
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
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Item',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _itemCtrl,
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
              const SizedBox(
                height: 16,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'FA Type & Category',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _typeCategoryCtrl,
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
              const SizedBox(
                height: 16,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Merk - Model - Type',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _merkModelTypeCtrl,
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
              const SizedBox(
                height: 16,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Colour',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _colourCtrl,
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
              const SizedBox(
                height: 16,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Manufacturing Year',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _manufactureYearCtrl,
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
              const SizedBox(
                height: 16,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Chasis No.',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _chasisCtrl,
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
              const SizedBox(
                height: 16,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Engine No.',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _engineCtrl,
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
              const SizedBox(
                height: 16,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Cylinder Capacity',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _cynlinderCtrl,
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
              const SizedBox(
                height: 16,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Fuel Type',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _fuelTypeCtrl,
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
              const SizedBox(
                height: 16,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Passenger Capacity',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _passangerCapacityCtrl,
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
              const SizedBox(
                height: 16,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'License Plate',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _licensePlateCtrl,
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
              const SizedBox(
                height: 16,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'BPKB No. / SPPBPKB',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _bpkbNoCtrl,
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
              const SizedBox(
                height: 16,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'STNK No.',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _stnkNoCtrl,
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
              const SizedBox(
                height: 16,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'STNK Tax Date',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _stnkTaxDateCtrl,
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
              const SizedBox(
                height: 16,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'STNK Exp. Date',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _stnkExpDateCtrl,
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
              const SizedBox(
                height: 16,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Insured',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _insuredCtrl,
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
              const SizedBox(
                height: 16,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Coverage Type',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _coverageTypeCtrl,
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
              const SizedBox(
                height: 16,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Factory Warranty',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _factoryWarrantyCtrl,
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
              const SizedBox(
                height: 16,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Vendor Warranty',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _vendorWarrantyCtrl,
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
              const SizedBox(
                height: 16,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Maintenance Routine',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _maintenanceRoutineCtrl,
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
              const SizedBox(
                height: 16,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Purchasing Date',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _purchaseDateCtrl,
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
              const SizedBox(
                height: 16,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Purchase Asset Condition',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _purchasAssetCondition,
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
              const SizedBox(
                height: 16,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'PO No. & PO Date',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _poNoPoDateCtrl,
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
              const SizedBox(
                height: 16,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'GRN No. & GRN Date',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _grnNoGrnDateCtrl,
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
              const SizedBox(
                height: 16,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Invoice No. & Invoice Date',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _invNoInvDateCtrl,
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
              const SizedBox(
                height: 16,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Vendor',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _vendorCtrl,
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
              const SizedBox(
                height: 16,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Vendor Rating',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _vendorRatingCtrl,
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
              const SizedBox(
                height: 16,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Depreciation',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _depreciationCtrl,
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
              const SizedBox(
                height: 16,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Asset Location',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Stack(
                children: [
                  TextFormField(
                    controller: _assetLocationCtrl,
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
