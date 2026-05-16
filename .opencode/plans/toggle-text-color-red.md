# Fix: Toggle Button Selected Text Color to Red

## Change Required

**File:** `lib/core/widget/common_toggle.dart` (line 32)

**Current:**
```dart
textColor = AppColors.deepBlue;
```

**Change to:**
```dart
textColor = AppColors.darkRed;
```

This will make the selected toggle button text color red (`#FFB71C1C`) instead of deep blue.
