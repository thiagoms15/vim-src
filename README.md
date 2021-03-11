# Vim config files

## Setup environment

### 1 - Install pre-depedencies by `apt`

```
sudo apt install neovim
sudo apt install silversearcher-ag
sudo apt install ccls
curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
sudo apt-get install -y nodejs
```

### 1.1 Optional

```
sudo apt install bear
pip install cpplint
```

To generate compile_commands.json
```
$ bear make
```

More abotut .clang-format
```
https://clang.llvm.org/docs/ClangFormatStyleOptions.html
To disable for a line use `// clang-format off`
BasedOnStyle: Google # https://google.github.io/styleguide/cppguide.html
IndentPPDirectives: BeforeHash
```

## Configure Coc to use c++ with ccls

### 1 - Execute the following command:

```
:CocConfig
```

### 2 - Paste the following code:

```
{
    "languageserver": {
        "ccls": {
            "command": "ccls",
            "filetypes": [
                "c",
                "cpp",
                "objc",
                "objcpp"
            ],
            "rootPatterns": [
                ".ccls",
                "compile_commands.json",
                ".vim/",
                ".git/",
                ".hg/"
            ],
            "initializationOptions": {
                "cache": {
                    "directory": "/tmp/ccls"
                }
            }
        }
    }
}
```
