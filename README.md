# Lily

Lily is a lightweight CLI tool based on PowerShell.
You do not need to install any special software to use the basic functions of PowerShell.

Also, if you can do simple programming, Lily can be a more powerful tool.

[日本語版 README](https://github.com/atsuyaide/lily/blob/main/README-ja.md)

**Requirements**.

Windows PC running PowerShell

## Setup

Setting up Lily is very easy.
Simply download this repository and run `setup.ps1`.

1.  Download all source [files](https://github.com/atsuyaide/lily/archive/refs/heads/main.zip) and extract the Zip file.
2.  Run `setup.ps1` in the project folder.
    1. If you are using File Explorer, select the file and right-click.
    2. Click `Run with PowerShell`.
3.  `Lily.lnk` will be created in the same folder as `setup.ps1`.

`Lily.lnk` is a shortcut to start Lily, and you can double-click it to start Lily.

Once Lily is launched, type `google` and run it.
Google search page can now be opened in Microsoft Edge

As you can see, Lily can easily open a specific web page or folder with a command.
You can also change the web browser used and easily add more web pages to be opened by rewriting the configuration file.

You can also type `manual` to get a list and description of available features.

## Lily's internal structure

This section describes the internal structure of Lily.

Lily is created by loading `main.ps1` into PowerShell.
The following section describes the environment variables and configuration files that are referenced inside `main.ps1`.
Understanding this section will allow you to customize Lily in a flexible way.

### Environment Variables

| Variable Name       | Description                                                                |
| :------------------ | :------------------------------------------------------------------------- |
| $Env:\_ROOT         | the folder containing `main.ps1`                                           |
| $Env:\_SRC          | Lily The location where executable commands are saved                      |
| $Env:\_VERSION      | The version of Lily                                                        |
| $Env:HOME           | Home directory. Configuration files are located here                       |
| $Env:InitDir        | Initial directory when Lily is started. The default is `$Env:USERPROFILE`. |
| $Env:DefaultBrowser | Browser EXE file path. Default is Microsoft Edge.                          |

### Configuration File

| File Name      | Description                                              |
| :------------- | :------------------------------------------------------- |
| `.lilyrc`      | configuration file loaded at startup (PowerShell syntax) |
| `alias.txt`    | alias file to be loaded at startup                       |
| `bookmark.txt` | list of pages to open with the `binit` command           |

`.lilyrc` and `alias.txt` are read at startup under `$Env:_ROOT` -> `$Env:USERPROFILE`.
`bookmark.txt` reads only one of them, with priority `$Env:USEPROFILE` > `$Env:_ROOT`.

### Commands and aliases

Lily provides various functions (e.g. `manual`, `google`, `lily`, ...) in addition to the default PowerShell commands.
These Lily-specific features can be classified into commands and aliases, and the `manual` command displays a list of commands and aliases separately.

| Type    | Description                                                                                   |
| :------ | :-------------------------------------------------------------------------------------------- |
| Command | The file is actually a `.ps1` file. It can be called by placing a `.ps1` file in `$Env:_SRC`. |
| Alias   | The actual file is a macro setting for doskey. It can be called by loading `alias.txt`.       |

If you want to reload the configuration file, you can do so with the following command.

- `alias.txt` : `ainit`.
- `bookmark.txt` : `binit`.
- `.lilyrc` : `cinit`
- All: `lily reload` : `cinit`

## Tutorial

Lily can be customized flexibly by editing environment variables and configuration files.

First, run `lily init` as a preliminary step.
You will be asked if you want to save the files, so unless you want to overwrite them, just press Enter to complete the process.

### Adding startup settings

Lily, like many shells, can be started by placing `.*rc` in your home directory and it will be automatically loaded at startup.

For example, in `$Env:HOME\.lilyrc`, add

```PowerShell
$Env:InitDir="$Env:USERPROFILE\Desktop"
$Env:DefaultBrowser="C:\path\to\Chrome.exe" # NOTE: Specify the path to the Chrome.exe
```

the following changes will occur.

- The initial directory at startup is now the Desktop
- Default browser is now Chrome

Please restart `cinit` or Lily to make sure the initial directory has changed.

### Adding features

There are two ways to add functions: register a command or register an alias.

Either of these can be easily invoked from Lily, but there are differences between them.
Please choose the appropriate method according to the function you want to realize.

|         |               Easiness               |     Arguments      |      Pipeline      | Complex processing |
| :------ | :----------------------------------: | :----------------: | :----------------: | :----------------: |
| Command |          :heavy_check_mark:          | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |
| Alias   | :heavy_check_mark::heavy_check_mark: | :heavy_check_mark: |                    |                    |

As an example, let's add a command to open GitHub with `github` in your browser.

**If you use Command**.

Add `github.ps1` to `$Env:_ROOT\src`.
The contents of `github.ps1` is as follows.

```PowerShell
<#
    .SYNOPSIS
      Open Github page
#>
bopen "https://github.com/"
```

The first four lines are a description of the command, `Get-Help` compatible [help comment](https://learn.microsoft.com/en-us/powershell/scripting/developer/help/examples-of-comment- based-help).
If `SYNOPSIS` is listed, it is automatically read when the `manual` command is executed.

```PowerShell
>> manual
==== Commands ====
...
github
 Open Github page
...
```

> **Note**.
> Commands without SYNOPSIS will not appear in the `manual` list.

**If you use Alias**

Add the following to `$Env:HOME\alias.txt` , then run `ainit` or restart Lily.

```text
github=bopen "https://github.com/";#=# Open GitHub page
```

`;#=# ` The text after is the command description, which is automatically read by the `manual` command if it is included.

```PowerShell
>> manual
...
==== Aliases ====
...
github
 Open Github page
...
```

> **Note**.
> Uncommented aliases do not appear in the `manual` list.

### Enable other software (Git, Python, ...) other software (Git, Python, ...)

This is a way to add more advanced features.
You will need to install other software depending on what you want to do, but if you enable Python or other software in Lily, you will be able to expand the range of what is possible.

**Enabling Python**.

Here is an example of how to set up Lily to use Miniconda (or Anaconda).
First, install Miniconda.
You can install it anywhere.

Miniconda provides a hook file for PowerShell!
Set it up to load into `.lilyrc`.

If you have installed Miniconda in `$Env:USERPROFILE`, here is the configuration.

```PowerShell
. "$Env:USERPROFILE\miniconda3\shell\condabin\conda-hook.ps1"
conda activate "$Env:USERPROFILE\miniconda3"
```

After restarting `cinit` or Lily, Python and `conda` commands will be available.

**git, grep, awk, etc. will be available**.

Here we will use the help of [Git for Windows](https://gitforwindows.org/).
First, complete the installation.
You can install it anywhere.

If you have Git for Windows installed in `C:\Program Files`, here is the configuration.

```PowerShell
$Env:PATH="C:\Program Files\Git\bin;C:\Program Files\Git\usr\bin;" + $Env:PATH
```

Restarting `cinit` or Lily will make the commands that come standard with Git for Windows available.
