class AssetGrowResponseModel {
  int? result;
  String? message;
  List<Data>? data;
  String? code;
  int? id;

  AssetGrowResponseModel(
      {this.result, this.message, this.data, this.code, this.id});

  AssetGrowResponseModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    code = json['code'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['code'] = code;
    data['id'] = id;
    return data;
  }
}

class Data {
  String? code;
  String? reffModule;
  String? sourceCode;
  String? sourceName;
  String? description;
  String? barcode;
  String? condition;
  String? status;
  String? itemCode;
  String? itemName;
  String? assetTypeCode;
  String? assetTypeName;
  String? categoryCode;
  String? categoryName;
  String? merkCode;
  String? merkName;
  String? typeCode;
  String? typeName;
  String? modelCode;
  String? modelName;
  String? manufacturingYear;
  String? colourCode;
  String? colourName;
  String? chassisNo;
  String? engineNo;
  String? lastMiles;
  String? cylinderCapacity;
  String? fuelTypeName;
  String? fuelTypeCode;
  String? passengerCapacity;
  String? platNo;
  String? spbpkbNo;
  String? bpkbNo;
  String? bpkbName;
  String? stnkNo;
  String? stnkTaxDate;
  String? stnkExpiredDate;
  String? regionCode;
  String? regionName;
  String? areaCode;
  String? areaName;
  String? branchCode;
  String? branchName;
  String? locationCode;
  String? locationName;
  String? divisionCode;
  String? divisionName;
  String? departmentCode;
  String? departmentName;
  String? subDepartmentCode;
  String? subDepartmentName;
  String? unitCode;
  String? unitName;
  String? procurementRequestNo;
  String? procurementRequestDate;
  String? purchaseOrderNo;
  String? purchaseDate;
  double? purchasePrice;
  double? originalPrice;
  double? residualValue;
  String? grnNo;
  String? grnDate;
  String? invoiceNo;
  String? invoiceDate;
  String? taxTypeCode;
  String? taxTypeName;
  String? isWithPpn;
  double? ppnPct;
  double? ppnAmount;
  String? isPphCharged;
  double? pphPct;
  double? pphAmount;
  double? shippingFeeAmount;
  double? otherFeeAmount;
  String? picCode;
  String? picName;
  String? picNik;
  String? picPositionCode;
  String? picPositionName;
  String? picRegionCode;
  String? picRegionName;
  String? picAreaCode;
  String? picAreaName;
  String? picBranchCode;
  String? picBranchName;
  String? picLocationCode;
  String? picLocationName;
  String? picDivisionCode;
  String? picDivisionName;
  String? picDepartmentCode;
  String? picDepartmentName;
  String? picSubDepartmentCode;
  String? picSubDepartmentName;
  String? picUnitCode;
  String? picUnitName;
  String? userCode;
  String? userName;
  String? userNik;
  String? userPositionCode;
  String? userPositionName;
  String? useStartDate;
  String? userRegionCode;
  String? userRegionName;
  String? userAreaCode;
  String? userAreaName;
  String? userBranchCode;
  String? userBranchName;
  String? userLocationCode;
  String? userLocationName;
  String? userDivisionCode;
  String? userDivisionName;
  String? userDepartmentCode;
  String? userDepartmentName;
  String? userSubDepartmentCode;
  String? userSubDepartmentName;
  String? userUnitCode;
  String? userUnitName;
  String? requestorCode;
  String? requestorName;
  String? requestorNik;
  String? requestorPositionCode;
  String? requestorPositionName;
  String? requestorRegionCode;
  String? requestorRegionName;
  String? requestorAreaCode;
  String? requestorAreaName;
  String? requestorBranchCode;
  String? requestorBranchName;
  String? requestorLocationCode;
  String? requestorLocationName;
  String? requestorDivisionCode;
  String? requestorDivisionName;
  String? requestorDepartmentCode;
  String? requestorDepartmentName;
  String? requestorSubDepartmentCode;
  String? requestorSubDepartmentName;
  String? requestorUnitCode;
  String? requestorUnitName;
  String? vendorCode;
  String? vendorName;
  String? vendorBusinessTypeCode;
  String? vendorBusinessTypeName;
  String? vendorAddress;
  String? vendorZipCode;
  String? vendorPostalCode;
  String? vendorProvinceCode;
  String? vendorProvinceName;
  String? vendorCityCode;
  String? vendorCityName;
  String? vendorDistrict;
  String? vendorSubDistrict;
  String? vendorContactName;
  String? vendorContactPosition;
  String? vendorContactPhone;
  String? vendorEmail;
  String? vendorContractStartDate;
  String? vendorContractEndDate;
  String? vendorContractStartDateUi;
  String? vendorContractEndDateUi;
  String? isWarranty;
  String? isVendorWarranty;
  String? isFactoryWarranty;
  String? isMaintenance;
  String? isInsured;
  String? isReserved;
  String? isDepre;
  int? usefull;
  String? depreCategoryCommCode;
  String? depreCategoryCommName;
  double? totalDepreComm;
  String? deprePeriodComm;
  double? netBookValueComm;
  String? depreCategoryFiscalCode;
  String? depreCategoryFiscalName;
  double? totalDepreFiscal;
  String? deprePeriodFiscal;
  double? netBookValueFiscal;

