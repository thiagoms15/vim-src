# Neovim Configuration

A [LazyVim](https://lazyvim.org)-based Neovim configuration optimized for C++ development, with support for Go, Python, Lua, and more.

## Requirements

- **Neovim** >= 0.9.5 (nightly recommended)
- **Git**
- **Node.js** >= 18 (for LSP servers like ts_ls)
- **Python** >= 3.10 (for pyright, debugpy)
- **GCC/G++** (for C/C++ compilation)
- **GDB** (for C++ debugging)
- **Go** >= 1.18 (for gopls)
- **CMake** >= 3.15 (for cmake-language-server)

## Installation

### 1. Install LazyVim Starter

If you don't have an existing LazyVim setup:

```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.bak

# Clone LazyVim starter
git clone https://github.com/LazyVim/starter ~/.config/nvim

# Remove .git to use this config instead
rm -rf ~/.config/nvim/.git

# Copy this configuration files
# (Make sure to copy all lua/ and init.lua files from this repo)
```

### 2. Clone This Config

```bash
# Clone this repository to your nvim config directory
git clone https://github.com/your-repo/nvim-config.git ~/.config/nvim
```

### 3. Install Plugins

Open Neovim and let Lazy.nvim install all plugins:

```bash
nvim
```

Or from command line:

```bash
nvim --headless "+Lazy! sync" +qa
```

### 4. Install Language Servers & Debuggers

Open Mason to install tools:

```bash
nvim
:Mason
```

Install the following:

**Language Servers:**
- `clangd` - C/C++ LSP
- `cmake` - CMake LSP
- `gopls` - Go LSP
- `lua_ls` - Lua LSP
- `pyright` - Python LSP
- `ts_ls` - TypeScript LSP

**Debuggers:**
- `delve` - Go debugger
- (GDB should be installed on your system)

## Features

### Languages Supported
- **C/C++** - clangd, GDB debugger
- **Go** - gopls, delve debugger
- **Python** - pyright
- **Lua** - lua_ls with lazydev
- **TypeScript/JavaScript** - ts_ls
- **CMake** - cmake-language-server
- **Markdown** - render-markdown.nvim

### Key Plugins
- [LazyVim](https://lazyvim.org) - Neovim distribution
- [nvim-dap](https://github.com/mfussenegger/nvim-dap) - Debug Adapter Protocol
- [mason.nvim](https://github.com/williamboman/mason.nvim) - LSP/DAP installer
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Syntax highlighting
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder
- [blink.cmp](https://github.com/saghen/blink.cmp) - Completion engine
- [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) - Markdown rendering

### Keybindings

**General:**
- `<Space>` - Leader key
- `<leader>ff` - Find files (Telescope)
- `<leader>fg` - Grep files (Telescope)
- `<leader>fb` - Buffers (Telescope)

**DAP (Debug):**
- `<F5>` - Continue/Debug
- `<F10>` - Step Over
- `<F11>` - Step Into
- `<F12>` - Step Out
- `<leader>db` - Toggle Breakpoint
- `<leader>dr` - Open REPL

**Treesitter:**
- `<leader>vv` - Initiate selection
- `+` / `_` - Increase/Decrease selection
- `]f` / `[f` - Next/Previous function
- `]c` / `[c` - Next/Previous class

## Project Structure

```
nvim/
├── init.lua                 # Entry point
├── lazy-lock.json           # Locked plugin versions
├── lua/
│   ├── config/              # User configurations
│   │   ├── autocmds.lua
│   │   ├── functions.lua
│   │   ├── keymaps.lua
│   │   ├── lua_line.lua
│   │   ├── options.lua
│   │   └── telescope.lua
│   ├── core/                # Core LazyVim setup
│   │   ├── lazy.lua         # Plugin manager setup
│   │   └── lsp.lua          # LSP configuration
│   └── plugins/             # Plugin configurations
│       ├── blink.lua
│       ├── colorschemes.lua
│       ├── dap.lua
│       ├── icons.lua
│       ├── lazydev.lua
│       ├── markdown.lua
│       ├── mason.lua
│       ├── telescope.lua
│       ├── treesitter.lua
│       └── utils.lua
└── lsp/                     # LSP server configs
    ├── go
    └── lua_ls
```

## Troubleshooting

### Plugins not installing
```bash
# Clear cache and reinstall
nvim --headless "+Lazy! clean" "+Lazy! sync" +qa
```

### Mason not working
```bash
# Check Mason status
:Mason
```

### LSP not working
```bash
# Check LSP status
:LspInfo
```

### Treesitter not highlighting
```bash
# Reinstall parsers
:TSUpdate
```

## Updating

```bash
# Update plugins
:Lazy

# Update LazyVim itself
:Lazy sync
```
