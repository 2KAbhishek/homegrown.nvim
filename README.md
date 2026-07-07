<div align = "center">

<h1><a href="https://github.com/2kabhishek/homegrown.nvim">homegrown.nvim</a></h1>

<a href="https://github.com/2KAbhishek/homegrown.nvim/blob/main/LICENSE">
<img alt="License" src="https://img.shields.io/github/license/2kabhishek/homegrown.nvim?style=flat&color=eee&label="> </a>

<a href="https://github.com/2KAbhishek/homegrown.nvim/graphs/contributors">
<img alt="People" src="https://img.shields.io/github/contributors/2kabhishek/homegrown.nvim?style=flat&color=ffaaf2&label=People"> </a>

<a href="https://github.com/2KAbhishek/homegrown.nvim/stargazers">
<img alt="Stars" src="https://img.shields.io/github/stars/2kabhishek/homegrown.nvim?style=flat&color=98c379&label=Stars"></a>

<a href="https://github.com/2KAbhishek/homegrown.nvim/network/members">
<img alt="Forks" src="https://img.shields.io/github/forks/2kabhishek/homegrown.nvim?style=flat&color=66a8e0&label=Forks"> </a>

<a href="https://github.com/2KAbhishek/homegrown.nvim/watchers">
<img alt="Watches" src="https://img.shields.io/github/watchers/2kabhishek/homegrown.nvim?style=flat&color=f5d08b&label=Watches"> </a>

<a href="https://github.com/2KAbhishek/homegrown.nvim/pulse">
<img alt="Last Updated" src="https://img.shields.io/github/last-commit/2kabhishek/homegrown.nvim?style=flat&color=e06c75&label="> </a>

<h3>Modular, plug-and-play custom Neovim configurations and plugins 🎇🎉</h3>

<figure>
  <img src="docs/images/screenshot.png" alt="homegrown.nvim in action">
  <br/>
  <figcaption>homegrown.nvim in action</figcaption>
</figure>

</div>