  double? saleAmount;
  String? typeAndCategoryName;
  String? factoryWarrantyPeriodTypeCode;
  String? factoryWarrantyPeriodTypeName;
  String? factoryWarrantyFrequencyTypeCode;
  int? factoryWarrantyPeriod;
  String? factoryWarrantyStartDate;

  String? longitude;
  String? latitude;
  double? averageRating;
  int? totalRating;
  String? methodTypeComm;
  String? methodTypeFisc;
  String? assetCodeVisibilityCode;
  int? numberOfCoverage;
  String? coverageType;

  Data(
      {this.code,
      this.reffModule,
      this.sourceCode,
      this.sourceName,
      this.description,
      this.barcode,
      this.condition,
      this.status,
      this.itemCode,
      this.itemName,
      this.assetTypeCode,
      this.assetTypeName,
      this.categoryCode,
      this.categoryName,
      this.merkCode,
      this.merkName,
      this.typeCode,
      this.typeName,
      this.modelCode,
      this.modelName,
      this.manufacturingYear,
      this.colourCode,
      this.colourName,
      this.chassisNo,
      this.engineNo,
      this.lastMiles,
      this.cylinderCapacity,
      this.fuelTypeName,
      this.fuelTypeCode,
      this.passengerCapacity,
      this.platNo,
      this.spbpkbNo,
      this.bpkbNo,
      this.bpkbName,
      this.stnkNo,
      this.stnkTaxDate,
      this.stnkExpiredDate,
      this.regionCode,
      this.regionName,
      this.areaCode,
      this.areaName,
      this.branchCode,
      this.branchName,
      this.locationCode,
      this.locationName,
      this.divisionCode,
      this.divisionName,
      this.departmentCode,
      this.departmentName,
      this.subDepartmentCode,
      this.subDepartmentName,
      this.unitCode,
      this.unitName,
      this.procurementRequestNo,
      this.procurementRequestDate,
      this.purchaseOrderNo,
      this.purchaseDate,
      this.purchasePrice,
      this.originalPrice,
      this.residualValue,
      this.grnNo,
      this.grnDate,
      this.invoiceNo,
      this.invoiceDate,
      this.taxTypeCode,
      this.taxTypeName,
      this.isWithPpn,
      this.ppnPct,
      this.ppnAmount,
      this.isPphCharged,
      this.pphPct,
      this.pphAmount,
      this.shippingFeeAmount,
      this.otherFeeAmount,
      this.picCode,
      this.picName,
      this.picNik,
      this.picPositionCode,
      this.picPositionName,
      this.picRegionCode,
      this.picRegionName,
      this.picAreaCode,
      this.picAreaName,
      this.picBranchCode,
      this.picBranchName,
      this.picLocationCode,
      this.picLocationName,
      this.picDivisionCode,
      this.picDivisionName,
      this.picDepartmentCode,
      this.picDepartmentName,
      this.picSubDepartmentCode,
      this.picSubDepartmentName,
      this.picUnitCode,
      this.picUnitName,
      this.userCode,
      this.userName,
      this.userNik,
      this.userPositionCode,
      this.userPositionName,
      this.useStartDate,
      this.userRegionCode,
      this.userRegionName,
      this.userAreaCode,
      this.userAreaName,
      this.userBranchCode,
      this.userBranchName,
      this.userLocationCode,
      this.userLocationName,
      this.userDivisionCode,
      this.userDivisionName,
      this.userDepartmentCode,
      this.userDepartmentName,
      this.userSubDepartmentCode,
      this.userSubDepartmentName,
      this.userUnitCode,
      this.userUnitName,
      this.requestorCode,
      this.requestorName,
      this.requestorNik,
      this.requestorPositionCode,
      this.requestorPositionName,
      this.requestorRegionCode,
      this.requestorRegionName,
      this.requestorAreaCode,
      this.requestorAreaName,
      this.requestorBranchCode,
      this.requestorBranchName,
      this.requestorLocationCode,
      this.requestorLocationName,
      this.requestorDivisionCode,
      this.requestorDivisionName,
      this.requestorDepartmentCode,
      this.requestorDepartmentName,
      this.requestorSubDepartmentCode,
      this.requestorSubDepartmentName,
      this.requestorUnitCode,
      this.requestorUnitName,
      this.vendorCode,
      this.vendorName,
      this.vendorBusinessTypeCode,
      this.vendorBusinessTypeName,
      this.vendorAddress,
      this.vendorZipCode,
      this.vendorPostalCode,
      this.vendorProvinceCode,
      this.vendorProvinceName,
      this.vendorCityCode,
      this.vendorCityName,
      this.vendorDistrict,
      this.vendorSubDistrict,
      this.vendorContactName,
      this.vendorContactPosition,
      this.vendorContactPhone,
      this.vendorEmail,
      this.vendorContractStartDate,
      this.vendorContractEndDate,
      this.vendorContractStartDateUi,
      this.vendorContractEndDateUi,
      this.isWarranty,
      this.isVendorWarranty,
      this.isFactoryWarranty,
      this.isMaintenance,
      this.isInsured,
      this.isReserved,
      this.isDepre,
      this.usefull,
      this.depreCategoryCommCode,
      this.depreCategoryCommName,
      this.totalDepreComm,
      this.deprePeriodComm,
      this.netBookValueComm,
      this.depreCategoryFiscalCode,
      this.depreCategoryFiscalName,
      this.totalDepreFiscal,
      this.deprePeriodFiscal,
      this.netBookValueFiscal,
      this.saleAmount,
      this.typeAndCategoryName,
      this.factoryWarrantyPeriodTypeCode,
      this.factoryWarrantyPeriodTypeName,
      this.factoryWarrantyFrequencyTypeCode,
      this.factoryWarrantyPeriod,
      this.factoryWarrantyStartDate,
      this.longitude,
      this.latitude,
      this.averageRating,
      this.totalRating,
      this.methodTypeComm,
      this.methodTypeFisc,
      this.assetCodeVisibilityCode,
      this.numberOfCoverage,
      this.coverageType});

