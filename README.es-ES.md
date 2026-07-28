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

<h3>Plugins de utilidad simples para nvim 🏡🧩</h3>

</div>

homegrown.nvim es una colección de plugins modulares de Neovim y comandos de utilidad extraídos de [nvim2k](https://github.com/2kabhishek/nvim2k) que reemplazan funcionalidades deseadas de plugins conocidos.

## ✨ Características

- **Navegación por corchetes (`bracket_nav`)**: Mapeos nativos rápidos (`[d`, `]b`, `[x`, etc.) para diagnósticos, quickfix, buffers, ventanas, marcadores de conflicto y líneas en blanco. _(Reemplaza a [mini.bracketed](https://github.com/echasnovski/mini.bracketed))_
- **Resaltador de colores (`highlighter`)**: Un resaltador de texto automático y ligero para códigos de color Hex/RGB/RGBA/HSL/HSLA. _(Reemplaza a [ccc.nvim](https://github.com/uga-rosa/ccc.nvim))_
- **Utilidades de portapapeles (`copy`)**: Comandos limpios para copiar rutas relativas/absolutas, números de línea, nombres de archivo y URLs de repositorios de GitHub/GitLab. _(Reemplaza a [gitlinker.nvim](https://github.com/ruifm/gitlinker.nvim))_
- **Vista previa de Markdown (`md_preview`)**: Vista previa con sincronización en vivo basada en el navegador para buffers de markdown sin dependencias pesadas. _(Reemplaza a [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim))_
- **Autopairs inteligentes (`pairs`)**: Autocompletado y eliminación automática de corchetes, comillas y etiquetas HTML sin dependencias. _(Reemplaza a [mini.pairs](https://github.com/echasnovski/mini.pairs) + [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag))_
- **Buscar y reemplazar (`replace`)**: Búsqueda y reemplazo en todo el proyecto a través de ripgrep y la lista quickfix. _(Reemplaza a [nvim-spectre](https://github.com/nvim-pack/nvim-spectre))_
- **Ejecutor asíncrono (`runner`)**: Ejecutor rápido que ejecuta selecciones visuales o buffers completos en python, ruby, node, typescript, go, etc. _(Reemplaza a [sniprun](https://github.com/michaelb/sniprun))_
- **Diseños de terminal (`terminal`)**: Atajos para alternar buffers de terminal divididos, flotantes y en pestañas impulsados por `snacks.nvim`. _(Reemplaza a [termim](https://github.com/2kabhishek/termim))_
- **Integración de divisiones Vim/Tmux (`tmux`)**: Navegación fluida entre paneles del editor divididos y ventanas de Tmux. _(Reemplaza a [navigator.nvim](https://github.com/numToStr/Navigator.nvim))_
- **Comandos de navegación, Ranger y Git (`dir`)**: Cambiador de directorio RootDir del proyecto, ventana flotante de Ranger Picker y ayudante de Git en segundo plano basado en shell. _(Reemplazo ligero para gestores de archivos/árboles pesados)_
- **Auto-mosaico dinámico (`tiling`)**: Divide ventanas dinámicamente de forma horizontal o vertical dependiendo de la relación de aspecto de la ventana enfocada al abrir un archivo. _(Reemplazo ligero para gestores de diseño complejos)_

## ⚡ Configuración

### ⚙️ Requisitos

- Neovim >= 0.9.0
- [snacks.nvim](https://github.com/folke/snacks.nvim) (opcional, para los módulos `terminal` y `dir`)
- [ripgrep](https://github.com/BurntSushi/ripgrep) (para el módulo `replace`)
- [ranger](https://github.com/ranger/ranger) (opcional, para `:RangerPicker` en el módulo `dir`)

### 💻 Instalación

Instala homegrown.nvim usando tu gestor de paquetes preferido (por ejemplo, [lazy.nvim](https://github.com/folke/lazy.nvim)) y configúralo con las opciones deseadas:

```lua
{
    "2KAbhishek/homegrown.nvim",
    opts = {
        -- Pasa un booleano para habilitar un módulo con opciones predeterminadas
        highlighter = true,  -- Habilitar comando ColorHighlighterToggle
        copy = true,         -- Habilitar utilidades de copia al portapapeles (incluyendo CopyGitUrl)
        md_preview = true,   -- Habilitar comando MDPreview
        pairs = true,        -- Habilitar autopairs sin dependencias
        replace = true,      -- Habilitar búsqueda y reemplazo en el proyecto
        runner = true,       -- Habilitar comando ejecutor de código asíncrono
        terminal = true,     -- Habilitar comandos de terminal basados en Snacks (requiere snacks.nvim)
        tmux = true,         -- Habilitar navegación fluida vim/tmux
        dir = true,          -- Habilitar RootDir, RangerPicker y comandos de Git en segundo plano

        -- O pasa una tabla para personalizar opciones de configuración específicas
        bracket_nav = {
            enabled = true,
            blank_lines = false, -- Deshabilitar mapeos [Space / ]Space
        },
        tiling = {
            enabled = true,
            split_ratio = 1.8,   -- Sobrescribir la relación de división predeterminada de 2.0
        },
        runner = {
            enabled = true,
            interpreters = {
                rust = "cargo run", -- Agregar soporte para ejecución de código Rust
            }
        },
        pairs = {
            enabled = true,
            tag_filetypes = {
                xml = true, -- Habilitar cierre de etiquetas en archivos XML
            }
        }
    }
}
```

O instálalo y carga los módulos individuales manualmente:

```lua
-- Inicializar solo los autopairs
require("homegrown.pairs").setup()

-- Inicializar solo el ejecutor de código
require("homegrown.runner").setup()
```

## 🚀 Uso

### 1. Navegación por corchetes (`bracket_nav`)

- `[d` / `]d` : Diagnóstico Anterior/Siguiente
- `[q` / `]q` : Quickfix Anterior/Siguiente
- `[Q` / `]Q` : Primer/Último elemento de Quickfix
- `[b` / `]b` : Buffer Anterior/Siguiente
- `[B` / `]B` : Primer/Último Buffer
- `[w` / `]w` : Ventana Anterior/Siguiente
- `[j` / `]j` : Salto Anterior/Siguiente (changelist)
- `[x` / `]x` : Marcador de conflicto de Git Anterior/Siguiente (`<<<<<<<`, `=======`, `>>>>>>>`)
- `[<space>` / `]<space>` : Insertar línea en blanco arriba/abajo sin mover el cursor

### 2. Resaltador de colores (`highlighter`)

- Ejecuta `:ColorHighlighterToggle` para habilitar/deshabilitar.
- Ajusta automáticamente el color de primer plano del texto para el contraste. Omite buffers grandes.

### 3. Utilidades de copia al portapapeles (`copy`)

- `:CopyGitUrl` - Copiar URL de GitHub de las líneas/archivo al portapapeles (soporta rangos de líneas visuales)
- `:CopyRelativePath` / `:CopyAbsolutePath` - Copiar ruta del archivo al portapapeles
- `:CopyRelativePathWithLine` / `:CopyAbsolutePathWithLine` - Copiar ruta del archivo con el número de línea actual
- `:CopyFileName` - Copiar nombre del archivo actual al portapapeles

### 4. Vista previa de Markdown (`md_preview`)

- Ejecuta `:MDPreview` para generar un archivo HTML temporal y lanzar la vista previa.

### 5. Autopairs (`pairs`)

- Cierra automáticamente corchetes `()`, `[]`, `{}` y comillas `""`, `''`, ` `.
- Cierra automáticamente etiquetas HTML/XML en tipos de archivos compatibles (`html`, `vue`, `svelte`, `react`, etc.).
- Retroceso inteligente: borrar un corchete de apertura borra su pareja de cierre si está vacío.

### 6. Buscar y reemplazar (`replace`)

- Ejecuta `:Replace` o `:Replace <patrón>`.

### 7. Ejecutor de código (`runner`)

- Ejecuta `:Runner` para ejecutar la selección visual o el buffer.
- Soporta Python, Ruby, Lua, Node (JavaScript), ts-node (TypeScript), Go, Bash, Elixir y Java.

### 8. Envoltorios de terminal (`terminal`)

- `:Fterm` : Terminal flotante
- `:Sterm` : Terminal dividida (abajo)
- `:Vterm` : Terminal dividida verticalmente (derecha)
- `:Tterm` : Terminal en el buffer actual

### 9. Navegación de divisiones Tmux (`tmux`)

- Navega por divisiones/paneles usando `<C-h>`, `<C-j>`, `<C-k>`, `<C-l>`.

### 10. Comandos de navegación, Ranger y Git (`dir`)

- `:RootDir` - Cambiar el directorio local a la raíz del proyecto/Git
- `:RangerPicker` - Ventana flotante de selección de archivos Ranger (requiere `ranger` y `snacks.nvim`)
- `:Git <args>` - Ejecutar comando git en segundo plano y notificar el resultado

### 11. Auto-mosaico dinámico (`tiling`)

Divide la ventana actual dinámicamente en la dirección óptima basada en su relación de aspecto.

- `:AutoTile <archivo>` - Dividir ventana actual dinámicamente y abrir `<archivo>` (división vertical si la ventana es ancha, división horizontal si es alta)
- `:AutoTile` - Dividir el buffer actual dinámicamente en la dirección óptima (vertical si es ancho, horizontal si es alto)

## 🏗️ ¿Qué sigue?

Planeando agregar más plugins de ayuda, una integración de diagnósticos/LSP más limpia y opciones de personalización modular.

### ✅ Pendientes

- [x] Extraer componentes personalizados de `nvim2k`
- [x] Construir cargador modular seleccionable
- [ ] Agregar más parámetros de configuración a los módulos individuales

## 🧑‍💻 Detrás del código

### 🌈 Inspiración

homegrown.nvim nació de la necesidad de compartir configuraciones privadas, utilidades y comandos de ayuda con otros sin obligarlos a adoptar toda una configuración de editor preconfigurada.

### 💡 Desafíos/Aprendizajes

- Refactorizar mapeos de teclas y auto-comandos monolíticos para que estén totalmente encapsulados dentro de los límites de los módulos de plugins estándar.
- Desacoplar las configuraciones del usuario de las utilidades compartidas para mantener las dependencias al mínimo.

### 🧰 Herramientas

- [dots2k](https://github.com/2kabhishek/dots2k) — Entorno de Desarrollo
- [nvim2k](https://github.com/2kabhishek/nvim2k) — Editor Personalizado

### 🔍 Más Información

- [co-author.nvim](https://github.com/2kabhishek/co-author.nvim) — Herramienta de automatización de coautores de commits de Git
- [exercism.nvim](https://github.com/2kabhishek/exercism.nvim) — Cliente de ejercicios de programación de Exercism.org
- [markit.nvim](https://github.com/2kabhishek/markit.nvim) — Gestor de marcas de Neovim visual, rico e interactivo
- [nerdy.nvim](https://github.com/2kabhishek/nerdy.nvim) — Buscar e insertar glifos de Nerd Font directamente dentro de Neovim
- [octohub.nvim](https://github.com/2kabhishek/octohub.nvim) — Explorador y gestor de repositorios de GitHub
- [pickme.nvim](https://github.com/2kabhishek/pickme.nvim) — Envoltorio de interfaz unificada para selectores de Telescope, FZF-Lua y Snacks
- [seeker.nvim](https://github.com/2kabhishek/seeker.nvim) — Selector progresivo de archivos y grep
- [tdo.nvim](https://github.com/2kabhishek/tdo.nvim) — Gestor de notas y tareas (todo) minimalista
- [template.nvim](https://github.com/2kabhishek/template.nvim) — Plantilla de inicio boilerplate para plugins de Neovim
- [termim.nvim](https://github.com/2kabhishek/termim.nvim) — Gestor de terminales flotantes y divididos
- [utils.nvim](https://github.com/2kabhishek/utils.nvim) — Utilidades Lua compartidas para plugins de Neovim

<hr>

<div align="center">

<strong>⭐ presiona el botón de estrella si encontraste esto útil ⭐</strong><br>

<a href="https://github.com/2KAbhishek/homegrown.nvim">Fuente</a>
| <a href="https://2kabhishek.github.io/blog" target="_blank">Blog </a>
| <a href="https://twitter.com/2kabhishek" target="_blank">Twitter </a>
| <a href="https://linkedin.com/in/2kabhishek" target="_blank">LinkedIn </a>
| <a href="https://2kabhishek.github.io/links" target="_blank">Más Enlaces </a>
| <a href="https://2kabhishek.github.io/projects" target="_blank">Otros Proyectos </a>

</div>
