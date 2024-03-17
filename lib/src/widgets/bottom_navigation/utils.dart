part of './bottom_navigation.dart';

/// [FluBottomNavBarTypes.curved] clipper
class _CircularNotchedAndCorneredRectangleClipper extends CustomClipper<Path> {
  _CircularNotchedAndCorneredRectangleClipper({
    required this.geometry,
    required this.shape,
    required this.notchMargin,
  }) : super(reclip: geometry);

  final ValueListenable<ScaffoldGeometry> geometry;
  final double notchMargin;
  final NotchedShape shape;

  @override
  Path getClip(Size size) {
    final button = geometry.value.floatingActionButtonArea
        ?.translate(0, geometry.value.bottomNavigationBarTop! * -1.0);

    return shape.getOuterPath(Offset.zero & size, button?.inflate(notchMargin));
  }

  @override
  bool shouldReclip(_CircularNotchedAndCorneredRectangleClipper oldClipper) =>
      oldClipper.geometry != geometry ||
      oldClipper.shape != shape ||
      oldClipper.notchMargin != notchMargin;
}

/// A rectangle with a smooth circular notch and rounded corners.
class _CircularNotchedAndCorneredRectangle extends NotchedShape {
  _CircularNotchedAndCorneredRectangle({
    required this.notchSmoothness,
    required this.gapLocation,
    required this.borderRadius,
    // ignore: unused_element
    this.margin = 0,
  });

  final BorderRadius borderRadius;
  final GapLocation gapLocation;
  final double margin;
  final NotchSmoothness notchSmoothness;

  @override
  Path getOuterPath(Rect host, Rect? guest) {
    if (guest == null || !host.overlaps(guest)) return Path()..addRect(host);

    final notchRadius = guest.width / 2;

    final s1 = notchSmoothness.s1;
    final s2 = notchSmoothness.s2;

    final r = notchRadius;
    final a = -1.0 * r - s2;
    final b = host.top - guest.center.dy;

    final n2 = math.sqrt(b * b * r * r * (a * a + b * b - r * r));
    final p2xA = ((a * r * r) - n2) / (a * a + b * b);
    final p2xB = ((a * r * r) + n2) / (a * a + b * b);
    final p2yA = math.sqrt(r * r - p2xA * p2xA);
    final p2yB = math.sqrt(r * r - p2xB * p2xB);

    final p = List<Offset>.filled(6, Offset.zero, growable: true);

    // p0, p1, and p2 are the control points for segment A.
    p[0] = Offset(a - s1, b);
    p[1] = Offset(a, b);
    final cmp = b < 0 ? -1.0 : 1.0;
    p[2] = cmp * p2yA > cmp * p2yB ? Offset(p2xA, p2yA) : Offset(p2xB, p2yB);

    // p3, p4, and p5 are the control points for segment B, which is a mirror
    // of segment A around the y axis.
    p[3] = Offset(-1.0 * p[2].dx, p[2].dy);
    p[4] = Offset(-1.0 * p[1].dx, p[1].dy);
    p[5] = Offset(-1.0 * p[0].dx, p[0].dy);

    // translate all points back to the absolute coordinate system.
    for (var i = 0; i < p.length; i += 1) {
      p[i] += margin > 0
          ? Offset(guest.center.dx - margin, guest.center.dy)
          : guest.center;
    }

    return Path()
      ..moveTo(host.left, host.bottom)
      ..lineTo(host.left, host.top)
      ..arcToPoint(
        Offset(host.left, host.top),
        radius: borderRadius.topLeft,
      )
      ..lineTo(p[0].dx, p[0].dy)
      ..quadraticBezierTo(p[1].dx, p[1].dy, p[2].dx, p[2].dy)
      ..arcToPoint(
        p[3],
        radius: Radius.circular(notchRadius),
        clockwise: false,
      )
      ..quadraticBezierTo(p[4].dx, p[4].dy, p[5].dx, p[5].dy)
      ..lineTo(host.right, host.top)
      ..arcToPoint(
        Offset(host.right, host.top),
        radius: borderRadius.topRight,
      )
      // ..lineTo(host.right, host.bottom)
      ..arcToPoint(
        Offset(host.right, host.bottom),
        radius: borderRadius.bottomRight,
      )
      // ..lineTo(host.left, host.bottom)
      ..arcToPoint(
        Offset(host.left, host.bottom),
        radius: borderRadius.bottomLeft,
      )
      ..close();
  }
}

/// [FluBottomNavBar] types.
enum FluBottomNavBarTypes {
  /// Create a Bottom navigation bar with flat corners
  flat,

  /// Create a Bottom navigation bar with rounded corners
  curved,
}

/// Where to position the [FluBottomNavBarTypes.curved] gap
enum GapLocation {
  ///
  none,

  /// The notch is positioned in the middle
  center,

  /// The notch is located at the end of the navbar
  end,
}

/// [FluBottomNavBarTypes.curved] notch corner smooth
enum NotchSmoothness {
  // ignore: public_member_api_docs
  sharpEdge,
  // ignore: public_member_api_docs
  defaultEdge,
  // ignore: public_member_api_docs
  softEdge,
  // ignore: public_member_api_docs
  smoothEdge,
  // ignore: public_member_api_docs
  verySmoothEdge
}

extension on NotchSmoothness {
  static const curveS1 = {
    NotchSmoothness.sharpEdge: 0.0,
    NotchSmoothness.defaultEdge: 15.0,
    NotchSmoothness.softEdge: 20.0,
    NotchSmoothness.smoothEdge: 30.0,
    NotchSmoothness.verySmoothEdge: 40.0,
  };

  static const curveS2 = {
    NotchSmoothness.sharpEdge: 0.1,
    NotchSmoothness.defaultEdge: 1.0,
    NotchSmoothness.softEdge: 5.0,
    NotchSmoothness.smoothEdge: 10.0,
    NotchSmoothness.verySmoothEdge: 20.0,
  };

  double get s1 => curveS1[this] ?? 15.0;

  double get s2 => curveS2[this] ?? 1.0;
}
