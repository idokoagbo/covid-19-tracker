part of 'splash.dart';


class _SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900],
      child: Center(
        child: FractionallySizedBox(
          widthFactor: 1,
          heightFactor: 1,
          child: Image.asset('assets/images/logo.jpg',
            fit: BoxFit.contain,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}
