import '../../../battery_alert.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body,
      // appBar: _appBar,
    );
  }

  Widget get _body => GetBuilder<SettingController>(
        builder: (_) {
          return SafeArea(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: AppDecorations.backgroundImageDecoration,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //*NavBar
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 16.h),
                        child: const NavigationHeader(
                          // iconPath: AppSvgs.backArrow,
                          title: 'Setting',
                        ),
                      ),

                      SizedBox(height: 20.h),
                      //*SettingList Container
                      ...List.generate(
                        controller.settingsData.length,
                        (index) => SettingsListItem(
                          onTap: () {
                            controller.settingonPress(index: index);
                          },
                           currentIndex: controller.currentIndex,
                          index: index,
                          icon: controller.settingsData[index].icon,
                          title: controller.settingsData[index].title,
                          
                        ),
                      ),

                      //*divider
                      _divider,
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );

  //*Diverder
  Widget get _divider => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Divider(
          height: 1,
          color: Colors.white.withOpacity(0.4),
        ),
      );
}
