# OCaml Installation

This practical guide aims to install and configure all the necessary
software for developing OCaml code in the **Programming Languages and
Environments** course.

The entire installation process described in this guide, as well as
the development in the **Programming Languages and Environments**
course, will be based on a Unix family Operating System. The [Unix
Development System](#unix-development-system) section shows how to
install a Unix system on a machine running Windows or Mac.

By the end of this guide, you should have installed the following
platforms on your machine:

- A Unix-based development system
- OPAM, the OCaml package manager
- An OPAM *switch*, with a specific compiler version and some packages
- The Visual Studio Code editor, with the OCaml plugin

The entire installation process is heavily based on using the terminal
(console).

## Unix Development System
> [!IMPORTANT] 
> This is an excellent opportunity to update your
> Operating System. In general, it is good practice to keep your
> Operating System and installed software updated, especially before
> installing a substantial set of new programs.

## Linux

If you already have a functional Linux system, you can skip to the
[OPAM Installation](#opam-installation) section.

### Mac

As a package manager on a MacOS system, you should choose between
[Homebrew][homebrew] or [MacPorts][macports]. For the purpose of
installing the software required for this course, we believe that
Homebrew offers a simpler and more user-friendly installation
process. Therefore, if you are not already a MacPorts user, we
recommend installing Homebrew and following all the instructions
presented for this platform. **Important note:** you should never try
to install Homebrew and MacPorts simultaneously! These two package
managers are not designed to coexist.

[homebrew]: https://brew.sh/
[macports]: https://www.macports.org/install.php

### Windows

Using a Unix environment within the Windows Operating System is
possible thanks to the *Windows Subsystem for Linux* (WSL). In any
recent version of Windows, WSL is relatively simple to install. 
> [!TIP] 
> Using WSL may require changing your machine's
> configuration. If, during the WSL installation, the error about
> "virtual machine" appears, then it's a sign that you should enable
> virtualization through your machine's BIOS. The BIOS configuration
> depends on each manufacturer and computer model. A search for `enable
> virtualization [manufacturer] [model]` should return sufficient
> results to resolve the issue.

> [!WARNING]

If you are unable or choose not to use WSL, it is possible to install a native
OCaml development environment on Windows 11. **However**, you will not be able
to use Jupyter Notebooks, which will be used in the practical lessons.

Therefore, this alternative **is not recommended and should only be used
as a last resort**. Proceed to the [installation section](#opam-installation) and follow the
instructions labeled **(Native)** instead of **(WSL)** to install the development
environment natively on Windows.

The WSL installation is completed as follows:

- Open Windows PowerShell as Administrator. To do this, click on
  *Start* and type *PowerShell*. Click on "Run as Administrator" and
  click "Yes" to accept modifications.

- Run `wsl --install`. Alternatively, if you already have a WSL system
  installed, but not the Ubuntu distribution, run `wsl --install -d
  Ubuntu`. Once the Ubuntu distribution download is complete, you will
  likely be asked to restart your machine. The installation will
  continue automatically after restart.

- During installation, you will be asked to enter credentials for the
new Unix system user, that is, a username and a password. Any set of
credentials will work at this stage, as they have no influence on your
Windows credentials. Do not use spaces in your password and memorize
it.

> [!WARNING] 
> If you are not asked for any credentials, then
> something went wrong during the installation. Do not proceed beyond
> this point! Uninstall the Ubuntu distribution and restart the process.

<!-- TODO: include instructions for older versions of Windows -->

**Ubuntu Configuration.** To follow the next instructions, we assume
you installed Ubuntu version 22.04, the default version in WSL. Any
more recent version of this distribution should also allow you to
follow the rest of this section without problems.

> [!WARNING]
> At this point, make sure that all commands are executed within WSL
> (Windows Subsystem for Linux). To ensure that you are on the right environment:

Open the Ubuntu application. This application may already be running
if you just installed WSL. You should be presented with the *Bash
prompt*, a console with the following appearance:

```console
user@machine:~$
```
> [!WARNING]
> If the prompt looks like `root@...#` then something went
> wrong. Check if you actually created a username and password in the
> previous step. If yes, your username showing in the prompt should be
> the same as you chose earlier and not `root`. Do not proceed beyond
> this point! The easiest solution would be to reinstall the Ubuntu
> distribution.

In more recent versions of Windows, the combination `Ctrl+Shift+C`
allows you to copy text from the terminal, while the combination
`Ctrl+Shift+V` allows you to paste it. Including the `Shift` key is
mandatory, otherwise you will not get the desired effect.

To update the *Aptitude* manager (Ubuntu distribution's software
manager), run the following command:

```console
sudo apt update
```

You should enter the password you chose in previous steps. The `sudo`
prefix refers to running the `apt update` command in administrator
mode or, in Unix terminology, as *super user*.

> [!WARNING]
> *With great power, comes great responsibility*. Running
> commands as super user allows almost complete control of the system,
> and is therefore potentially dangerous. You should not, therefore,
> run all commands in `sudo` mode, but only when strictly necessary.

Next, run the following command to update the installed software:

```console
sudo apt upgrade -y
```

Finally, proceed to install some useful packages:

```console
sudo apt install -y zip unzip build-essential
```

## OPAM Installation

**Linux.** Follow the [instructions][opam-install] for the
distribution you are using.

**Mac.** If you are using Homebrew, run the following command:

```console
brew install opam
```

If you are using MacPorts, run the following command:

```console
sudo port install opam
```

[opam-install]: https://opam.ocaml.org/doc/Install.html

**Windows (WSL).** Run the following command from Ubuntu:

```console
sudo apt install opam
```

**Windows (Native).** Open the Powershell and run the following command 

```console
winget install Git.git OCaml.opam
```
Afterwards, restart the Powershell.

## OPAM Initialization

> [!WARNING] 
> You should never use OPAM in super user mode. In other
> words, do not use the `sudo` prefix with any `opam` command.

**Linux, Mac, Windows (WSL) and Windows (Native).** Run:

```console
opam init --bare -a -y
```

(It is normal to get a warning about the `.profile` file not being
correctly referenced in the `.bashrc` file. You don't need to make any
intervention at this point.)

## Create an OPAM *Switch*

> [!WARNING] 
> Even if you may have already installed OPAM and created
> some *switch*, for the purpose of the **Programming Languages and
> Environments** course, you should create a new *switch* from
> scratch. In general, it is good practice when using OPAM to create
> new *switches* to modularize projects or development environments
> with very specific purposes.

A *switch* is the OPAM unit that allows you to name a specific
installation of an OCaml compiler version and a set of associated
software packages. You can have several switches created, each
presenting a specific compiler version, or a set of packages for a
very specific purpose (for example, a personal project you are working
on). You can freely alternate (*switch*, hence the name) between the
different switches you have created on your machine.

To create a switch for **LAP**, you should run the following command:

```console
opam switch create lap2025 ocaml-base-compiler.4.14.0
```

This command will create a switch with the name *lap2025* whose
underlying version of the OCaml compiler is 4.14.0.

> [!TIP] 
> If the previous command fails with the error that version
> 4.14.0 is not available, then you probably installed an old version
> of OPAM. Update OPAM with the command `opam update`.

** Linux, Mac and Windows (WSL)**
Next, you will be asked to run the following command:

```console
eval $(opam env)
```

You can do this, but the most important thing at this point is to log
out of your Operating System session (or simply restart the
machine). Open the terminal again and run the following command:

**Windows (Native)**
Execute the following command and logout of your Operating System (or
reboot the machine):

``` console
"`n(& opam env --shell=powershell) | Invoke-Expression" | Add-Content -Path $PROFILE
```

---

Open the terminal and run the following command:
```console
opam switch list
```

The result should look like this:

```console
#     switch                         compiler                       description
->    lap2025                        ocaml-base-compiler.4.14.0      lap2025
```

It may contain other lines if you have done OCaml development
before. You should pay particular attention to the following points:

- You should **not** get the warning "The environment is not in sync
  with the current switch. You should run `eval $(opam env)`". Below
  we indicate how to resolve this problem.

- The arrow `->` should be displayed in the first column to the left
  of the `lap2025` switch.

- The switch should display the correct name, as well as version
  4.14.0 of the compiler.

> [!WARNING] 
> If the previous step asks you to run the command `eval
> $(opam env)`, then something went wrong in the OPAM initialization
> step (command `opam init`). You can try running `opam init --reinit`
> to resolve the issue. Moreover, it is really necessary to complete
> the step of logging out of the Operating System session, or simply
> restarting the machine.

To install the OPAM packages we need for LAP, you should run the
following command:

```console
opam install -y utop odoc ounit2 qcheck bisect_ppx menhir merlin ocaml-lsp-server ocamlformat
```

The entire line above should be entered in the console, so you should
make sure to copy it in its entirety. You will likely be presented
with some *output* about text editor configuration. You can ignore
these indications.

At this point, you are already in a position to launch the `utop`
program, the *OCaml Universal Toplevel*:

```console
utop
```

As a very basic first experience, enter the number `42` followed by
the symbols `;;` (two semicolons). Then, press the `Enter` key. You
should get the following result:

```ocaml
# 42;;
- : int = 42
```

The `#` symbol indicates the prompt (*i.e.,* where to write) in
`utop`. After this simple experiment, exit `utop` by entering the
following command:

```ocaml
# #quit;;
```

Note the `#` symbol next to the word `quit`. You can also choose to
use the `Ctrl+D` combination.

## Visual Studio Code

As a vehicle for editing OCaml code for LAP, we strongly recommend
using **Visual Studio Code** (VS Code).

> [!IMPORTANT] 
> Despite the use of VS Code, there are several other
> editors that are excellent choices when it comes to editing OCaml
> code. Of these, we highlight `emacs` and `vim` as the most classic
> and even more widely used in industrial and academic environments
> for OCaml development. However, any of these editors presents a
> learning curve that may be discouraged for beginners.  On the other
> hand, **we strongly discourage** editing OCaml in Eclipse. The available
> plugin is not actively maintained and only works with old versions
> of the OCaml compiler.

First, you should download and then install [VS Code][vscode]. After
launching VS Code, you should open the extensions panel, using one of
the following options:

- Use the menu "View $\rightarrow$ Extensions";

- Click on the extensions icon in the bar on the left. This icon looks
  like four small squares.

> [!TIP] 
> At various times you will need to use the *Command
> Palette*. To do this, navigate through the menu View $\rightarrow$ Command
> Palette. You can also use the keyboard shortcut combination, which
> you should find next to the words "Command Palette" in the `View`
> menu.

Next, follow these instructions if you are using Windows or Mac:

- **Windows (WSL):** install the "WSL" extension.

- **Mac:** open the *Command Palette* and type `shell command` to find
  the command "Shell Command: Install 'code' command in PATH". Run
  this command.

Third, regardless of the Operating System used, close any open
terminal (or simply log out or restart the machine) so that the new
configurations take effect. This will allow, later, launching VS Code
from a terminal.

Fourth, and **only for Windows (WSL) users**, open the *Command
Palette* (shortcut: Ctrl + Shift + P) and
run the command `WSL: Connect to WSL`. This command will install
additional software. As soon as the command execution finishes, you
should observe an indicator with the message "WSL: Ubuntu" at the
bottom left of the VS Code window. If you only observe an icon with
the appearance <sub>&gt;</sub><sup>&lt;</sup> click on this and choose
"Connect to WSL" from the *Command Palette* that appears.

Fifth, open the VS Code extensions panel again. Search for and install
the **"OCaml Platform"** extension, developed by **OCaml Labs**. Do
not install any other extension, even if it refers to the OCaml
language.

> [!WARNING] 
> If, after installing the "OCaml Platform" extension, you
> observe an error regarding the lack of the `ocaml-lsp-server`
> package, then something went wrong in the installation of this
> package through OPAM. Check that you indeed installed this package
> via the `opam install` command, as mentioned in the "Create an OPAM
> *Switch*" section.

[vscode]: https://code.visualstudio.com/

## Verify VS Code Installation

This section presents a series of checks that we can perform to ensure
that the installation of VS Code and the OCaml extension were
successful.

- Restart the machine one more time

> [!TIP] 
> In reality, in a Unix development system, we don't really
> need to restart the machine so many times for the effects of
> software installation to take place. However, this step has the
> potential to detect various sources of error early and therefore
> deserves the extra effort.

- Open a new Unix console. In **Windows:** this is the Ubuntu console
  within the WSL system, not PowerShell or Cmd.

- Navigate to a directory of your choice, preferably a subdirectory of
  your HOME folder. To create a `lap2025` subdirectory, where you can
  store all the development done in this course, you can use the
  following commands:

  ```console
  mkdir ~/lap2025
  cd ~/lap2025
  ```

In this directory, launch VS Code, using the following command:

  ```console
  code .
  ```

Navigate through the menu File $\rightarrow$ New File. Save the file with
the name `test.ml`. At this moment, in VS Code, an orange icon with a
white camel should appear.

- Write the following piece of OCaml code, followed by the `Enter`
  key:

  ```ocaml
  let x : int = 42
  ```

Even while writing the code, VS Code should automatically highlight
the syntax, suggest ways to complete the code, as well as add a small
icon above the line. Try changing the word `int` to `string`. A small
wavy line should appear below `42`. You can use the mouse to check the
associated error message. You can also use the menu "View $\rightarrow$
Problems" to check this same error. Now, put quotation marks around
`42` to convert this integer to a string. The error should now
disappear.

**If you could not observe this behavior,** there is some problem with
your installation. You can try one of the following options:

- In the same console you used to launch VS Code, check that you can
  complete the verification instructions for the OPAM switch
  installation. Can you launch `utop`? Is the correct switch the one
  that is active? If none of these situations are verified, then this
  is exactly the problem you need to solve.

- If you are in WSL and VS Code only presents syntax coloring and you
  observe the error about "Sandbox initialization failed", then check
  that the "WSL" indicator is visible at the bottom left of the VS
  Code window. If not, check that you did install the "WSL" extension
  described earlier and that you are indeed running VS Code from
  Ubuntu and never from PowerShell or the Windows interface. Also
  check that the "OCaml Platform" extension is correctly installed.

## OCaml Editing Configuration in VS Code

Following good code presentation practices, we recommend changing some
of the default settings in the VS Code editor. Start by opening the
JSON file by navigating through the menu "View $\rightarrow$ Command
Palette". Then, type "user setting json". Finally, select `Open User
Settings (JSON)`. Below we present the recommended settings for LAP,
which we suggest you paste in the window presented:

```json
{
    "editor.tabSize": 2,
    "editor.rulers": [ 80 ],
    "editor.formatOnSave": true
}
```

With the configuration presented, all OCaml code lines that we will
write throughout the course will never have more than 80
characters. We thus obey the famous [**80 columns**][columns] rule.

[columns]: https://medium.com/@carlo.michaelis/the-80-120-column-soft-margin-rule-979526742197

## Installation of the Jupyter Notebook Extension

During a good part of the LAP practical classes, we will use the
Jupyter Notebook system as a support tool for solving exercises. Using
Jupyter Notebook facilitates the execution of code within VS Code
itself.

Start by installing `jupyter` on your computer:

- On Linux (Debian) or Windows in WSL:

```console
sudo apt install jupyter
```

- On MAC:

```console
brew install jupyter
```

Next, you should install the `ocaml` jupyter kernel:

```console
opam install jupyter
```

After this command runs successfully, you should associate the
installed kernel with the jupyter installation:

```console
ocaml-jupyter-opam-genspec
jupyter kernelspec install --name ocaml-jupyter "$(opam var share)/jupyter"
```

It is possible that the last command, `jupyter kernelspec install`,
requires super user privileges to run correctly. In that case, you
should use the `sudo` prefix:

```console
sudo jupyter kernelspec install --name ocaml-jupyter "$(opam var share)/jupyter"
```

Finally, you should install the `Jupyter` extension within VS
Code. Inside the notebook, you should be able to select the previously
installed OCaml kernel. If all these steps are successful, you should
be able to explore the [Jupyter Notebook for this first
week][kick-the-tires] of practical classes.

[kick-the-tires]: kick_the_tires.ipynb