  Data.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    reffModule = json['reff_module'];
    sourceCode = json['source_code'];
    sourceName = json['source_name'];
    description = json['description'];
    barcode = json['barcode'];
    condition = json['condition'];
    status = json['status'];
    itemCode = json['item_code'];
    itemName = json['item_name'];
    assetTypeCode = json['asset_type_code'];
    assetTypeName = json['asset_type_name'];
    categoryCode = json['category_code'];
    categoryName = json['category_name'];
    merkCode = json['merk_code'];
    merkName = json['merk_name'];
    typeCode = json['type_code'];
    typeName = json['type_name'];
    modelCode = json['model_code'];
    modelName = json['model_name'];
    manufacturingYear = json['manufacturing_year'];
    colourCode = json['colour_code'];
    colourName = json['colour_name'];
    chassisNo = json['chassis_no'];
    engineNo = json['engine_no'];
    lastMiles = json['last_miles'];
    cylinderCapacity = json['cylinder_capacity'];
    fuelTypeName = json['fuel_type_name'];
    fuelTypeCode = json['fuel_type_code'];
    passengerCapacity = json['passenger_capacity'];
    platNo = json['plat_no'];
    spbpkbNo = json['spbpkb_no'];
    bpkbNo = json['bpkb_no'];
    bpkbName = json['bpkb_name'];
    stnkNo = json['stnk_no'];
    stnkTaxDate = json['stnk_tax_date'];
    stnkExpiredDate = json['stnk_expired_date'];
    regionCode = json['region_code'];
    regionName = json['region_name'];
    areaCode = json['area_code'];
    areaName = json['area_name'];
    branchCode = json['branch_code'];
    branchName = json['branch_name'];
    locationCode = json['location_code'];
    locationName = json['location_name'];
    divisionCode = json['division_code'];
    divisionName = json['division_name'];
    departmentCode = json['department_code'];
    departmentName = json['department_name'];
    subDepartmentCode = json['sub_department_code'];
    subDepartmentName = json['sub_department_name'];
    unitCode = json['unit_code'];
    unitName = json['unit_name'];
    procurementRequestNo = json['procurement_request_no'];
    procurementRequestDate = json['procurement_request_date'];
    purchaseOrderNo = json['purchase_order_no'];
    purchaseDate = json['purchase_date'];
    purchasePrice = json['purchase_price'];
    originalPrice = json['original_price'];
    residualValue = json['residual_value'];
    grnNo = json['grn_no'];
    grnDate = json['grn_date'];
    invoiceNo = json['invoice_no'];
    invoiceDate = json['invoice_date'];
    taxTypeCode = json['tax_type_code'];
    taxTypeName = json['tax_type_name'];
    isWithPpn = json['is_with_ppn'];
    ppnPct = json['ppn_pct'];
    ppnAmount = json['ppn_amount'];
    isPphCharged = json['is_pph_charged'];
    pphPct = json['pph_pct'];
    pphAmount = json['pph_amount'];
    shippingFeeAmount = json['shipping_fee_amount'];
    otherFeeAmount = json['other_fee_amount'];
    picCode = json['pic_code'];
    picName = json['pic_name'];
    picNik = json['pic_nik'];
    picPositionCode = json['pic_position_code'];
    picPositionName = json['pic_position_name'];
    picRegionCode = json['pic_region_code'];
    picRegionName = json['pic_region_name'];
    picAreaCode = json['pic_area_code'];
    picAreaName = json['pic_area_name'];
    picBranchCode = json['pic_branch_code'];
    picBranchName = json['pic_branch_name'];
    picLocationCode = json['pic_location_code'];
    picLocationName = json['pic_location_name'];
    picDivisionCode = json['pic_division_code'];
    picDivisionName = json['pic_division_name'];
    picDepartmentCode = json['pic_department_code'];
    picDepartmentName = json['pic_department_name'];
    picSubDepartmentCode = json['pic_sub_department_code'];
    picSubDepartmentName = json['pic_sub_department_name'];
    picUnitCode = json['pic_unit_code'];
    picUnitName = json['pic_unit_name'];
    userCode = json['user_code'];
    userName = json['user_name'];
    userNik = json['user_nik'];
    userPositionCode = json['user_position_code'];
    userPositionName = json['user_position_name'];
    useStartDate = json['use_start_date'];
    userRegionCode = json['user_region_code'];
    userRegionName = json['user_region_name'];
    userAreaCode = json['user_area_code'];
    userAreaName = json['user_area_name'];
    userBranchCode = json['user_branch_code'];
    userBranchName = json['user_branch_name'];
    userLocationCode = json['user_location_code'];
    userLocationName = json['user_location_name'];
    userDivisionCode = json['user_division_code'];
    userDivisionName = json['user_division_name'];
    userDepartmentCode = json['user_department_code'];
    userDepartmentName = json['user_department_name'];
    userSubDepartmentCode = json['user_sub_department_code'];
    userSubDepartmentName = json['user_sub_department_name'];
    userUnitCode = json['user_unit_code'];
    userUnitName = json['user_unit_name'];
    requestorCode = json['requestor_code'];
    requestorName = json['requestor_name'];
    requestorNik = json['requestor_nik'];
    requestorPositionCode = json['requestor_position_code'];
    requestorPositionName = json['requestor_position_name'];
    requestorRegionCode = json['requestor_region_code'];
    requestorRegionName = json['requestor_region_name'];
    requestorAreaCode = json['requestor_area_code'];
    requestorAreaName = json['requestor_area_name'];
    requestorBranchCode = json['requestor_branch_code'];
    requestorBranchName = json['requestor_branch_name'];
    requestorLocationCode = json['requestor_location_code'];
    requestorLocationName = json['requestor_location_name'];
    requestorDivisionCode = json['requestor_division_code'];
    requestorDivisionName = json['requestor_division_name'];
    requestorDepartmentCode = json['requestor_department_code'];
    requestorDepartmentName = json['requestor_department_name'];
    requestorSubDepartmentCode = json['requestor_sub_department_code'];
    requestorSubDepartmentName = json['requestor_sub_department_name'];
    requestorUnitCode = json['requestor_unit_code'];
    requestorUnitName = json['requestor_unit_name'];
    vendorCode = json['vendor_code'];
    vendorName = json['vendor_name'];
    vendorBusinessTypeCode = json['vendor_business_type_code'];
    vendorBusinessTypeName = json['vendor_business_type_name'];
    vendorAddress = json['vendor_address'];
    vendorZipCode = json['vendor_zip_code'];
    vendorPostalCode = json['vendor_postal_code'];
    vendorProvinceCode = json['vendor_province_code'];
    vendorProvinceName = json['vendor_province_name'];
    vendorCityCode = json['vendor_city_code'];
    vendorCityName = json['vendor_city_name'];
    vendorDistrict = json['vendor_district'];
    vendorSubDistrict = json['vendor_sub_district'];
    vendorContactName = json['vendor_contact_name'];
    vendorContactPosition = json['vendor_contact_position'];
    vendorContactPhone = json['vendor_contact_phone'];
    vendorEmail = json['vendor_email'];
    vendorContractStartDate = json['vendor_contract_start_date'];
    vendorContractEndDate = json['vendor_contract_end_date'];
    vendorContractStartDateUi = json['vendor_contract_start_date_ui'];
    vendorContractEndDateUi = json['vendor_contract_end_date_ui'];
    isWarranty = json['is_warranty'];
    isVendorWarranty = json['is_vendor_warranty'];
    isFactoryWarranty = json['is_factory_warranty'];
    isMaintenance = json['is_maintenance'];
    isInsured = json['is_insured'];
    isReserved = json['is_reserved'];
    isDepre = json['is_depre'];
    usefull = json['usefull'];
    depreCategoryCommCode = json['depre_category_comm_code'];
    depreCategoryCommName = json['depre_category_comm_name'];
    totalDepreComm = json['total_depre_comm'];
    deprePeriodComm = json['depre_period_comm'];
    netBookValueComm = json['net_book_value_comm'];
    depreCategoryFiscalCode = json['depre_category_fiscal_code'];
    depreCategoryFiscalName = json['depre_category_fiscal_name'];
    totalDepreFiscal = json['total_depre_fiscal'];
    deprePeriodFiscal = json['depre_period_fiscal'];
    netBookValueFiscal = json['net_book_value_fiscal'];

