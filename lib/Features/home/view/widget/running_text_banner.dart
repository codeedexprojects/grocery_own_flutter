import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/Common/colors.dart';

class RunningBanner extends StatefulWidget {
  final VoidCallback? onTap;
  final String bannerText;
  final String bannerImage;

  const RunningBanner({
    super.key,
    this.onTap,
    required this.bannerText,
    required this.bannerImage,
  });

  @override
  State<RunningBanner> createState() => _RunningBannerState();
}

class _RunningBannerState extends State<RunningBanner>
    with SingleTickerProviderStateMixin {
  static const _scrollSpeed = 30.0; // pixels per second
  static const _tickerDuration = Duration(minutes: 10); // Simulate infinite
  static const _bannerCornerRadius = 12.0;
  static const _countdownPadding = 5.0;
  static const _countdownItemPadding = EdgeInsets.symmetric(
    vertical: 2,
    horizontal: 6,
  );
  static const _countdownItemRadius = 8.0;
  static const _marqueeRepeatCount = 50;

  late final ScrollController _scrollController;
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _animationController = AnimationController(
      vsync: this,
      duration: _tickerDuration,
    )..addListener(_scrollText);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
    });
  }

  void _scrollText() {
    if (!_scrollController.hasClients) return;

    final maxScrollExtent = _scrollController.position.maxScrollExtent;
    final dt = _animationController.lastElapsedDuration?.inMilliseconds ?? 0;
    final offset = (dt / 1000.0) * _scrollSpeed;

    if (offset >= maxScrollExtent) {
      _scrollController.jumpTo(0);
    } else {
      _scrollController.jumpTo(offset);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(_bannerCornerRadius.r),
      child: Stack(
        children: [
          _buildBannerImage(),
          _buildCountdownTimer(),
          _buildMarqueeText(),
        ],
      ),
    );
  }

  Widget _buildBannerImage() {
    return Image.asset(
      widget.bannerImage,
      height: 180.h,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }

  Widget _buildCountdownTimer() {
    return Positioned(
      top: _countdownPadding.h,
      right: _countdownPadding.w,
      child: Row(
        children: [
          Text(
            'Starting in ',
            style: GoogleFonts.manrope(
              fontSize: 12.sp,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          _buildCountdownItem('23'),
          SizedBox(width: 5.w, child: Text(':')),
          _buildCountdownItem('39'),
          SizedBox(width: 5.w, child: Text(':')),
          _buildCountdownItem('32'),
        ],
      ),
    );
  }

  Widget _buildCountdownItem(String text) {
    return Container(
      padding: _countdownItemPadding,
      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(_countdownItemRadius.r),
      ),
      child: Text(
        text,
        style: GoogleFonts.manrope(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildMarqueeText() {
    return Positioned(
      bottom: 10.h,
      left: 0,
      right: 0,
      child: Container(
        color: AppColors.secondary,
        height: 25.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _marqueeRepeatCount,
          itemBuilder: (_, i) => _buildMarqueeRichText(),
        ),
      ),
    );
  }

  Widget _buildMarqueeRichText() {
    return Row(
      children: [
        RichText(
          text: TextSpan(
            style: GoogleFonts.lalezar(fontSize: 15.sp, color: Colors.white),
            children: [
              const TextSpan(text: "Enjoy FREE Delivery on all orders from "),
              TextSpan(
                text: "4 PM to 5 PM",
                style: GoogleFonts.lalezar(
                  fontSize: 15.sp,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(text: " — don't miss out!  |   "),
            ],
          ),
        ),
      ],
    );
  }
}
