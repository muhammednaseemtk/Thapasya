# Fix: fetchAttempted Blocking Course Toggle Fetches

## Root Cause
`fetchAttempted` flag in all 3 controllers is set to `true` on first fetch and never reset, blocking all subsequent course toggle fetches.

## Files to Modify (3)

### 1. `lib/features/student/home/controller/student_dashboard_controller.dart`

**Current (line 14-19):**
```dart
Future<void> fetchIfNeeded(int courseId) async {
    if (fetchAttempted || (currentCourseId == courseId && isFetched)) {
        return;
    }
    fetchAttempted = true;
    await fetchDashboard(courseId);
}
```

**Fix:**
```dart
Future<void> fetchIfNeeded(int courseId) async {
    if (currentCourseId == courseId && isFetched) {
        return;
    }
    await fetchDashboard(courseId);
}
```

### 2. `lib/features/student/home/controller/student_schedule_controller.dart`

**Current (line 14-19):**
```dart
Future<void> fetchIfNeeded(int courseId) async {
    if (fetchAttempted || (currentCourseId == courseId && isFetched)) {
        return;
    }
    fetchAttempted = true;
    await fetchSchedule(courseId);
}
```

**Fix:**
```dart
Future<void> fetchIfNeeded(int courseId) async {
    if (currentCourseId == courseId && isFetched) {
        return;
    }
    await fetchSchedule(courseId);
}
```

### 3. `lib/features/student/home/controller/student_class_log_controller.dart`

**Current (line 14-19):**
```dart
Future<void> fetchIfNeeded(int courseId) async {
    if (fetchAttempted || (currentCourseId == courseId && isFetched)) {
        return;
    }
    fetchAttempted = true;
    await fetchLogs(courseId);
}
```

**Fix:**
```dart
Future<void> fetchIfNeeded(int courseId) async {
    if (currentCourseId == courseId && isFetched) {
        return;
    }
    await fetchLogs(courseId);
}
```

## Result
- First load → fetches data
- Toggle same course → skips (already fetched)
- Toggle different course → fetches fresh data for dashboard, schedule, and logs
