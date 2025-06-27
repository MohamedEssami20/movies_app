import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_text_styles.dart';

void showAddedToWatchlistBottomSheet(BuildContext context, String movieTitle) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (_) => _WatchlistBottomSheet(
      movieTitle: movieTitle,
    ),
  );
}

class _WatchlistBottomSheet extends StatefulWidget {
  const _WatchlistBottomSheet({required this.movieTitle});
  final String movieTitle;
  @override
  State<_WatchlistBottomSheet> createState() => _WatchlistBottomSheetState();
}

class _WatchlistBottomSheetState extends State<_WatchlistBottomSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutBack,
    );

    _animationController.forward();

    // Auto dismiss after 2.5 seconds
    Future.delayed(const Duration(milliseconds: 2500), () {
      if (mounted) Navigator.of(context).pop();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 30,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'You have added ${widget.movieTitle} to watchlist',
                maxLines: null,
                style: AppTextStyles.medium16(context).copyWith(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
