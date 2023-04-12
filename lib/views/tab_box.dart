import 'package:spam_request/export_files.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Widget> _screens = [
    const Scaffold(),
    const CategoryView(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: SizedBox(
        height: 50.h,
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: AppColors.buttonColor,
          unselectedItemColor: AppColors.kCD,
          backgroundColor: AppColors.white,
          selectedFontSize: 10.sp,
          unselectedFontSize: 10.sp,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            bottomNavItem(
              isSelected: _currentIndex == 0,
              label: 'Home',
              iconPath: AssetIcons.home,
            ),
            bottomNavItem(
              isSelected: _currentIndex == 1,
              label: 'Category',
              iconPath: AssetIcons.category,
            ),
            bottomNavItem(
              isSelected: _currentIndex == 2,
              label: 'Add',
              iconPath: AssetIcons.add,
            ),
            bottomNavItem(
              isSelected: _currentIndex == 3,
              label: 'Search',
              iconPath: AssetIcons.search,
            ),
            bottomNavItem(
              isSelected: _currentIndex == 4,
              label: 'Profile',
              iconPath: AssetIcons.profile,
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem bottomNavItem({
    required String iconPath,
    required String label,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        iconPath,
        height: 24.h,
        colorFilter: ColorFilter.mode(
          isSelected ? AppColors.buttonColor : AppColors.kCD,
          BlendMode.srcIn,
        ),
      ),
      label: label,
    );
  }
}
