import '../../../battery_alert.dart'; // Import ScreenUtil for responsive design

class TimerButton extends GetView<ChargerTestingController> {
  const TimerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChargerTestingController>(initState: (state) {
      controller.startTimer();
    }, builder: (context) {
      return GestureDetector(
        onTap: controller.onTap,
        child: Container(
          width: 260.w,
          height: 77.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.purpleColor,
            boxShadow: [
              AppDecorations.smallWhiteBoxShadow,
              AppDecorations.smallboxShadow,
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            controller.isTimerRunning
                ? controller.formattedTime
                : 'Start Testing',
            style: BTextTheme.lightTextTheme.titleLarge,
          ),
        ),
      );
    });
  }
}
