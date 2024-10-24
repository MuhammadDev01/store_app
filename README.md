# Store App 🛍️

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

**Store App** is a responsive e-commerce application developed using **Flutter** and the **Cubit** state management solution. The app is based on a project from **Tharwat Samy**'s Flutter course on Udemy. It connects to the [FakeStore API](https://fakestoreapi.com/) to display a range of products and allows users to switch between **Admin** and **User** modes for added functionality.

## ✨ Features

- **Admin/User Switch**: 
  - **Admin Mode**: Allows for editing and deleting products.
  - **User Mode**: Regular browsing and viewing of products without any modification rights.
- **Responsive Design**: Optimized UI that adjusts to all screen sizes and devices, including mobile and tablet.
- **State Management with Cubit**: Efficient handling of app states and logic.
- **Product Management**: Add, edit, and delete products (in admin mode).
- **API Integration**: Connected with the [FakeStore API](https://fakestoreapi.com/) to display products.

## 📱 Screenshots

| Admin Mode               | User Mode               |
|-------------------------|-------------------------|
| ![admin mode](https://github.com/user-attachments/assets/159374a7-cbc6-4bdb-90e9-0a1bbb7646c7)| ![user mode](https://github.com/user-attachments/assets/8c37c834-dd53-4742-97e5-0709367ec5a3)
 
https://github.com/user-attachments/assets/9dc7b321-5f65-40d9-bfd9-f661ae350bef


## 📥 Downloads

**Download App**      [Here](https://drive.google.com/drive/folders/1w1X_mKBEztf8RetnUjpkaNQ4w1BoCviO).


## 🚀 Getting Started

### Prerequisites

- **Flutter SDK**: [Install Flutter](https://flutter.dev/docs/get-started/install)
- A code editor such as [VSCode](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio)

### Installation

1. **Clone the repository**:

    ```bash
    git clone https://github.com/MuhammadDev01/store_app.git
    cd store_app
    ```

2. **Install dependencies**:

    ```bash
    flutter pub get
    ```

3. **Run the app**:

    - For Android/iOS:
      ```bash
      flutter run
      ```
    - For Web:
      ```bash
      flutter run -d chrome
      ```
    - For Windows:
      ```bash
      flutter run -d windows
      ```

## ⚙️ App Structure

The **Store App** follows a clean architecture, ensuring easy maintenance and scalability.

### Key Features & Custom Additions

- **Admin Switch**: Added a switch feature where if enabled, the user switches to admin mode and can manage the product catalog (edit or delete products).
- **Cubit State Management**: Ensures that the app's state is maintained efficiently.
- **FakeStore API**: Fetches product details such as title, price, category, and images from [FakeStore API](https://fakestoreapi.com/).

### API Integration

The app uses [FakeStore API](https://fakestoreapi.com/) to fetch real product data. You can view the API details and endpoints [here](https://fakestoreapi.com/docs).

## 🖼️ UI Design Philosophy

- **Responsive Layout**: The app adjusts to different screen sizes and orientations to provide the best user experience on any device.
- **Admin Control**: Built with security in mind, only users with admin rights (based on switch toggle) can modify or delete products.
  
## 🔧 Tools & Technologies

- **Flutter**: The cross-platform framework used to build the app.
- **Cubit**: A state management solution to handle app logic.
- **FakeStore API**: For product data retrieval.
- **Responsive UI**: Ensuring smooth user experiences on any screen size.

## 👤 Author

**Dev Muhammad** - [LinkedIn](https://www.linkedin.com/in/muhammad-khaled-811a9431a/) | [GitHub](https://github.com/MuhammadDev01).

**My Apps** - [Here](https://drive.google.com/drive/folders/18YQL6izZ-kHC2D2FamP89nJKfQyQOAx0).

## 💬 Feedback

If you have any feedback, please reach out at muhammadbenkhaled@gmail.com

---

**Happy Coding!** 🚀
