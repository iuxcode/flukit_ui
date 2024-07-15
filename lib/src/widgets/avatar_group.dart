import 'package:flukit_ui/src/widgets/avatar.dart';
import 'package:flukit_utils/flukit_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Creates a group of stacked avatar
class FluAvatarGroup extends StatelessWidget {
  /// Creates a group of stacked avatar
  const FluAvatarGroup({
    required this.itemCount,
    super.key,
    this.visibleItemCount = 5,
    this.overlapSize = .65,
    this.itemBuilder,
    this.layout = FluAvatarGroupLayout.overlap,
    this.onTap,
  }) : assert(
          visibleItemCount <= itemCount,
          'Visible items must be less than items',
        );

  /// Item builder
  /// build the avatar
  final FluAvatar Function(int index)? itemBuilder;

  /// Handle on avatar tap event
  final void Function(int index)? onTap;

  /// Number of avatar to stack
  final int itemCount;

  /// Layout of the group
  final FluAvatarGroupLayout layout;

  /// Overlap size between avatars
  final double overlapSize;

  /// Number of visible avatar
  final int visibleItemCount;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        ObjectFlagProperty<FluAvatar Function(int index)?>.has(
          'itemBuilder',
          itemBuilder,
        ),
      )
      ..add(ObjectFlagProperty<void Function(int index)?>.has('onTap', onTap))
      ..add(IntProperty('itemCount', itemCount))
      ..add(EnumProperty<FluAvatarGroupLayout>('layout', layout))
      ..add(DoubleProperty('overlapSize', overlapSize))
      ..add(IntProperty('visibleItemCount', visibleItemCount))
      ..add(ObjectFlagProperty<void Function(int index)?>.has('onTap', onTap))
      ..add(IntProperty('itemCount', itemCount))
      ..add(EnumProperty<FluAvatarGroupLayout>('layout', layout))
      ..add(DoubleProperty('overlapSize', overlapSize))
      ..add(IntProperty('visibleItemCount', visibleItemCount))
      ..add(ObjectFlagProperty<void Function(int index)?>.has('onTap', onTap))
      ..add(IntProperty('itemCount', itemCount))
      ..add(EnumProperty<FluAvatarGroupLayout>('layout', layout))
      ..add(DoubleProperty('overlapSize', overlapSize))
      ..add(IntProperty('visibleItemCount', visibleItemCount))
      ..add(ObjectFlagProperty<void Function(int index)?>.has('onTap', onTap))
      ..add(IntProperty('itemCount', itemCount))
      ..add(EnumProperty<FluAvatarGroupLayout>('layout', layout))
      ..add(DoubleProperty('overlapSize', overlapSize))
      ..add(IntProperty('visibleItemCount', visibleItemCount));
  }

  double _getAvatarLeftPosition(int index, double size) =>
      index * (size * overlapSize);

  Widget _buildAvatar(int index, Widget child) => GestureDetector(
        onTap: () => onTap?.call(index),
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    var avatarSize = 0.0;
    final avatars = <Widget>[];

    for (var i = 0; i < visibleItemCount; i++) {
      final avatar = itemBuilder?.call(i) ??
          FluAvatar(
            key: ObjectKey(i),
            outlined: true,
            outlineColor: [context.colorScheme.surface],
          );
      avatars.add(
        Positioned(
          left: _getAvatarLeftPosition(i, avatar.size),
          child: _buildAvatar(i, avatar),
        ),
      );

      if (avatarSize == 0) {
        avatarSize =
            avatar.size + (avatar.outlined ? avatar.outlineThickness : 0);
      }
    }

    return SizedBox(
      height: avatarSize,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.centerLeft,
        fit: StackFit.expand,
        children: [
          ...avatars,
          if ((itemCount - visibleItemCount) > 0)
            Positioned(
              left: _getAvatarLeftPosition(avatars.length, avatarSize),
              child: _buildAvatar(
                -1,
                FluAvatar(
                  label: '+ ${itemCount - visibleItemCount}',
                  size: avatarSize,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// Enum representing the layout options for FluAvatarGroup.
///
/// The FluAvatarGroupLayout enum defines the different layout options
/// that can be used to arrange the avatars in the group.
enum FluAvatarGroupLayout {
  /// Arrange the avatars in the group with overlap.
  overlap,

  /// Arrange the avatars group in a triangle.
  triangle,

  /// Arrange the avatars in a square.
  square
}
