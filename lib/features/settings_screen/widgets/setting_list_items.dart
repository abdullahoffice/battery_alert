import '../../../battery_alert.dart';

class SettingsListItem extends StatelessWidget {
  final int currentIndex;
  final int index;
  final String icon;
  final String title;
  final VoidCallback onTap;

  const SettingsListItem({
    super.key,
    required this.currentIndex,
    required this.index,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 76.0,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            color: currentIndex == index
                ? AppColors.secondaryColor
                : Colors.transparent,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    RoundIconBox(icon: icon),
                    SizedBox(width: 10.0),
                    Text(
                      title,
                      style: BTextTheme.lightTextTheme.titleSmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        //*divider
        _divider,
      ],
    );
  }

  //*Diverder
  Widget get _divider => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Divider(
          height: 1,
          color: Colors.white.withOpacity(0.4),
        ),
      );
}
