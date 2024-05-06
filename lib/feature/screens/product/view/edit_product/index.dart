import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:siparis_takip_sistemi_pro/feature/screens/product/model/product.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/product/service/product_service.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/view/base_scaffold.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_items.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/translations/locale_keys.g.dart';
import '../../bloc/products_bloc.dart';

part 'src/_edit_product_name_field.dart';
part 'src/_edit_product_page.dart';
part 'src/_edit_product_page_mixin.dart';
part 'src/_edit_product_price_field.dart';
part 'product_field.dart';
