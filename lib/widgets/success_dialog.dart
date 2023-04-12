import 'package:spam_request/export_files.dart';
import 'package:spam_request/widgets/primary_button.dart';

Future<void> succesDialog(BuildContext context) {
  return showDialog<void>(
    context: context,
    // barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return Dialog(
        child: SizedBox(
          height: 300.h,
          width: double.infinity,
          child: Column(
            children: [
              SvgPicture.asset(AssetIcons.checkSucces),
              SizedBox(height: 24.h),
              Text(
                "Спасибо!",
                style: GoogleFonts.nunito(
                    color: AppColors.textColor36,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 12.h),
              Text(
                "Модераторы скоро рассмотрят вашу жалобу.",
                style: GoogleFonts.nunito(
                    color: AppColors.textColor36,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 24.h),
              PrimeryButtonWidget(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, RouteNames.tabBox, (route) => false);
                  },
                  text: "Закрыть")
            ],
          ),
        ),
      );
    },
  );
}
