Vim config files

sudo apt install neovim
sudo apt install silversearcher-ag
sudo apt install ccls
sudo apt install bear
pip install cpplint

To generate compile_commands.json
$ bear make

.clang-format
`
# https://clang.llvm.org/docs/ClangFormatStyleOptions.html
# To disable for a line use `// clang-format off`
BasedOnStyle: Google # https://google.github.io/styleguide/cppguide.html
IndentPPDirectives: BeforeHash
`

C++
:CocConfig

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
