import 'package:compras/domain/dto/list_item/list_item_dto.dart';
import 'package:compras/domain/models/list_item/list_item_model.dart';
import 'package:compras/domain/user_cases/add_item_list_user_case.dart';
import 'package:compras/utils/command.dart';

class AddItemListViewModel {
  final AddItemListUserCase _userCase;

  AddItemListViewModel(this._userCase) {
    save = Command1<ListItemModel, ListItemDto>(_userCase.save);
    update = Command1<ListItemModel, ListItemModel>(_userCase.update);
  }

  late Command1<ListItemModel, ListItemDto> save;
  late Command1<ListItemModel, ListItemModel> update;
}
