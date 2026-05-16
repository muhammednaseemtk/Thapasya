# Student Dashboard API Integration Plan

## Overview
Fetch student name, greeting, class schedule, and recent class logs from API. When a course toggle is clicked, all sections update based on the selected course index using `Consumer`.

---

## Files to Create (9)

### Models
1. `lib/features/student/home/model/student_dashboard_model.dart`
2. `lib/features/student/home/model/student_schedule_model.dart`
3. `lib/features/student/home/model/student_class_log_model.dart`

### Services (all with try-catch)
4. `lib/features/student/home/service/student_dashboard_service.dart`
5. `lib/features/student/home/service/student_schedule_service.dart`
6. `lib/features/student/home/service/student_class_log_service.dart`

### Controllers (all with try-catch)
7. `lib/features/student/home/controller/student_dashboard_controller.dart`
8. `lib/features/student/home/controller/student_schedule_controller.dart`
9. `lib/features/student/home/controller/student_class_log_controller.dart`

---

## Files to Modify (5)

10. `lib/features/student/home/widget/student_dashboard_card.dart` - Add greeting param, use API data
11. `lib/features/student/home/widget/class_schedule_card.dart` - Accept schedules list, render dynamically
12. `lib/features/student/home/widget/recent_class_logs_card.dart` - Accept logs list, render dynamically
13. `lib/features/student/home/view/student_home_screen.dart` - Wire all Consumers, fetch on course change
14. `lib/main.dart` - Register 3 new providers

---

## API Endpoints
- Dashboard: `GET student/dashboard/{courseId}`
- Schedule: `GET class_schedule/get_schedule?course_id={courseId}`
- Class Logs: `GET daily_log/get_log?course_id={courseId}`
