# Packaging with CPack

Repository for the [CPack exercise](https://github.com/Simulation-Software-Engineering/Lecture-Material/blob/main/03_building_and_packaging/cpack_exercise.md). The code is a slightly modified version of the [code used in the CMake exercise](https://github.com/Simulation-Software-Engineering/cmake-exercise).

## How to Test the Code

To test the changes made for the CPack exercise, follow these steps:

1.  **Build the Docker Image:**
    First, build the Docker image which provides the necessary build environment.
    ```bash
    docker build -t cpack-exercise .
    ```

2.  **Run the Docker Container:**
    Run the Docker container, mounting the current directory to `/mnt/cpack-exercise`.
    ```bash
    docker run --rm -it --mount type=bind,source="$(pwd)",target=/mnt/cpack-exercise cpack-exercise
    ```

3.  **Configure and Build the Project (Inside the Container):**
    Once inside the container, configure CMake and build the project.
    ```bash
    cmake -B build -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release
    cmake --build build
    ```

4.  **Install the Project (Inside the Container):**
    Run the install target to place the executable, library, and headers in the designated installation directories.
    ```bash
    cmake --install build
    ```
    You can verify the installation by checking the `/usr/local/bin`, `/usr/local/lib`, and `/usr/local/include/cpackexamplelib` directories.

5.  **Generate Packages (Inside the Container):**
    Build the `package` target to generate both `.tar.gz` and Debian (`.deb`) packages.
    ```bash
    cmake --build build --target package
    ```
    The generated packages will be in the `build/` directory, e.g., `cpackexample-0.1.0-Linux.tar.gz` and `cpackexample_0.1.0_amd64.deb`.

6.  **Install the Debian Package (Inside the Container):**
    Install the generated Debian package using `apt`.
    ```bash
    sudo apt install ./build/cpackexample_0.1.0_amd64.deb
    ```

7.  **Run the Installed Executable (Inside the Container):**
    Verify that the executable is in the system's PATH and runs correctly.
    ```bash
    which cpackexample
    cpackexample yamlParser/config.yml
    ```
    The output should show the program executing its various modules.

8.  **Check the Debian Package with Lintian (Inside the Container):**
    Inspect the generated Debian package for common errors and policy violations using `lintian`.
    ```bash
    lintian build/cpackexample_0.1.0_amd64.deb
    ```
    *Note: Several warnings and errors are expected from `lintian` as per the exercise instructions, and no fixes for these were implemented as they were optional tasks.*

## Optional Tasks

No optional tasks were completed as part of this exercise.