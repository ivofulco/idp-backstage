# Prerequisites
Access to a Unix-based operating system, such as Linux, MacOS or Windows Subsystem for Linux
A GNU-like build environment available at the command line. For example, on Debian/Ubuntu you will want to have the make and build-essential packages installed. On MacOS, you will want to have run xcode-select --install to get the XCode command line build tooling in place.
An account with elevated rights to install the dependencies
curl or wget installed
Node.js Active LTS Release installed using one of these methods:
Using nvm (recommended)
Installing nvm
Install and change Node version with nvm
Binary Download
Package manager
Using NodeSource packages
yarn Installation
You will need to use Yarn classic to create a new project, but it can then be migrated to Yarn 3
docker installation
git installation
If the system is not directly accessible over your network the following ports need to be opened: 3000, 7007. This is quite uncommon, unless when you're installing in a container, VM or remote system.