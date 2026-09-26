# Telegram Profile & Navigation Task (Flutter)

Hello there! 👋 This is a mini Flutter and GetX application project mimicking a Telegram profile and navigation interface. I built this while focusing heavily on the small details like smooth scrolling, collapsing headers, and natural transitions.

---

## 📱 Features I Implemented

- **Interactive Profile Header:** Smooth expanded and collapsed states driven by natural scrolling using `SliverPersistentHeader`.
- **Smooth Avatar Transitions:** Seamlessly scales and repositions the avatar image as you scroll.
- **Segmented Tabs:** Interactive tab bar to switch between "Posts" and "Archived Posts" with live counters.
- **Responsive Layout:** Built with a custom `ResponsiveBreakpoints` setup to ensure it scales nicely across mobile devices and tablets without fixed device-specific coordinates.
- **Floating Bottom Nav & Action Bar:** A translucent bottom navigation bar paired with a contextual "Add a post" button that appears on the profile screen.
- **Dynamic Media Grid:** A two-column media grid with overlay items generated dynamically from local data models rather than hardcoded widgets.
- **Clean Architecture:** Organized in a feature-first structure to keep the code clean and maintainable.

---

## 📂 Project Structure

```text
lib/
├── app/
│   ├── bindings/        # GetX dependency injection bindings
│   ├── localization/    # Multi-language support (Arabic & English)
│   ├── routes/          # App pages and route definitions
│   ├── core/
│   │   ├── responsive/  # Breakpoints and responsive helpers
│   │   └── themes/      # App colors, themes, and controllers
│   ├── data/            # Local mock data and models
│   ├── features/
│   │   ├── chats/       # Chats feature module
│   │   ├── contacts/    # Contacts feature module
│   │   ├── main_navigations/ # Bottom navigation and main shell
│   │   ├── profile/     # Profile screen, slivers, headers, and grids
│   │   └── settings/    # Settings feature module
│   └── main.dart
```
