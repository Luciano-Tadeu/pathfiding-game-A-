# Pathfinding & Energy Optimization: Human Intuition vs. the A\* Algorithm

An interactive game built in **Godot 4** that pits a human player against the **A\*** search algorithm in a 2D grid with weighted terrains, comparing three distance heuristics (Manhattan, Euclidean and Chebyshev).

[![Godot](https://img.shields.io/badge/Godot-4.3+-478CBF?logo=godotengine&logoColor=white)](https://godotengine.org/)
[![GDScript](https://img.shields.io/badge/GDScript-355570?logo=godotengine&logoColor=white)](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/index.html)
[![LaTeX](https://img.shields.io/badge/Report-LaTeX-008080?logo=latex&logoColor=white)](https://www.latex-project.org/)
[![Live Demo](https://img.shields.io/badge/Live%20Demo-Play%20Now-success)](https://luciano-tadeu.github.io/deploy-trabalho-ia/)

**[▶ Play it in your browser](https://luciano-tadeu.github.io/deploy-trabalho-ia/)**

<!-- TODO: add a screenshot or GIF of the gameplay here, e.g.:
![Gameplay preview](docs/gameplay.gif)
-->

> **Academic project** — Artificial Intelligence course, Computer Engineering, Federal University of Mato Grosso (UFMT), Brazil.
> Advisor: Dr. Gustavo Post Sabin.

---

## 📌 Overview

This project explores the classic **pathfinding** problem combined with **energy-cost optimization** on a 2D grid made of heterogeneous terrains.

The core idea is a direct comparison between **human intuition** and **algorithmic precision**. The player tries to trace the lowest-energy path across a grid containing different surface types (grass, hill, water and walls). Once the player finishes, the **A\*** algorithm computes the mathematically optimal route using three different distance heuristics, enabling a side-by-side analysis of the results.

The repository also includes a **complete academic report written in LaTeX**, formatted to the ABNT / FAENG UFMT standard, covering the theoretical background, methodology, implementation and analysis of results.

## ✨ Key Features

- **Interactive gameplay:** trace your own path through a weighted grid and see how efficient it really is.
- **A\* implementation from scratch** in GDScript, with a custom priority queue.
- **Three interchangeable heuristics:** Manhattan, Euclidean and Chebyshev.
- **Replay screens and run statistics:** compare the player's path against the optimal ones, with metrics collected for every execution.
- **Cross-platform:** precompiled builds for Windows and Linux, plus a web version.
- **Full technical report** documenting the methodology and results.

## 🛠️ Tech Stack

| Area | Technology |
| :--- | :--- |
| Game engine | [Godot Engine 4](https://godotengine.org/) |
| Language | GDScript |
| Documentation | [LaTeX](https://www.latex-project.org/) (abnTeX2 / FAENG UFMT template) |
| Deployment | GitHub Pages (Web export) |
| Version control | Git & GitHub |

## 👥 Team

| Name | Student ID (RGA) |
| :--- | :--- |
| **Carlos Daniel Santana Cunha** | *202421901003* |
| **Luciano Tadeu Simões Simplicio Junior** | *202421901044* |
| **Matheus Mesquita Yukishita** | *202421901048* |

---

## 🎮 Game Rules & Mechanics

The navigation environment is a **6x6 grid** in which every cell has a terrain type tied to a specific energy cost:

| Terrain | Description | Energy Cost |
| :--- | :--- | :---: |
| 🌿 **Grass** | Flat surface, easy to traverse | **1** |
| ⛰️ **Hill** | Elevation that requires more effort | **2** |
| 🌊 **Water** | Dense surface with slow movement | **3** |
| 🧱 **Wall** | Impassable obstacle | **$\infty$** |

### Player Controls

| Key | Action |
| :---: | :--- |
| **W** | Move up |
| **S** | Move down |
| **A** | Move left |
| **D** | Move right |

### A\* Algorithm & Heuristics

The intelligent agent computes the optimal route using the A\* algorithm, $f(n) = g(n) + h(n)$, configured with three heuristics for comparison:

1. **Manhattan:** $h(n) = |x_1 - x_2| + |y_1 - y_2|$
2. **Euclidean:** $h(n) = \sqrt{(x_1 - x_2)^2 + (y_1 - y_2)^2}$
3. **Chebyshev:** $h(n) = \max(|x_1 - x_2|, |y_1 - y_2|)$

---

## 📁 Project Structure

> Folder and file names are kept in Portuguese, exactly as they appear in the repository. English translations are given in the comments.

```text
grupo-ia/
├── godot/                      # Interactive project built with Godot Engine 4
│   ├── cenas/                  # Scenes (gameplay, replay screens, final screen, etc.)
│   ├── compilado/              # Precompiled game executables
│   │   ├── win/                # Windows desktop build
│   │   └── linux/              # Linux desktop build
│   ├── scripts/                # GDScript files with the application logic
│   │   ├── a_estrela.gd        # A* implementation and its 3 heuristics
│   │   ├── estado.gd           # Search state representation and heuristic computation
│   │   ├── ambiente.gd         # Map matrix loading and A* integration
│   │   ├── data_stats.gd       # Execution metrics and statistics collection
│   │   ├── game/               # Game mechanics, player navigation and replay control
│   │   └── utils/              # Helper data structures (e.g., priority queue)
│   ├── GameData.gd             # Singleton for global match statistics
│   └── project.godot           # Main Godot Engine configuration file
│
├── relatorio/                  # Technical / scientific report in LaTeX
│   ├── main.pdf                # Final report, already compiled to PDF
│   ├── main.tex                # Main LaTeX document
│   ├── references.bib          # Bibliography (BibTeX)
│   ├── faeng.cls               # Custom FAENG/UFMT LaTeX class
│   ├── figuras/                # Images and charts used in the report
│   └── sessoes/                # Report sections
│       ├── 1-introducao.tex    # Context, cost table and objectives
│       ├── 2-metodologia.tex   # Theoretical modeling, heuristics and implementation
│       ├── 3-resultados.tex    # Comparative analysis (Human vs. A*)
│       └── 4-conclusao.tex     # Final remarks and future work
│
└── README.md                   # Repository documentation
```

---

## 🚀 Getting Started

### 1. Running the Game

#### Option A: Play Online (no installation)
Play directly in your browser through GitHub Pages:
- **Live demo:** [https://luciano-tadeu.github.io/deploy-trabalho-ia/](https://luciano-tadeu.github.io/deploy-trabalho-ia/)

#### Option B: Precompiled Executables (no Godot required)
Ready-to-run builds are available in `godot/compilado/`:
- **Windows:** go to `godot/compilado/win/` and run the `.exe` file.
- **Linux:** go to `godot/compilado/linux/` and run the executable.

#### Option C: Run from Source with Godot
1. Download and install **Godot Engine** v4.3 or later from [godotengine.org](https://godotengine.org/).
2. Open Godot and click **Import**.
3. Browse to the `godot/` folder of this repository and select `project.godot`.
4. Once the project loads in the editor, press **F5** (or the Play button in the top-right corner) to run the game.

### 2. Building the Report (LaTeX)

#### Option A: Read the Precompiled PDF
The report is already compiled and ready to read at:
- `relatorio/main.pdf`

> Note: the report is written in Brazilian Portuguese.

#### Option B: Compile from Source

**Prerequisites**
- A LaTeX distribution (e.g., [TeX Live](https://www.tug.org/texlive/), [MiKTeX](https://miktex.org/) or [MacTeX](https://www.tug.org/mactex/)).
- An editor of your choice (e.g., **VS Code** with the *LaTeX Workshop* extension, **Texmaker**, or upload the contents of `relatorio/` to **Overleaf**).

**Steps (command line)**
1. Enter the report directory:
   ```bash
   cd relatorio
   ```
2. Compile with `latexmk` or `pdflatex`:
   ```bash
   latexmk -pdf main.tex
   ```
   *or*
   ```bash
   pdflatex main.tex
   bibtex main
   pdflatex main.tex
   pdflatex main.tex
   ```
3. The compiled file will be generated at `relatorio/main.pdf`.
