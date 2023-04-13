import 'package:spam_request/export_files.dart';

class CommentaryView extends StatefulWidget {
  const CommentaryView({super.key, required this.category});
  final String category;

  @override
  State<CommentaryView> createState() => _CommentaryViewState();
}

class _CommentaryViewState extends State<CommentaryView> {
  TextEditingController controller = TextEditingController();
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommentaryBloc(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: CustomAppBar(
          onTap: () {
            Navigator.pop(context);
          },
          icon: Icons.arrow_back,
        ),
        body: ListView(
          physics: const RangeMaintainingScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16, top: 24.h),
              child: Column(
                children: [
                  Visibility(
                    visible: !isVisible,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.category,
                          style: GoogleFonts.nunito(
                              color: AppColors.textColor36,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          "Отправьте жалобу, если пользователь рассылает рекламные сообщения, комментарии или другим способом распространяет рекламу в непредназначенных для этого местах.",
                          style: GoogleFonts.nunito(
                              color: AppColors.textColor36,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          "Комментарий (необязательно)",
                          style: GoogleFonts.nunito(
                              color: AppColors.textColor9A,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 8.h),
                        TextFormField(
                          cursorHeight: 22.h,
                          maxLines: 5,
                          minLines: 2,
                          controller: controller,
                          cursorColor: AppColors.black,
                          decoration: InputDecoration(
                            filled: true,
                            hintText: "Опишите причину жалобы",
                            hintStyle: GoogleFonts.nunito(
                                color: AppColors.textColor9A, fontSize: 12.sp),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: AppColors.kEB),
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: AppColors.kEB),
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            errorBorder: OutlineInputBorder(
                              gapPadding: 8.0,
                              borderSide: BorderSide(
                                  color: Colors.redAccent.withOpacity(.6)),
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        BlocBuilder<CommentaryBloc, CommentaryState>(
                          builder: (context, state) {
                            return PrimeryButtonWidget(
                              onPressed: () {
                                context.read<CommentaryBloc>().postCommentary(
                                    category: widget.category,
                                    text: controller.text);
                                setState(() {
                                  isVisible = true;
                                });
                              },
                              text: "Отправить жалобу",
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: isVisible,
                    child: Column(
                      children: [
                        SizedBox(height: 150.h),
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
                              fontSize: 12.sp,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
