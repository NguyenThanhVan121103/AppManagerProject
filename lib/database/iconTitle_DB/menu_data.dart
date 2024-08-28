import 'package:appmanager/features/screen/views/contract/widget/contractPage.dart';
import 'package:appmanager/features/screen/views/schedule/widget/calendarPage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import '../../features/screen/views/debt/widget/debtPage.dart';
import '../../models/menu/menuModel.dart';

List<menuModel> menuData = [
  menuModel (
    titles: 'Schedule', icons: Iconsax.calendar, onTap: CalendarPageView(),
  ),
  menuModel(
    titles:'Debt',
    icons: Iconsax.money_send,
    onTap: DebtPageView(),
  ),
  menuModel(
      titles: 'Contracts',
      icons: Iconsax.barcode,
    onTap: ContractPageView(),
  ),
];

