# Vim config files

## 1 - Install pre-depedencies by `apt`

```
sudo apt install neovim
sudo apt install silversearcher-ag
sudo apt install ccls
```

## Config Coc to use c++

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
