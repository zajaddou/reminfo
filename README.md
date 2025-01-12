# Reminfo - Configuration & Command Manager ![reminfo](https://img.shields.io/badge/Reminfo-Tool-blue)

Reminfo is a lightweight command-line utility designed to help users manage and recall essential system configurations, commands, paths, and notes. It streamlines workflows by providing quick access to frequently used data like commands, config files, and directories.

## Features 📋

- 📂 **Store Commands**: Save and manage frequently used commands for easy recall
- 🗂️ **Manage Config Files**: Store paths to essential config files for quick access
- 💾 **Directory Paths**: Store and recall important directory paths to streamline navigation
- 📝 **Text Notes**: Save short notes and reminders for easy reference
- 🚀 **Quick Execution**: Execute saved commands directly from the menu
- 🧹 **Clear Entries**: Remove stored data to keep your entries organized

## Prerequisites 📝

- A Debian-based operating system (Debian, Ubuntu, etc.)
- Bash shell

## Installation 🛠️

1. Clone the repository:
   ```bash
   git clone https://github.com/zajaddou/reminfo.git
   ```

2. Navigate to the directory:
   ```bash
   cd reminfo
   ```

3. Make the installation script executable:
   ```bash
   chmod +x install.sh
   ```

4. Run the installation script:
   ```bash
   sudo ./install.sh
   ```

5. Enjoy! 🎉
   ```bash
   Now that the installation is complete, you can use Reminfo
   ```

## Usage 💡

Reminfo can be run with various options to store, retrieve, or manage system information:

```bash
reminfo [OPTION]
```

### Available Options:

- `-a, --add`: Add a new entry (command, config file, directory, or note)
- `-c, --clear`: Clear all stored entries
- `-d, --delete [ENTRY]`: Delete a specific entry by number
- `-h, --help`: Display help message
- `-v, --view`: View all stored entries
- `     --msg`: Enable labeled output for easier readability

### Examples:

Add a new command:
```bash
reminfo -a
```

Clear all stored entries:
```bash
reminfo -c
```

Delete a specific entry (e.g., entry 1):
```bash
reminfo -d 1
```

## Contributing 🤝

We welcome contributions to improve Reminfo! Here's how you can help:

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License 📝

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact 📬

For questions or feedback, please:
- Open an issue on GitHub
- Contact: zajaddou@student.1337.ma

--- 