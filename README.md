# 💧 Sipnudge Analysis Screen – Flutter Interview Assignment

A pixel-perfect Flutter implementation of the **Analysis Screen** for Sipnudge Technologies, focusing on clean architecture, professional state management, and precise data visualization.

---

##  Objective

This project was built as part of a Flutter technical assessment to demonstrate:

- High-fidelity UI implementation
- Clean Architecture principles
- Professional state management using **Cubit (flutter_bloc)**
- Advanced chart rendering with **custom, non-clipping tooltips**

The UI strictly follows the provided Figma design with emphasis on typography, spacing, colors, and interaction accuracy.

---

##  Core Features

### ⏱ Interval Filtering
- Toggle between **Weekly**, **Monthly**, and **Yearly** views
- State-driven UI updates using Cubit

###  Dynamic Date Navigation
- Displays the correct date range for the selected interval
- Forward & Backward navigation to shift time periods

###  Data Visualization
- **Bar Chart** for discrete hydration milestones
- **Area Chart** for hydration trends over time
- Powered by `fl_chart`

###  Advanced Tooltips 
- Triggered on data-point selection
- Positioned **directly above** the selected value
- Fully **non-clipping**, even near screen edges
- Styled to exactly match Figma specifications

---

##  Architecture Overview

This project follows **Clean Architecture principles** with strict separation of concerns.

