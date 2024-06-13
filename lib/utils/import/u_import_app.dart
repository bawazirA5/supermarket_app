import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sqflite/sqflite.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../firebase_options.dart';
import 'package:image_picker/image_picker.dart';

// * alias name
import 'dart:developer' as dev;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as dir;

// * views
part '../../views/home/v_home.dart';
part '../../views/auth/v_login.dart';
part '../../views/auth/v_register.dart';
part '../../views/auth/v_forgot_pass.dart';
part '../../views/auth/v_wrapper.dart';

// * global widgets
part '../../widgets/w_appbar.dart';
part '../../widgets/w_progress.dart';
part '../../widgets/w_toast.dart';
part '../../widgets/w_error_text.dart';

// * widgets
part '../../views/home/widgets/shop/product/w_add_product.dart';
part '../../views/home/widgets/shop/image_slider/w_image_slider.dart';
part '../../views/home/widgets/shop/product/w_product_card.dart';
part '../../views/home/widgets/shop/product/w_products_section.dart';
part '../../views/home/widgets/shop/w_shop_body.dart';
part '../../views/home/widgets/shop/image_slider/w_indicator.dart';
part '../../views/home/widgets/shop/product/w_product_type.dart';
part '../../views/auth/widgets/w_auth_logo.dart';
part '../../widgets/w_custom_btn.dart';
part '../../views/auth/widgets/w_auth_check_account.dart';
part '../../widgets/w_text_field.dart';
part '../../views/auth/widgets/text-field/w_auth_email.dart';
part '../../views/auth/widgets/text-field/w_auth_pass.dart';
part '../../views/auth/widgets/w_auth_btn_forgot_pass.dart';
part '../../views/auth/widgets/text-field/w_auth_username.dart';
part '../../widgets/media-app/w_design_bottom_sheet.dart';
part '../../widgets/media-app/w_media_selected.dart';
part '../../views/auth/widgets/w_auth_image_user.dart';
part '../../views/home/widgets/cart/w_cart_body.dart';
part '../../views/home/widgets/w_bottom_navigation.dart';
part '../../views/home/widgets/favorite/w_favorite_products.dart';
part '../../views/home/widgets/shop/image_slider/w_announcements.dart';

// * models
part '../../model/auth/m_account_user.dart';
part '../../model/m_product.dart';
part '../../model/m_category.dart';

// * controllers
part '../../controller/c_navigation_bar.dart';
part '../../controller/auth/c_auth_security_pass.dart';
part '../../controller/auth/c_auth.dart';
part '../../controller/c_image.dart';
part '../../controller/c_product.dart';
part '../../controller/c_category.dart';

// * utils
part '../theme/u_color.dart';
part '../theme/u_setting_theme.dart';
part '../theme/u_theme.dart';
part '../lang/u_lang_key.dart';
part '../lang/u_lang_config.dart';
part '../constant/u_image.dart';
part '../constant/u_icons.dart';
part '../routes/u_routes.dart';
part '../dime/u_dime.dart';
part '../restart/u_restart.dart';
part '../../constant/products.dart';

// * init project
part '../../init-project/init_lang.dart';
part '../../init-project/init_material_app.dart';
part '../../init-project/init_responsive.dart';
part '../../init-project/init_manage_state.dart';
part '../../init-project/init_structure.dart';
part '../../init-project/init_firebase.dart';

part '../../views/home/widgets/categories/category_products/w_grid_view-products.dart';
part './../database/query/db_query_product.dart';
part '../database/tables/db_table_favorite.dart';
part './../database/connections/db_init.dart';
part '../database/model/db_model_favorite.dart';
part './../../controller/c_favorite.dart';

part './../../views/home/widgets/cart/w_cart_product.dart';

part './../database/tables/db_table_cart.dart';

part './../database/model/db_model_cart.dart';

part '../../controller/c_cart.dart';
part './../../init-project/init_theme.dart';
part '../../views/home/widgets/categories/w_category_body.dart';
part '../../views/home/widgets/categories/w_category_card.dart';
part '../../views/home/widgets/categories/category_products/v_category_products.dart';
part './../../views/home/drawer/header/w_header_drawer.dart';
part './../../views/home/drawer/header/w_header_user_image_drawer.dart';
part './../../views/home/drawer/w_body_drawer.dart';
part './../../views/home/drawer/service/w_service_drawer.dart';
part './../../views/home/drawer/service/w_service_item_drawer.dart';
part './../../widgets/w_alert.dart';
part './../../widgets/w_action_btn.dart';
part './../../views/home/drawer/service/lang-theme/w_service_lang.dart';
part './../../views/home/drawer/service/lang-theme/w_service_theme.dart';
part './../../controller/c_lang_theme.dart';
part './../../model/m_lang_theme.dart';
part './../../views/home/drawer/service/lang-theme/widgets/w_card_choice.dart';
part './../../views/home/widgets/web-view/v_web_view.dart';
part '../../views/home/drawer/service/about_us.dart';