homegrown.nvim is a collection of modular Neovim plugins and utility commands extracted from [nvim2k](https://github.com/2kabhishek/nvim2k) that replaces desired functionalities from well known plugins.

## ✨ Features

- **Bracket Navigation (`bracket_nav`)**: Quick native mappings (`[d`, `]b`, `[x`, etc.) for diagnostics, quickfix, buffers, windows, conflict markers, and blank lines. _(Replaces [mini.bracketed](https://github.com/echasnovski/mini.bracketed))_
- **Color Highlighter (`highlighter`)**: A lightweight, automatic text highlighter for Hex/RGB/RGBA/HSL/HSLA color codes. _(Replaces [ccc.nvim](https://github.com/uga-rosa/ccc.nvim))_
- **Clipboard Utilities (`copy`)**: Clean commands for copying relative/absolute paths, line numbers, file names, and GitHub/GitLab repository URLs. _(Replaces [gitlinker.nvim](https://github.com/ruifm/gitlinker.nvim))_
- **Markdown Preview (`md_preview`)**: browser-based live-sync preview for markdown buffers without heavy dependencies. _(Replaces [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim))_
- **Smart Autopairs (`pairs`)**: Zero-dependency automatic completion and deletion for brackets, quotes, and HTML tags. _(Replaces [mini.pairs](https://github.com/echasnovski/mini.pairs) + [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag))_
- **Search & Replace (`replace`)**: Project-wide search and replace via ripgrep and the quickfix list. _(Replaces [nvim-spectre](https://github.com/nvim-pack/nvim-spectre))_
- **Asynchronous Runner (`runner`)**: Quick runner that executes visual selections or complete buffers in python, ruby, node, typescript, go, etc. _(Replaces [sniprun](https://github.com/michaelb/sniprun))_
- **Terminal Layouts (`terminal`)**: Shortcuts to toggle split, floating, and tabbed terminal buffers powered by `snacks.nvim`. _(Replaces [termim](https://github.com/2kabhishek/termim))_
- **Vim/Tmux split integration (`tmux`)**: Seamless navigation across split editor panes and Tmux windows. _(Replaces [navigator.nvim](https://github.com/numToStr/Navigator.nvim))_
- **Navigation, Ranger, and Git commands (`dir`)**: Project RootDir directory swapper, Ranger Picker floating window, and shell-based background Git helper. _(Lightweight replacement for heavy file managers/trees)_
- **Dynamic Autotiling (`tiling`)**: Dynamically split windows horizontally or vertically depending on the focused window aspect ratio when opening a file. _(Lightweight replacement for complex layout managers)_



## ⚡ Setup

### ⚙️ Requirements

- Neovim >= 0.9.0
- [snacks.nvim](https://github.com/folke/snacks.nvim) (optional, for `terminal` and `dir` modules)
- [ripgrep](https://github.com/BurntSushi/ripgrep) (for `replace` module)
- [ranger](https://github.com/ranger/ranger) (optional, for `:RangerPicker` in `dir` module)

### 💻 Installation

Install homegrown.nvim using your preferred package manager (e.g. [lazy.nvim](https://github.com/folke/lazy.nvim)) and configure it with your desired options:

```lua
{
    "2KAbhishek/homegrown.nvim",
    opts = {
        bracket_nav = true,  -- Enable bracket navigation mappings
        highlighter = true,  -- Enable ColorHighlighterToggle command
        copy = true,         -- Enable clipboard copy utilities (including CopyGitUrl)
        md_preview = true,   -- Enable MDPreview command
        pairs = true,        -- Enable zero-dependency autopairs
        replace = true,      -- Enable project search & replace
        runner = true,       -- Enable async code runner command
        terminal = true,     -- Enable Snacks-based terminal commands (needs snacks.nvim)
        tmux = true,         -- Enable seamless vim/tmux navigation
        dir = true,          -- Enable RootDir, RangerPicker, and background Git commands
        tiling = true,       -- Enable dynamic i3/sway-style autotiling split manager
    }
}
```

Or install it and load individual modules manually:

```lua
-- Initialize only the autopairs
require("homegrown.pairs").setup()

-- Initialize only the code runner
require("homegrown.runner").setup()
```

## 🚀 Usage

### 1. Bracket Navigation (`bracket_nav`)

- `[d` / `]d` : Previous/Next Diagnostic
- `[q` / `]q` : Previous/Next Quickfix
- `[Q` / `]Q` : First/Last Quickfix item
- `[b` / `]b` : Previous/Next Buffer
- `[B` / `]B` : First/Last Buffer
- `[w` / `]w` : Previous/Next Window
- `[j` / `]j` : Previous/Next Jump (changelist)
- `[x` / `]x` : Previous/Next Git conflict marker (`<<<<<<<`, `=======`, `>>>>>>>`)
- `[<space>` / `]<space>` : Insert blank line above/below without moving the cursor

### 2. Color Highlighter (`highlighter`)

- Run `:ColorHighlighterToggle` to enable/disable.
- Automatically adjusts text foreground color for contrast. Skips large buffers.

### 3. Clipboard Copy utilities (`copy`)

- `:CopyGitUrl` - Copy lines/file GitHub URL to clipboard (supports visual line ranges)
- `:CopyRelativePath` / `:CopyAbsolutePath` - Copy file path to clipboard
- `:CopyRelativePathWithLine` / `:CopyAbsolutePathWithLine` - Copy file path with current line number
- `:CopyFileName` - Copy current file name to clipboard

### 4. Markdown Preview (`md_preview`)

- Run `:MDPreview` to generate a temp HTML file and launch the preview.

### 5. Autopairs (`pairs`)

- Automatically closes brackets `()`, `[]`, `{}` and quotes `""`, `''`, ` `.
- Automatically closes HTML/XML tags in supported filetypes (`html`, `vue`, `svelte`, `react`, etc.).
- Smart backspace: deleting an open bracket deletes its closing pair if empty.

### 6. Search & Replace (`replace`)

- Run `:Replace` or `:Replace <pattern>`.

### 7. Code Runner (`runner`)

- Run `:Runner` to execute visual selection or buffer.
- Supports Python, Ruby, Lua, Node (JavaScript), ts-node (TypeScript), Go, Bash, Elixir, and Java.

### 8. Terminal wrappers (`terminal`)

- `:Fterm` : Floating terminal
- `:Sterm` / `:STerm` : Split terminal (bottom/top)
- `:Vterm` / `:VTerm` : Vertical split terminal (right/left)
- `:Tterm` : Terminal in current buffer

### 9. Tmux Split Navigation (`tmux`)

- Navigate splits/panes using `<C-h>`, `<C-j>`, `<C-k>`, `<C-l>`.

### 10. Navigation, Ranger, and Git commands (`dir`)

- `:RootDir` - Change local directory to the project/Git root
- `:RangerPicker` - Floating Ranger file picker window (requires `ranger` and `snacks.nvim`)
- `:Git <args>` - Run background git command and notify output

### 11. Dynamic Autotiling (`tiling`)

Splits the current window dynamically in the optimal direction based on its aspect ratio.
- `:AutoTile <file>` - Split current window dynamically and open `<file>` (vertical split if the window is wide, horizontal split if it is tall)
- `:AutoTile` - Split the current buffer dynamically in the optimal direction (vertical if wide, horizontal if tall)

## 🏗️ What's Next

Planning to add more helper plugins, cleaner diagnostics/LSP integration, and modular customization options.

### ✅ To-Do

- [x] Extract custom components from `nvim2k`
- [x] Build pick-and-choose modular loader
- [ ] Add more configuration parameters to individual modules

## 🧑‍💻 Behind The Code

### 🌈 Inspiration

homegrown.nvim was inspired by the need to share private configurations, utilities, and helper commands with others without forcing them to adopt an entire pre-configured editor setup.

### 💡 Challenges/Learnings

- Refactoring monolithic keymaps and auto-commands to be fully encapsulated within standard plugin module boundaries.
- Decoupling user configurations from shared utilities to keep dependencies minimal.

### 🧰 Tooling

- [dots2k](https://github.com/2kabhishek/dots2k) — Dev Environment
- [nvim2k](https://github.com/2kabhishek/nvim2k) — Personalized Editor
- [sway2k](https://github.com/2kabhishek/sway2k) — Desktop Environment
- [qute2k](https://github.com/2kabhishek/qute2k) — Personalized Browser

### 🔍 More Info

- [shelly](https://github.com/2kabhishek/shelly) — Command line template
- [tiny-web](https://github.com/2kabhishek/tiny-web) — Web app template

<hr>

<div align="center">

<strong>⭐ hit the star button if you found this useful ⭐</strong><br>

<a href="https://github.com/2KAbhishek/homegrown.nvim">Source</a>
| <a href="https://2kabhishek.github.io/blog" target="_blank">Blog </a>
| <a href="https://twitter.com/2kabhishek" target="_blank">Twitter </a>
| <a href="https://linkedin.com/in/2kabhishek" target="_blank">LinkedIn </a>
| <a href="https://2kabhishek.github.io/links" target="_blank">More Links </a>
| <a href="https://2kabhishek.github.io/projects" target="_blank">Other Projects </a>

</div>