    saleAmount = json['sale_amount'];

    typeAndCategoryName = json['type_and_category_name'];

    factoryWarrantyPeriodTypeCode = json['factory_warranty_period_type_code'];
    factoryWarrantyPeriodTypeName = json['factory_warranty_period_type_name'];
    factoryWarrantyFrequencyTypeCode =
        json['factory_warranty_frequency_type_code'];
    factoryWarrantyPeriod = json['factory_warranty_period'];
    factoryWarrantyStartDate = json['factory_warranty_start_date'];

    longitude = json['longitude'];
    latitude = json['latitude'];
    averageRating = json['average_rating'];
    totalRating = json['total_rating'];
    methodTypeComm = json['method_type_comm'];
    methodTypeFisc = json['method_type_fisc'];
    assetCodeVisibilityCode = json['asset_code_visibility_code'];
    numberOfCoverage = json['number_of_coverage'];
    coverageType = json['coverage_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['reff_module'] = reffModule;
    data['source_code'] = sourceCode;
    data['source_name'] = sourceName;
    data['description'] = description;
    data['barcode'] = barcode;
    data['condition'] = condition;
    data['status'] = status;
    data['item_code'] = itemCode;
    data['item_name'] = itemName;
    data['asset_type_code'] = assetTypeCode;
    data['asset_type_name'] = assetTypeName;
    data['category_code'] = categoryCode;
    data['category_name'] = categoryName;
    data['merk_code'] = merkCode;
    data['merk_name'] = merkName;
    data['type_code'] = typeCode;
    data['type_name'] = typeName;
    data['model_code'] = modelCode;
    data['model_name'] = modelName;
    data['manufacturing_year'] = manufacturingYear;
    data['colour_code'] = colourCode;
    data['colour_name'] = colourName;
    data['chassis_no'] = chassisNo;
    data['engine_no'] = engineNo;
    data['last_miles'] = lastMiles;
    data['cylinder_capacity'] = cylinderCapacity;
    data['fuel_type_name'] = fuelTypeName;
    data['fuel_type_code'] = fuelTypeCode;
    data['passenger_capacity'] = passengerCapacity;
    data['plat_no'] = platNo;
    data['spbpkb_no'] = spbpkbNo;
    data['bpkb_no'] = bpkbNo;
    data['bpkb_name'] = bpkbName;
    data['stnk_no'] = stnkNo;
    data['stnk_tax_date'] = stnkTaxDate;
    data['stnk_expired_date'] = stnkExpiredDate;
    data['region_code'] = regionCode;
    data['region_name'] = regionName;
    data['area_code'] = areaCode;
    data['area_name'] = areaName;
    data['branch_code'] = branchCode;
    data['branch_name'] = branchName;
    data['location_code'] = locationCode;
    data['location_name'] = locationName;
    data['division_code'] = divisionCode;
    data['division_name'] = divisionName;
    data['department_code'] = departmentCode;
    data['department_name'] = departmentName;
    data['sub_department_code'] = subDepartmentCode;
    data['sub_department_name'] = subDepartmentName;
    data['unit_code'] = unitCode;
    data['unit_name'] = unitName;
    data['procurement_request_no'] = procurementRequestNo;
    data['procurement_request_date'] = procurementRequestDate;
    data['purchase_order_no'] = purchaseOrderNo;
    data['purchase_date'] = purchaseDate;
    data['purchase_price'] = purchasePrice;
    data['original_price'] = originalPrice;
    data['residual_value'] = residualValue;
    data['grn_no'] = grnNo;
    data['grn_date'] = grnDate;
    data['invoice_no'] = invoiceNo;
    data['invoice_date'] = invoiceDate;
    data['tax_type_code'] = taxTypeCode;
    data['tax_type_name'] = taxTypeName;
    data['is_with_ppn'] = isWithPpn;
    data['ppn_pct'] = ppnPct;
    data['ppn_amount'] = ppnAmount;
    data['is_pph_charged'] = isPphCharged;
    data['pph_pct'] = pphPct;
    data['pph_amount'] = pphAmount;
    data['shipping_fee_amount'] = shippingFeeAmount;
    data['other_fee_amount'] = otherFeeAmount;
    data['pic_code'] = picCode;
    data['pic_name'] = picName;
    data['pic_nik'] = picNik;
    data['pic_position_code'] = picPositionCode;
    data['pic_position_name'] = picPositionName;
    data['pic_region_code'] = picRegionCode;
    data['pic_region_name'] = picRegionName;
    data['pic_area_code'] = picAreaCode;
    data['pic_area_name'] = picAreaName;
    data['pic_branch_code'] = picBranchCode;
    data['pic_branch_name'] = picBranchName;
    data['pic_location_code'] = picLocationCode;
    data['pic_location_name'] = picLocationName;
    data['pic_division_code'] = picDivisionCode;
    data['pic_division_name'] = picDivisionName;
    data['pic_department_code'] = picDepartmentCode;
    data['pic_department_name'] = picDepartmentName;
    data['pic_sub_department_code'] = picSubDepartmentCode;
    data['pic_sub_department_name'] = picSubDepartmentName;
    data['pic_unit_code'] = picUnitCode;
    data['pic_unit_name'] = picUnitName;
    data['user_code'] = userCode;
    data['user_name'] = userName;
    data['user_nik'] = userNik;
    data['user_position_code'] = userPositionCode;
    data['user_position_name'] = userPositionName;
    data['use_start_date'] = useStartDate;
    data['user_region_code'] = userRegionCode;
    data['user_region_name'] = userRegionName;
    data['user_area_code'] = userAreaCode;
    data['user_area_name'] = userAreaName;
    data['user_branch_code'] = userBranchCode;
    data['user_branch_name'] = userBranchName;
    data['user_location_code'] = userLocationCode;
    data['user_location_name'] = userLocationName;
    data['user_division_code'] = userDivisionCode;
    data['user_division_name'] = userDivisionName;
    data['user_department_code'] = userDepartmentCode;
    data['user_department_name'] = userDepartmentName;
    data['user_sub_department_code'] = userSubDepartmentCode;
    data['user_sub_department_name'] = userSubDepartmentName;
    data['user_unit_code'] = userUnitCode;
    data['user_unit_name'] = userUnitName;
    data['requestor_code'] = requestorCode;
    data['requestor_name'] = requestorName;
    data['requestor_nik'] = requestorNik;
    data['requestor_position_code'] = requestorPositionCode;
    data['requestor_position_name'] = requestorPositionName;
    data['requestor_region_code'] = requestorRegionCode;
    data['requestor_region_name'] = requestorRegionName;
    data['requestor_area_code'] = requestorAreaCode;
    data['requestor_area_name'] = requestorAreaName;
    data['requestor_branch_code'] = requestorBranchCode;
    data['requestor_branch_name'] = requestorBranchName;
    data['requestor_location_code'] = requestorLocationCode;
    data['requestor_location_name'] = requestorLocationName;
    data['requestor_division_code'] = requestorDivisionCode;
    data['requestor_division_name'] = requestorDivisionName;
    data['requestor_department_code'] = requestorDepartmentCode;
    data['requestor_department_name'] = requestorDepartmentName;
    data['requestor_sub_department_code'] = requestorSubDepartmentCode;
    data['requestor_sub_department_name'] = requestorSubDepartmentName;
    data['requestor_unit_code'] = requestorUnitCode;
    data['requestor_unit_name'] = requestorUnitName;
    data['vendor_code'] = vendorCode;
    data['vendor_name'] = vendorName;
    data['vendor_business_type_code'] = vendorBusinessTypeCode;
    data['vendor_business_type_name'] = vendorBusinessTypeName;
    data['vendor_address'] = vendorAddress;
    data['vendor_zip_code'] = vendorZipCode;
    data['vendor_postal_code'] = vendorPostalCode;
    data['vendor_province_code'] = vendorProvinceCode;
    data['vendor_province_name'] = vendorProvinceName;
    data['vendor_city_code'] = vendorCityCode;
    data['vendor_city_name'] = vendorCityName;
    data['vendor_district'] = vendorDistrict;
    data['vendor_sub_district'] = vendorSubDistrict;
    data['vendor_contact_name'] = vendorContactName;
    data['vendor_contact_position'] = vendorContactPosition;
    data['vendor_contact_phone'] = vendorContactPhone;
    data['vendor_email'] = vendorEmail;
    data['vendor_contract_start_date'] = vendorContractStartDate;
    data['vendor_contract_end_date'] = vendorContractEndDate;
    data['vendor_contract_start_date_ui'] = vendorContractStartDateUi;
    data['vendor_contract_end_date_ui'] = vendorContractEndDateUi;
    data['is_warranty'] = isWarranty;
    data['is_vendor_warranty'] = isVendorWarranty;
    data['is_factory_warranty'] = isFactoryWarranty;
    data['is_maintenance'] = isMaintenance;
    data['is_insured'] = isInsured;
    data['is_reserved'] = isReserved;
    data['is_depre'] = isDepre;
    data['usefull'] = usefull;
    data['depre_category_comm_code'] = depreCategoryCommCode;
    data['depre_category_comm_name'] = depreCategoryCommName;
    data['total_depre_comm'] = totalDepreComm;
    data['depre_period_comm'] = deprePeriodComm;
    data['net_book_value_comm'] = netBookValueComm;
    data['depre_category_fiscal_code'] = depreCategoryFiscalCode;
    data['depre_category_fiscal_name'] = depreCategoryFiscalName;
    data['total_depre_fiscal'] = totalDepreFiscal;
    data['depre_period_fiscal'] = deprePeriodFiscal;
    data['net_book_value_fiscal'] = netBookValueFiscal;

    data['sale_amount'] = saleAmount;

    data['type_and_category_name'] = typeAndCategoryName;

    data['factory_warranty_period_type_code'] = factoryWarrantyPeriodTypeCode;
    data['factory_warranty_period_type_name'] = factoryWarrantyPeriodTypeName;
    data['factory_warranty_frequency_type_code'] =
        factoryWarrantyFrequencyTypeCode;
    data['factory_warranty_period'] = factoryWarrantyPeriod;
    data['factory_warranty_start_date'] = factoryWarrantyStartDate;

    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['average_rating'] = averageRating;
    data['total_rating'] = totalRating;
    data['method_type_comm'] = methodTypeComm;
    data['method_type_fisc'] = methodTypeFisc;
    data['asset_code_visibility_code'] = assetCodeVisibilityCode;
    data['number_of_coverage'] = numberOfCoverage;
    data['coverage_type'] = coverageType;
    return data;
  }
}