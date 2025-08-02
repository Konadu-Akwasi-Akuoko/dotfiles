# My Neovim Configuration

A comprehensive and feature-rich Neovim setup optimized for efficient development. This configuration uses Lazy.nvim as a plugin manager and is fully written in Lua.

![nvim config picture](./assets/superFastNvim.png)

## Features

- Modern, fast, and minimal UI with statusline, icons, and file explorer
- Full LSP (Language Server Protocol) integration for code intelligence
- Advanced code completion with snippets and GitHub Copilot support
- Git integration with signs, blame, and lazygit
- Powerful fuzzy search with FZF
- Treesitter for better syntax highlighting
- Code formatting with Conform.nvim
- Terminal integration and a complete development environment
- Beautiful colorschemes (Catppuccin, Tokyo Night)
- Avante.nvim AI assistance with Copilot integration

## Plugin List

This configuration includes the following plugins:

### Core Plugins & System Integration

- **[lazy.nvim](https://github.com/folke/lazy.nvim)** - Plugin manager
- **[plenary.nvim](https://github.com/nvim-lua/plenary.nvim)** - Common utilities library required by many plugins
- **[vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)** - Seamless navigation between Neovim splits and Tmux panes

### Language Server Protocol (LSP) & Development Tools

- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)** - LSP configuration with custom setups for TypeScript, JavaScript, Vue, and Biome
- **[mason.nvim](https://github.com/mason-org/mason.nvim)** - Package manager for LSP servers, DAP servers, linters, and formatters
- **[mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)** - Bridge between mason.nvim and nvim-lspconfig
- **[mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim)** - Automatically install LSP servers and tools
- **[lazydev.nvim](https://github.com/folke/lazydev.nvim)** - Lua development support
- **[nvim-lsp-file-operations](https://github.com/antosha417/nvim-lsp-file-operations)** - LSP file operations support

### Syntax Highlighting & Parsing

- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** - Advanced syntax highlighting with extensive language support
- **[nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)** - Auto close/rename HTML tags using treesitter
- **[nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring)** - Context-aware commenting

### User Interface & Visual Enhancements

- **[snacks.nvim](https://github.com/folke/snacks.nvim)** - Collection of UI enhancements (dashboard, terminal, statuscolumn, scroll, etc.)
- **[catppuccin](https://github.com/catppuccin/nvim)** - Mocha colorscheme with custom highlights
- **[tokyonight.nvim](https://github.com/folke/tokyonight.nvim)** - Tokyo Night Moon colorscheme (active)
- **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)** - Customizable status line
- **[nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)** - File explorer with git integration
- **[nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)** - File type icons
- **[which-key.nvim](https://github.com/folke/which-key.nvim)** - Keybinding hints and documentation
- **[trouble.nvim](https://github.com/folke/trouble.nvim)** - Pretty diagnostics and quickfix list
- **[colorful-winsep.nvim](https://github.com/nvim-zh/colorful-winsep.nvim)** - Colorful window separators
- **[dressing.nvim](https://github.com/stevearc/dressing.nvim)** - Better UI elements for inputs and selections

### Code Completion & AI Integration

- **[blink.cmp](https://github.com/saghen/blink.cmp)** - Fast completion engine with Rust fuzzy matching
- **[friendly-snippets](https://github.com/rafamadriz/friendly-snippets)** - Collection of snippets for blink.cmp
- **[blink-cmp-copilot](https://github.com/giuxtaposition/blink-cmp-copilot)** - GitHub Copilot integration for blink.cmp
- **[blink-cmp-avante](https://github.com/Kaiser-Yang/blink-cmp-avante)** - Avante integration for blink.cmp
- **[copilot.lua](https://github.com/zbirenbaum/copilot.lua)** - GitHub Copilot integration with custom keymaps
- **[avante.nvim](https://github.com/yetone/avante.nvim)** - AI code assistance with Copilot integration

### Avante Enhanced Plugins

- **[render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim)** - Markdown rendering for better chat buffer display
- **[img-clip.nvim](https://github.com/HakonHarnes/img-clip.nvim)** - Image clipboard support for vision models

### Code Editing & Navigation

- **[conform.nvim](https://github.com/stevearc/conform.nvim)** - Code formatting with Prettier and Stylua support
- **[nvim-autopairs](https://github.com/windwp/nvim-autopairs)** - Auto brackets pairing with treesitter integration
- **[Comment.nvim](https://github.com/numToStr/Comment.nvim)** - Smart commenting with context awareness
- **[hop.nvim](https://github.com/smoka7/hop.nvim)** - EasyMotion-like navigation for quick jumps

### Git Integration

- **[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)** - Git integration with blame and change indicators
- **Lazygit integration** (via snacks.nvim) - Terminal UI for git operations

### File Management & Search

- **[fzf-lua](https://github.com/ibhagwan/fzf-lua)** - Fuzzy finder with bat and delta integration
- **[nvim-spectre](https://github.com/nvim-pack/nvim-spectre)** - Advanced search and replace with ripgrep

## External Dependencies

This configuration relies on several external tools that need to be installed on your system:

### Essential Core Dependencies

1. **Neovim >= 0.9.0** - The editor itself
   ```bash
   brew install neovim
   ```

2. **Git** - For plugin management and git integration
   ```bash
   brew install git
   ```

3. **Node.js and npm** - Required for LSP servers, Copilot, and JavaScript/TypeScript tooling
   ```bash
   # Install Node Version Manager for better version management
   brew install nvm
   # Then follow nvm instructions to install latest Node.js
   nvm install node
   ```

### Search and File Operations

4. **Ripgrep (rg)** - Fast searching used by fzf-lua, nvim-spectre, and other plugins
   ```bash
   brew install ripgrep
   ```

5. **fd** - Fast file finding for fzf-lua
   ```bash
   brew install fd
   ```

6. **fzf** - Fuzzy finder (required by fzf-lua)
   ```bash
   brew install fzf
   ```

### File Preview and Diff Tools

7. **Bat** - Better file previews in fzf-lua and terminal
   ```bash
   brew install bat
   ```

8. **Git Delta** - Enhanced diff display for fzf-lua code actions
   ```bash
   brew install git-delta
   ```

### Text Processing and Replacement

9. **GNU sed** - Better text replacement for nvim-spectre (macOS default sed has limitations)
   ```bash
   brew install gnu-sed
   ```

### Git Integration

10. **Lazygit** - Terminal UI for git operations (integrated via snacks.nvim)
    ```bash
    brew install lazygit
    ```

### Syntax Highlighting and Parsing

11. **Tree-sitter CLI** - For treesitter grammar compilation and updates
    ```bash
    brew install tree-sitter
    ```

### Code Formatting and Linting Tools

These tools are automatically installed by Mason, but you can install them system-wide if preferred:

12. **Prettier** - JavaScript/TypeScript/CSS/HTML formatting
    ```bash
    npm install -g prettier
    # Or let Mason handle it automatically
    ```

13. **Stylua** - Lua code formatting
    ```bash
    cargo install stylua
    # Or let Mason handle it automatically
    ```

14. **ESLint** - JavaScript/TypeScript linting
    ```bash
    npm install -g eslint
    # Or let Mason handle it automatically
    ```

### Programming Language Support

15. **Rust and Cargo** - Required for blink.cmp compilation and some plugins
    ```bash
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    source ~/.cargo/env
    ```

16. **Python 3** - Required for some LSP servers and tools
    ```bash
    brew install python3
    ```

### Font Support

17. **Nerd Fonts** - Required for proper icon display throughout the interface
    ```bash
    brew tap homebrew/cask-fonts
    brew install --cask font-hack-nerd-font
    # Or choose your preferred Nerd Font variant
    ```

### Optional Dependencies

18. **Tmux** - For vim-tmux-navigator integration (if you use tmux)
    ```bash
    brew install tmux
    ```

19. **GitHub CLI** - Enhanced GitHub integration with Copilot
    ```bash
    brew install gh
    # Then authenticate: gh auth login
    ```

### Language-Specific Tools (Auto-installed by Mason)

The following LSP servers and tools are automatically installed by Mason when you first open relevant files:

- **TypeScript Language Server (ts_ls)**
- **Vue Language Server (vue_ls)**
- **VTSLS** (Enhanced TypeScript server)
- **Biome** - Fast linter/formatter for web projects
- **HTML Language Server**
- **CSS Language Server**
- **Tailwind CSS Language Server**
- **Emmet Language Server**
- **Lua Language Server (lua_ls)**
- **Marksman** - Markdown language server

### Complete Installation Script

Here's a complete script to install all dependencies at once:

```bash
#!/bin/bash
# Core dependencies
brew install neovim git nvm ripgrep fd fzf bat git-delta gnu-sed lazygit tree-sitter python3

# Nerd Font
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

# Rust for blink.cmp
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.cargo/env

# Optional: Tmux and GitHub CLI
brew install tmux gh

# Node.js via nvm (run after installing nvm)
nvm install node
nvm use node

echo "All dependencies installed! Run 'gh auth login' to authenticate GitHub Copilot."
```

## Installation

1. Make sure you have all the dependencies installed.
2. Clone this repository to your Neovim configuration directory:

```bash
git clone https://github.com/Konadu-Akwasi-Akuoko/dotfiles.git ~/.config/nvim
```

3. Start Neovim, and Lazy.nvim will automatically install all the plugins:

```bash
nvim
```

## Customization

- Edit files in `~/.config/nvim/lua/akwasi/core/` to change core settings
- Edit files in `~/.config/nvim/lua/akwasi/plugins/` to modify plugin configurations
- Add new plugins by creating files in the plugins directory

## Key Bindings

For key bindings, use the Which-Key plugin by pressing `<Space>` to see available commands.
