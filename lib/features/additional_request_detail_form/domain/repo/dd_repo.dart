import 'package:mobile_stock_opname/features/additional_request_detail_form/data/drop_down_employee.dart';
import 'package:mobile_stock_opname/features/additional_request_detail_form/data/drop_down_item_model.dart';
import 'package:mobile_stock_opname/features/additional_request_detail_form/data/drop_down_model.dart';
import 'package:mobile_stock_opname/features/additional_request_detail_form/domain/api/dd_api.dart';

class DropDownRepo {
  final DropDownApi dropDownApi = DropDownApi();

  Future<DropDownItemModel?> attemptDDItem(String action) =>
      dropDownApi.attemptDDItem(action);

  Future<DropDownModel?> attemptDD(String action) =>
      dropDownApi.attemptDD(action);

  Future<DropDownModel?> attemptDDPurchaseCondition(String action) =>
      dropDownApi.attemptDDPurchaseCondition(action);

  Future<DropDownEmployee?> attemptDDEmployee(String action) =>
      dropDownApi.attemptDDEmployee(action);
}
