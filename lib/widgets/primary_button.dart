import 'package:spam_request/export_files.dart';

class PrimeryButtonWidget extends StatelessWidget {
  VoidCallback? onPressed;
  String text;
  PrimeryButtonWidget({
    required this.onPressed,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 52.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Text(
          text,
          style: GoogleFonts.nunito(
            color: AppColors.white,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
