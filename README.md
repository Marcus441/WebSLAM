# WebSLAM
This project is an image recognition framework utilizing SLAM (Simultaneous Localization and Mapping) for augmented reality (AR) purposes. The core logic is implemented in C/C++ and compiled to WebAssembly for seamless integration with web-based AR applications.

## License

This project is licensed under the **Apache License 2.0**.

### Apache License 2.0 Summary:
- **Permissive license**: You are free to use, modify, and distribute the code, including in commercial projects.
- **Patent grant**: Users are protected from patent claims for using the code.
- **Copyleft**: If you modify and distribute the code, you must include the same license and document changes made.

For the full text of the license, please refer to the `LICENSE` file in this repository.

## Project Setup

### Prerequisites
- **C/C++**: Core logic is implemented in C/C++.
- **WebAssembly**: The project is compiled to WebAssembly for web integration.
- **AR.js** or other AR frameworks for integration.

### Installation
To build and run this project locally, follow these steps:

1. Clone the repository:
   ```bash
   git clone https://github.com/Marcus441/WebSLAM.git
   cd WebSLAM ```
2. Install dependencies
3. Build the project (C/C++ to WebAssembley)
   ```bash
   emcc src/main.c -o build/slam.js```
5. Run the project
   Use a simple HTTP server to run the project locally
   ```bash
   python3 -m http.server```
   
