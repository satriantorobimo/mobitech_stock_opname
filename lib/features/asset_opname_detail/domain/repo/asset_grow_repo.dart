import 'package:mobile_stock_opname/features/asset_opname_detail/data/asset_grow_request_model.dart';
import 'package:mobile_stock_opname/features/asset_opname_detail/data/asset_grow_response_model.dart';
import 'package:mobile_stock_opname/features/asset_opname_detail/domain/api/asset_grow_api.dart';
import 'package:mobile_stock_opname/features/login/data/general_response_model.dart';

class AssetGrowRepo {
  final AssetGrowApi assetGrowApi = AssetGrowApi();

  Future<AssetGrowResponseModel?> attemptAssetGrow(
          AssetGrowRequestModel assetGrowRequestModel) =>
      assetGrowApi.attemptAssetGrow(assetGrowRequestModel);

  Future<GeneralResponseModel?> attemptReserved(String assetCode) =>
      assetGrowApi.attemptReserved(assetCode);
}
