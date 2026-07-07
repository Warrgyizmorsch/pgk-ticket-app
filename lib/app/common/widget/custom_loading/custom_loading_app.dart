import '../../../common/constant/app_imports.dart';

class CustomAppLoader extends StatefulWidget {
  final double size;

  const CustomAppLoader({super.key, this.size = 70.0});

  @override
  State<CustomAppLoader> createState() => _CustomAppLoaderState();
}

class _CustomAppLoaderState extends State<CustomAppLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double totalSize = widget.size + 20;

    return Center(
      child: SizedBox(
        width: totalSize,
        height: totalSize,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: totalSize,
              height: totalSize,
              child: const CircularProgressIndicator(
                strokeWidth: 5.0,
                color: AppColors.primary,
              ),
            ),

            ScaleTransition(
              scale: _animation,
              child: ClipOval(
                child: Image.asset(
                  ImageConstant.appLogo,
                  width: widget.size,
                  height: widget.size,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
