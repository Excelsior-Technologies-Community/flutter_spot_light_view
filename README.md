# 🔦 Spotlight View

A lightweight and flexible Flutter package to **highlight any widget**
(Text, Button, Image, long descriptions, etc.) using a **beautiful spotlight overlay**.

Perfect for:
- App onboarding
- Feature tours
- Help & guidance screens
- First-time user experiences

---

## ✨ Features

✅ Highlight **any widget** (Button, Text, Image, Column, etc.)  
🎨 Fully customizable overlay color & text styles  
🔵 Multiple spotlight shapes  
&nbsp;&nbsp;• Circle  
&nbsp;&nbsp;• Rectangle  
&nbsp;&nbsp;• Rounded Rectangle  
🌓 Dimmed background with transparent focus area  
✍️ Title & multi-line description support  
🎞️ Smooth fade animation  
🧠 Programmatic control (no click required)  
📚 Library-ready & pub.dev friendly  

---

## 🎞️ Demo
![SpotLightView](https://github.com/user-attachments/assets/83c7a882-cacc-469d-8fee-8392c6820540)


---

## 📦 Installation
### Add dependency in `pubspec.yaml`:
```yaml
dependencies:
  spotlight_view:
    path: '.../flutter_spot_light_view/spotlight_view'
```

### Using GitHub (Recommended during development)
```yaml
dependencies:
  spotlight_view:
    git:
      url: https://github.com/yourusername/spotlight_view.git
```

### 🚀 Import
```dart
import 'package:spotlight_view/spotlight_view.dart';
```

---

## 🧠 Core Concept
| Component             | Responsibility                       |
| --------------------- | ------------------------------------ |
| `SpotlightView`       | Defines **what** to highlight        |
| `SpotlightController` | Controls **when** to show/hide       |
| Overlay               | Automatically managed by the library |

You never need to handle `OverlayEntry`, `RenderBox`, or animations yourself.

---

## 🧩 Basic Usage
### 1️⃣ Create a controller
```dart
final SpotlightController controller = SpotlightController();
```

### 2️⃣ Wrap the widget you want to highlight
**🔹 Highlight a Button**
```dart
SpotlightView(
  controller: controller,
  shape: SpotlightShape.circle,
  title: "Create",
  description: "Tap here to create a new item",
  child: ElevatedButton(
    onPressed: () {},
    child: const Text("Create"),
  ),
),
```

**🔹 Highlight a Long Description Text**
```dart
SpotlightView(
  controller: controller,
  shape: SpotlightShape.roundedRectangle,
  title: "Important Information",
  description: "Please read this carefully",
  child: Container(
    padding: const EdgeInsets.all(16),
    width: double.infinity,
    child: const Text(
      "This is a long multi-line description text that can be "
      "highlighted without being clickable.",
    ),
  ),
),
```

### 3️⃣ Start spotlight (NO click required)
**✅ Auto start when screen loads (recommended)**
```dart
@override
void initState() {
  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    controller.start();
  });
}
```

**✅ Trigger manually (menu / help button / logic)**
```dart
controller.start();
```

**🔁 Multiple Spotlight Steps (Tour)**
Wrap multiple widgets with the same controller:
```dart
SpotlightView(
  controller: controller,
  title: "Step 1",
  description: "This is the first feature",
  child: Icon(Icons.add),
),

SpotlightView(
  controller: controller,
  title: "Step 2",
  description: "This is the second feature",
  child: Icon(Icons.settings),
),
```

Start the tour:
```dart
controller.start();
```

---

## 🎨 Customization
**Overlay color**
```dart
color: Colors.black.withOpacity(0.8),
```

**Text styles**
```dart
titleTextStyle: TextStyle(
  color: Colors.white,
  fontSize: 20,
  fontWeight: FontWeight.bold,
),

descriptionTextStyle: TextStyle(
  color: Colors.white70,
  fontSize: 14,
),
```

**🔵 Spotlight Shapes**
```dart
SpotlightShape.circle
SpotlightShape.rectangle
SpotlightShape.roundedRectangle
```
💡 Tip: Use `roundedRectangle` for long text or paragraphs.

---

## 📄 License
```text
Copyright (c) 2026 Excelsior Technologies

Permission is hereby granted, free of charge, to any person obtaining a copy  
of this software and associated documentation files (the "Software"), to deal  
in the Software without restriction, including without limitation the rights  
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell  
copies of the Software, and to permit persons to whom the Software is  
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all  
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED **"AS IS"**, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,  
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
```
