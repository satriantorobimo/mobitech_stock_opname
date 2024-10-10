import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_stock_opname/features/asset_opname_detail/bloc/reserved/bloc.dart';
import 'package:mobile_stock_opname/features/asset_opname_detail/content_data_widget.dart';
import 'package:mobile_stock_opname/features/asset_opname_detail/data/arguments_asset_grow.dart';
import 'package:mobile_stock_opname/features/asset_opname_detail/data/data_content.dart';
import 'package:mobile_stock_opname/features/asset_opname_detail/domain/repo/asset_grow_repo.dart';
import 'package:mobile_stock_opname/utility/general_util.dart';
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
  ReservedBloc reservedBloc = ReservedBloc(assetGrowRepo: AssetGrowRepo());
  String isReserved = 'No';
  bool isLoading = false;
  double rating = 0.0;

  @override
  void initState() {
    setState(() {
      isReserved =
          widget.argumentsAssetGrow.assetGrowResponseModel.data![0].isReserved!;
      rating = widget
          .argumentsAssetGrow.assetGrowResponseModel.data![0].averageRating!;
      if (widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
              .assetTypeCode ==
          'VHCL') {
        setState(() {
          dataContent.add(DataContent(
              'Item',
              '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].code!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].itemName!}',
              false,
              false,
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .propertyFacility!));
          dataContent.add(DataContent(
              'FA Type & Category',
              '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].typeAndCategoryName!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].categoryName!}',
              false,
              false,
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .propertyFacility!));
          dataContent.add(DataContent(
              'Merk - Model - Type',
              '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].merkName!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].modelName!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].typeName!}',
              false,
              false,
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .propertyFacility!));
          dataContent.add(DataContent(
              'Colour',
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .colourName!,
              false,
              false,
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .propertyFacility!));
          dataContent.add(DataContent(
              'Manufacturing Year',
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .manufacturingYear!,
              false,
              false,
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .propertyFacility!));
          dataContent.add(DataContent(
              'Chasis No.',
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .chassisNo!,
              false,
              false,
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .propertyFacility!));
          dataContent.add(DataContent(
              'Engine No.',
              widget
                  .argumentsAssetGrow.assetGrowResponseModel.data![0].engineNo!,
              false,
              false,
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .propertyFacility!));
          dataContent.add(DataContent(
              'Cylinder Capacity',
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .cylinderCapacity!,
              false,
              false,
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .propertyFacility!));
          dataContent.add(DataContent(
              'Fuel Type',
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .fuelTypeName!,
              false,
              false,
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .propertyFacility!));
          dataContent.add(DataContent(
              'Passenger Capacity',
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .passengerCapacity!,
              false,
              false,
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .propertyFacility!));
          dataContent.add(DataContent(
              'License Plate',
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0].platNo!,
              false,
              false,
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .propertyFacility!));
          dataContent.add(DataContent(
              'BPKB No. / SPPBPKB',
              '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].bpkbNo!} / ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].spbpkbNo!}',
              false,
              false,
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .propertyFacility!));
          dataContent.add(DataContent(
              'STNK No.',
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0].stnkNo!,
              false,
              false,
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .propertyFacility!));
          dataContent.add(DataContent(
              'STNK Tax Date',
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .stnkTaxDate!,
              false,
              false,
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .propertyFacility!));
          dataContent.add(DataContent(
              'STNK Exp. Date',
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .stnkExpiredDate!,
              false,
              false,
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .propertyFacility!));
          dataContent.add(DataContent(
              'Insured',
              '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].isInsured!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].numberOfCoverage!} year',
              false,
              false,
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .propertyFacility!));
          dataContent.add(DataContent(
              'Coverage Type',
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .coverageType!,
              false,
              false,
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .propertyFacility!));
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
              false,
              false,
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .propertyFacility!));
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
              false,
              false,
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .propertyFacility!));
          dataContent.add(DataContent(
              'Maintenance Routine',
              '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].maintenanceStartDate!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].maintenanceEndDate!}',
              false,
              false,
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .propertyFacility!));
          dataContent.add(DataContent(
              'Purchasing Date',
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .purchaseDate!,
              false,
              false,
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .propertyFacility!));
          dataContent.add(DataContent(
              'Purchase Asset Condition',
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .condition!,
              false,
              false,
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .propertyFacility!));
          dataContent.add(DataContent(
              'PO No. & PO Date',
              '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].purchaseOrderNo!} | ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].purchaseDate!}',
              false,
              false,
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .propertyFacility!));
          dataContent.add(DataContent(
              'GRN No. & GRN Date',
              '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].grnNo!} | ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].grnDate!}',
              false,
              false,
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .propertyFacility!));
          dataContent.add(DataContent(
              'Invoice No. & Invoice Date',
              '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].invoiceNo!} | ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].invoiceDate!}',
              false,
              false,
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .propertyFacility!));
          dataContent.add(DataContent(
              'Vendor',
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .vendorName!,
              false,
              false,
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .propertyFacility!));
          dataContent.add(DataContent(
              'Vendor Rating',
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .averageRating!
                  .toString(),
              false,
              false,
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .propertyFacility!));
          dataContent.add(DataContent(
              'Depreciation',
              '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].isDepre!} -  ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].methodTypeComm!}',
              false,
              false,
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .propertyFacility!));
          dataContent.add(DataContent(
              'Asset Location',
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .locationName!,
              true,
              false,
              widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                  .propertyFacility!));
        });
      } else if (widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
              .assetTypeCode ==
          'LAND') {
        dataContent.add(DataContent(
            'Item',
            '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].code!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].itemName!}',
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .propertyFacility ??
                []));
        dataContent.add(DataContent(
            'FA Type & Category',
            '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].typeAndCategoryName!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].itemName!}',
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .propertyFacility ??
                []));
        dataContent.add(DataContent(
            'Certificate No.',
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                .certificateNo!,
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .propertyFacility ??
                []));
        dataContent.add(DataContent(
            'Land Type',
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                .landTypeName!,
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .propertyFacility ??
                []));
        dataContent.add(DataContent(
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                        .certificateTypeCode ==
                    'SGS.2409.00017'
                ? 'Exp. Date'
                : 'Certificate Issue Date | Exp. Date',
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                        .certificateTypeCode ==
                    'SGS.2409.00017'
                ? widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .certificateExpiredDate!
                : '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].issuanceDate!} | ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].certificateExpiredDate!}',
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .propertyFacility ??
                []));
        dataContent.add(DataContent(
            'Length (m) | Width (m)',
            '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].landL!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].landW!}',
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .propertyFacility ??
                []));
        dataContent.add(DataContent(
            'Owner',
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0].owner!,
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .propertyFacility ??
                []));
        dataContent.add(DataContent(
            'Land Address',
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0].address!,
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .propertyFacility ??
                []));
        dataContent.add(DataContent(
            'Insured',
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                        .isInsured! ==
                    'No'
                ? widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .isInsured!
                : '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].isInsured!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].numberOfCoverage ?? '0'} year',
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .propertyFacility ??
                []));
        dataContent.add(DataContent(
            'Coverage Type',
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                .coverageType!,
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .propertyFacility ??
                []));
        dataContent.add(DataContent(
            'Maintenance Routine',
            '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].maintenanceStartDate!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].maintenanceEndDate!}',
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .propertyFacility ??
                []));

        dataContent.add(DataContent(
            'Purchasing Date',
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                .purchaseDate!,
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .propertyFacility ??
                []));
        dataContent.add(DataContent(
            'Purchase Asset Condition',
            widget
                .argumentsAssetGrow.assetGrowResponseModel.data![0].condition!,
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .propertyFacility ??
                []));
        dataContent.add(DataContent(
            'PO No. & PO Date',
            '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].purchaseOrderNo!} | ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].purchaseDate!}',
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .propertyFacility ??
                []));
        dataContent.add(DataContent(
            'GRN No. & GRN Date',
            '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].grnNo!} | ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].grnDate!}',
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .propertyFacility ??
                []));
        dataContent.add(DataContent(
            'Invoice No. & Invoice Date',
            '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].invoiceNo!} | ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].invoiceDate!}',
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .propertyFacility ??
                []));
        dataContent.add(DataContent(
            'Vendor',
            widget
                .argumentsAssetGrow.assetGrowResponseModel.data![0].vendorName!,
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .propertyFacility ??
                []));
        dataContent.add(DataContent(
            'Vendor Rating',
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                .averageRating!
                .toString(),
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .propertyFacility ??
                []));
        dataContent.add(DataContent(
            'Depreciation',
            '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].isDepre!} -  ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].methodTypeComm!}',
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .propertyFacility ??
                []));
        dataContent.add(DataContent(
            'Asset Location',
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                .locationName!,
            true,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .propertyFacility ??
                []));
      } else if (widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
              .assetTypeCode ==
          'BLDG') {
        dataContent.add(DataContent(
            'Item',
            '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].code!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].itemName!}',
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                .propertyFacility!));
        dataContent.add(DataContent(
            'FA Type & Category',
            '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].typeAndCategoryName!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].itemName!}',
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                .propertyFacility!));
        dataContent.add(DataContent(
            'Certificate No.',
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                .certificateNo!,
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                .propertyFacility!));

        dataContent.add(DataContent(
            'Certificate Issue Date',
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                .issuanceDate!,
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                .propertyFacility!));
        dataContent.add(DataContent(
            'IMB No.',
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0].imbNo!,
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                .propertyFacility!));
        dataContent.add(DataContent(
            'NIB No.',
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0].nibNo!,
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                .propertyFacility!));
        dataContent.add(DataContent(
            'Building Area (m2) | Wide Site (m)',
            '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].buildingSizeLt!} | ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].buildingSizeLb!}',
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                .propertyFacility!));
        dataContent.add(DataContent(
            'Building Type | Numer of Floor',
            '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].buildingTypeName!} | ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].numberOfFloor!}',
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                .propertyFacility!));
        dataContent.add(DataContent(
            'Owner',
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0].owner!,
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                .propertyFacility!));
        dataContent.add(DataContent(
            'Building Address',
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0].address!,
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                .propertyFacility!));
        dataContent.add(DataContent(
            'Building Year | Acquisition Year',
            '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].builtYear!} | ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].acquisitionYear!}',
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                .propertyFacility!));
        dataContent.add(DataContent(
            'Property Facility Info',
            '-',
            false,
            true,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                .propertyFacility!));
        dataContent.add(DataContent(
            'Insured',
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                        .isInsured! ==
                    'No'
                ? widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .isInsured!
                : '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].isInsured!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].numberOfCoverage ?? '0'} year',
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                .propertyFacility!));
        dataContent.add(DataContent(
            'Coverage Type',
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .coverageType ??
                '-',
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                .propertyFacility!));
        dataContent.add(DataContent(
            'Maintenance Routine',
            '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].maintenanceStartDate!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].maintenanceEndDate!}',
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                .propertyFacility!));

        dataContent.add(DataContent(
            'Purchasing Date',
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                .purchaseDate!,
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                .propertyFacility!));
        dataContent.add(DataContent(
            'Purchase Asset Condition',
            widget
                .argumentsAssetGrow.assetGrowResponseModel.data![0].condition!,
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                .propertyFacility!));
        dataContent.add(DataContent(
            'PO No. & PO Date',
            '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].purchaseOrderNo!} | ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].purchaseDate!}',
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                .propertyFacility!));
        dataContent.add(DataContent(
            'GRN No. & GRN Date',
            '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].grnNo!} | ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].grnDate!}',
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                .propertyFacility!));
        dataContent.add(DataContent(
            'Invoice No. & Invoice Date',
            '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].invoiceNo!} | ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].invoiceDate!}',
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                .propertyFacility!));
        dataContent.add(DataContent(
            'Vendor',
            widget
                .argumentsAssetGrow.assetGrowResponseModel.data![0].vendorName!,
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                .propertyFacility!));
        dataContent.add(DataContent(
            'Vendor Rating',
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                .averageRating!
                .toString(),
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                .propertyFacility!));
        dataContent.add(DataContent(
            'Depreciation',
            '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].isDepre!} -  ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].methodTypeComm!}',
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                .propertyFacility!));
        dataContent.add(DataContent(
            'Asset Location',
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                .locationName!,
            true,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                .propertyFacility!));
      } else {
        dataContent.add(DataContent(
            'Item',
            '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].code!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].itemName!}',
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .propertyFacility ??
                []));
        dataContent.add(DataContent(
            'FA Type & Category',
            '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].typeAndCategoryName!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].itemName!}',
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .propertyFacility ??
                []));
        dataContent.add(DataContent(
            'Merk - Model - Type',
            '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].merkName!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].modelName!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].typeName!}',
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .propertyFacility ??
                []));
        dataContent.add(DataContent(
            'Colour',
            widget
                .argumentsAssetGrow.assetGrowResponseModel.data![0].colourName!,
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .propertyFacility ??
                []));
        dataContent.add(DataContent(
            'Serial No.',
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0].serialNo!,
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .propertyFacility ??
                []));
        dataContent.add(DataContent(
            'IMEI',
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0].imei!,
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .propertyFacility ??
                []));
        dataContent.add(DataContent(
            'Insured',
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                        .isInsured! ==
                    'No'
                ? widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .isInsured!
                : '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].isInsured!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].numberOfCoverage!} year',
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .propertyFacility ??
                []));
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
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .propertyFacility ??
                []));
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
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .propertyFacility ??
                []));
        dataContent.add(DataContent(
            'Maintenance Routine',
            '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].maintenanceStartDate!} - ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].maintenanceEndDate!}',
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .propertyFacility ??
                []));
        dataContent.add(DataContent(
            'Purchasing Date',
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                .purchaseDate!,
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .propertyFacility ??
                []));
        dataContent.add(DataContent(
            'Purchase Asset Condition',
            widget
                .argumentsAssetGrow.assetGrowResponseModel.data![0].condition!,
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .propertyFacility ??
                []));
        dataContent.add(DataContent(
            'PO No. & PO Date',
            '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].purchaseOrderNo!} | ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].purchaseDate!}',
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .propertyFacility ??
                []));
        dataContent.add(DataContent(
            'GRN No. & GRN Date',
            '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].grnNo!} | ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].grnDate!}',
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .propertyFacility ??
                []));
        dataContent.add(DataContent(
            'Invoice No. & Invoice Date',
            '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].invoiceNo!} | ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].invoiceDate!}',
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .propertyFacility ??
                []));
        dataContent.add(DataContent(
            'Vendor',
            widget
                .argumentsAssetGrow.assetGrowResponseModel.data![0].vendorName!,
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .propertyFacility ??
                []));
        dataContent.add(DataContent(
            'Vendor Rating',
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                .averageRating!
                .toString(),
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .propertyFacility ??
                []));
        dataContent.add(DataContent(
            'Depreciation',
            '${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].isDepre!} -  ${widget.argumentsAssetGrow.assetGrowResponseModel.data![0].methodTypeComm!}',
            false,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .propertyFacility ??
                []));
        dataContent.add(DataContent(
            'Asset Location',
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                .locationName!,
            true,
            false,
            widget.argumentsAssetGrow.assetGrowResponseModel.data![0]
                    .propertyFacility ??
                []));
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
                                    horizontal: 24, vertical: 8),
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
                            const SizedBox(height: 8),
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
                                const Text(
                                  'PIC :',
                                  style: TextStyle(
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
                                const Text(
                                  'User :',
                                  style: TextStyle(
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
                      : dataContent[index].isLocation == false &&
                              dataContent[index].isPropertyFacility == false
                          ? ContentDataWidget(
                              title: dataContent[index].title,
                              content: dataContent[index].value,
                              rating: rating,
                            )
                          : dataContent[index].isPropertyFacility == true &&
                                  dataContent[index].isLocation == false
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      dataContent[index].title,
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    ListView.separated(
                                        shrinkWrap: true,
                                        itemBuilder: ((context, indexes) {
                                          return Text(
                                            '${dataContent[index].propertyFacility[indexes].no!}. ${dataContent[index].propertyFacility[indexes].propertyFacilityName!}',
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: Color(0xFFbfbfbf)),
                                          );
                                        }),
                                        separatorBuilder: ((context, index) {
                                          return const SizedBox(height: 4);
                                        }),
                                        itemCount: dataContent[index]
                                            .propertyFacility
                                            .length),
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
                                    )
                                  ],
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          padding:
                                              const EdgeInsets.only(bottom: 8),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BlocListener(
                          bloc: reservedBloc,
                          listener: (_, ReservedState state) {
                            if (state is ReservedLoading) {
                              setState(() {
                                isLoading = true;
                              });
                            }
                            if (state is ReservedLoaded) {
                              setState(() {
                                isLoading = false;
                                isReserved = 'Yes';
                              });
                              GeneralUtil().showSnackBarSuccess(
                                  context, 'Reserved Successfully!');
                            }
                            if (state is ReservedError) {
                              GeneralUtil()
                                  .showSnackBarError(context, state.error!);
                              setState(() {
                                isLoading = false;
                              });
                            }
                            if (state is ReservedException) {
                              GeneralUtil()
                                  .showSnackBarError(context, state.error);
                              setState(() {
                                isLoading = false;
                              });
                            }
                          },
                          child: BlocBuilder(
                              bloc: reservedBloc,
                              builder: (_, ReservedState state) {
                                return isLoading
                                    ? const Center(
                                        child: SizedBox(
                                          width: 66,
                                          height: 66,
                                          child: CircularProgressIndicator(),
                                        ),
                                      )
                                    : InkWell(
                                        onTap: isReserved == 'Yes'
                                            ? null
                                            : () {
                                                reservedBloc.add(ReservedAttempt(
                                                    assetCode: widget
                                                        .argumentsAssetGrow
                                                        .assetGrowResponseModel
                                                        .data![0]
                                                        .code!));
                                              },
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.35,
                                          height: 66,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                colors: isReserved == 'Yes'
                                                    ? [Colors.grey, Colors.grey]
                                                    : [
                                                        const Color(0xFF5DE0E6),
                                                        const Color(0xFF004AAD)
                                                      ],
                                                begin: const FractionalOffset(
                                                    0.0, 0.0),
                                                end: const FractionalOffset(
                                                    1.0, 0.0),
                                                stops: const [0.0, 1.0],
                                                tileMode: TileMode.clamp),
                                            borderRadius:
                                                BorderRadius.circular(28),
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Text('RESERVED',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                            ],
                                          ),
                                        ),
                                      );
                              })),
                      const SizedBox(width: 16),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context,
                              StringRouterUtil
                                  .assetOpnameDetailFormScreenRoute);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          height: 66,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text('OPNAME',
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
                    ],
                  ))
            ],
          ),
        ),
      ]),
    );
  }
}
