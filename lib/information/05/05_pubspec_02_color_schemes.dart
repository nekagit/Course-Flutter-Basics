import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Styled Flutter App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
          brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.poppinsTextTheme().copyWith(
          displayLarge: AppTextStyles.h1Style,
          displayMedium: AppTextStyles.h2Style,
          bodyLarge: AppTextStyles.bodyStyle,
          labelLarge: AppTextStyles.buttonTextStyle,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
          brightness: Brightness.dark,
        ),
        textTheme:
            GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme).copyWith(
          displayLarge: AppTextStyles.h1StyleDark,
          displayMedium: AppTextStyles.h2StyleDark,
          bodyLarge: AppTextStyles.bodyStyleDark,
          labelLarge: AppTextStyles.buttonTextStyleDark,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Styled App', style: AppTextStyles.h1Style),
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Animated Title
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Welcome to Styled App!',
                    textStyle: AppTextStyles.h1Style,
                    speed: const Duration(milliseconds: 100),
                  ),
                ],
                totalRepeatCount: 1,
              ),
              const SizedBox(height: 20),

              // Gradient Card
              Container(
                decoration: BoxDecoration(
                  gradient: AppGradients.primaryGradient,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [AppShadows.cardShadow],
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Styled Components',
                      style:
                          AppTextStyles.h2Style.copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'This card showcases gradient and shadow styles',
                      style:
                          AppTextStyles.bodyStyle.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.2, end: 0),
              const SizedBox(height: 20),

              // Animated Buttons Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStyledButton(
                    'Primary',
                    AppColors.primaryColor,
                    AppGradients.primaryGradient,
                  ),
                  _buildStyledButton(
                    'Secondary',
                    AppColors.secondaryColor,
                    AppGradients.secondaryGradient,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Shimmer Effect
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Loading Spinner
              if (_isLoading)
                Center(
                  child: SpinKitDoubleBounce(
                    color: AppColors.primaryColor,
                    size: 50.0,
                    controller: _controller,
                  ),
                ),

              // Animated Container
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isLoading = !_isLoading;
          });
        },
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.refresh),
      ).animate().scale(duration: 300.ms).then().shake(duration: 500.ms),
    );
  }

  Widget _buildStyledButton(String text, Color color, Gradient gradient) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ).copyWith(
        backgroundColor: MaterialStateProperty.all(color),
      ),
      child: Text(text, style: AppTextStyles.buttonTextStyle),
    ).animate().scale(duration: 300.ms).then().shimmer();
  }
}

class AppColors {
  static const Color primaryColor = Color(0xFF6200EA);
  static const Color secondaryColor = Color(0xFF03DAC6);
  static const Color accentColor = Color(0xFFBB86FC);
  static const Color backgroundColor = Color(0xFFF5F5F5);
  static const Color textPrimaryColor = Color(0xFF212121);
  static const Color textSecondaryColor = Color(0xFF757575);
  static const Color errorColor = Color(0xFFB00020);
  static const Color successColor = Color(0xFF4CAF50);
  static const Color warningColor = Color(0xFFFFC107);
}

class AppGradients {
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [AppColors.primaryColor, AppColors.accentColor],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [AppColors.secondaryColor, AppColors.primaryColor],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

class AppTextStyles {
  static final h1Style = GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimaryColor,
  );

  static final h2Style = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimaryColor,
  );

  static final bodyStyle = GoogleFonts.poppins(
    fontSize: 16,
    color: AppColors.textSecondaryColor,
  );

  static final buttonTextStyle = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  // Dark theme variants
  static final h1StyleDark = h1Style.copyWith(color: Colors.white);
  static final h2StyleDark = h2Style.copyWith(color: Colors.white);
  static final bodyStyleDark = bodyStyle.copyWith(color: Colors.white70);
  static final buttonTextStyleDark = buttonTextStyle;
}

class AppShadows {
  static final cardShadow = BoxShadow(
    color: Colors.black.withOpacity(0.1),
    blurRadius: 10,
    offset: const Offset(0, 5),
  );
}

class AppAnimations {
  static const Duration defaultDuration = Duration(milliseconds: 300);
  static const Curve defaultCurve = Curves.easeInOut;
}
