
import 'package:shopverse/core/util/constants/translations.dart';
import 'package:shopverse/core/util/cubit/home_cubit.dart';

const String usersTable = 'users';

final emailRegex = RegExp(
  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
);

// TranslationModel appTranslation() => homeCubit.translationModel!;