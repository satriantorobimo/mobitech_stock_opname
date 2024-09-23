import 'package:equatable/equatable.dart';
import 'package:mobile_stock_opname/features/asset_opname_detail/data/asset_grow_request_model.dart';

abstract class AssetGrowEvent extends Equatable {
  const AssetGrowEvent();
}

class AssetGrowAttempt extends AssetGrowEvent {
  const AssetGrowAttempt({required this.assetGrowRequestModel});
  final AssetGrowRequestModel assetGrowRequestModel;

  @override
  List<Object> get props => [assetGrowRequestModel];
}
