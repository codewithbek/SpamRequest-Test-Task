import 'package:spam_request/export_files.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.onTap,
    required this.icon,
  });

  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 110.h,
      elevation: 1,
      backgroundColor: AppColors.white,
      centerTitle: true,
      leading: Padding(
        padding: EdgeInsets.only(bottom: 40.h),
        child: IconButton(
            onPressed: onTap,
            icon: Icon(
              icon,
              color: AppColors.black,
            )),
      ),
      title: Column(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.kCD,
            radius: 32.r,
            child: Text(
              "К",
              style: GoogleFonts.nunito(
                  color: AppColors.textColor36,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            "Константин Володарский",
            style: GoogleFonts.nunito(
                color: AppColors.textColor36,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => Size(double.infinity, 110.h);
}
