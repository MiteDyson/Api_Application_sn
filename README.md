
# Api_Application_sn

A Flutter-based application built to demonstrate fetching, displaying, and interacting with data from the Hive Blog API. This project showcases the effective use of API integration to display a dynamic list of trending posts, focusing on clean UI and efficient data handling.

---

## Features

- **API Integration**: Fetches trending posts using the Hive Blog API.
- **Dynamic ListView**: Displays posts in a scrollable list with detailed item views.
- **Post Details**:
  - Thumbnail
  - Author
  - Community
  - Time in relative format
  - Title
  - Short description (up to 1000 characters)
  - Votes count
  - Comments count
- **Responsive UI**: Designed for cross-platform support, including Android, iOS, and web.

---

## Getting Started

### Prerequisites

Ensure the following are installed on your system:

- **Flutter SDK**: [Installation Guide](https://docs.flutter.dev/get-started/install)
- **Dart SDK**: (Included with Flutter)
- **Git**: Version control system to clone the repository.

---

### Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/MiteDyson/Api_Application_sn.git
   ```

2. **Navigate to the Project Directory**:
   ```bash
   cd Api_Application_sn
   ```

3. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

4. **Run the Application**:
   ```bash
   flutter run
   ```

---

## API Details

The application fetches data using the following API call:

```bash
curl 'https://api.hive.blog/' \
  -H 'accept: application/json, text/plain, */*' \
  -H 'content-type: application/json' \
  --data-raw '{"id":1,"jsonrpc":"2.0","method":"bridge.get_ranked_posts","params":{"sort":"trending","tag":"","observer":"hive.blog"}}' \
  --compressed
```

### Key API Features:

- **Endpoint**: `https://api.hive.blog/`
- **Method**: `POST`
- **Parameters**:
  - `sort`: Specifies the sorting method (e.g., trending).
  - `tag`: Filters posts by tag (left empty for all).
  - `observer`: Observer's Hive username for context (default: `hive.blog`).

---

## Demo

### App Screenshot
![App Screenshot](https://github.com/user-attachments/assets/c9cc47c5-2be2-4565-9672-485047a24560)

### Demo Video
[![Watch Demo](https://github.com/user-attachments/assets/1de96782-fa17-4aa8-a41f-c33fbb0867db)

---

## Contributing

Contributions are welcome! To contribute:

1. Fork the repository.
2. Create a feature branch (`git checkout -b feature-name`).
3. Commit your changes (`git commit -m 'Add feature'`).
4. Push to the branch (`git push origin feature-name`).
5. Open a pull request.

---
