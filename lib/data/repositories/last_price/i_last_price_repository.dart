import '/domain/dto/last_price/last_price_dto.dart';
import '/domain/models/last_price/last_price_model.dart';
import '/utils/result.dart';

abstract class ILastPriceRepository {
  List<LastPriceModel> get lastPriceList;

  Future<Result<void>> initialize();

  Future<Result<LastPriceModel>> insert(LastPriceDto dto);

  Future<Result<LastPriceModel>> fetch(String productId);

  Future<Result<LastPriceModel>> update(LastPriceModel lastPrice);

  Future<Result<void>> delete(LastPriceModel lastPrice);
}
