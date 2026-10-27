# Pathfinding e Otimização de Energia:Uma Abordagem Interativa com o Algoritmo A*

> **Trabalho Acadêmico**  
> **Disciplina:** Inteligência Artificial  
> **Curso:** Engenharia de Computação — Universidade Federal de Mato Grosso (UFMT)  
> **Docente:** Dr. Gustavo Post Sabin  

---

## 📌 Apresentação do Repositório

Este repositório contém o código-fonte e a documentação do projeto prático desenvolvido para a disciplina de **Inteligência Artificial**. O trabalho explora o problema clássico de *pathfinding* (busca de caminhos) e otimização de custo de energia em um ambiente 2D com terrenos heterogêneos.

A proposta central do projeto é realizar um estudo comparativo entre a **intuição humana** e a **precisão algorítmica** do algoritmo **A* (A-Estrela)**. Para isso, foi implementado um jogo interativo em **Godot Engine 4**, onde o usuário tenta traçar o caminho de menor custo de energia através de um grid contendo diferentes tipos de superfície (grama, morro, água e obstáculos). Após a tentativa do jogador, o algoritmo A* calcula a rota matematicamente ótima utilizando três heurísticas de distância distintas (Manhattan, Euclidiana e Chebyshev), permitindo uma análise comparativa direta entre os desempenhos.

Além da aplicação interativa, o repositório conta com um **relatório acadêmico completo em LaTeX**, formatado segundo o padrão ABNT / FAENG UFMT, detalhando a fundamentação teórica, metodologia, implementação e análise de resultados.

---

## 👥 Integrantes do Grupo

| Nome Completo | RGA |
| :--- | :--- |
| **Carlos Daniel Santana Cunha** | *[Preencher RGA]* |
| **Luciano Tadeu Simões Simplicio Junior** | *202421901044* |
| **[Nome do 3º Integrante]** | *[Preencher RGA]* |

---

## 📁 Estrutura do Projeto

A organização dos diretórios do repositório está estruturada da seguinte forma:

```text
grupo-ia/
├── godot/                      # Projeto interativo desenvolvido na Godot Engine 4
│   ├── cenas/                  # Cenas da aplicação (Gameplay, Telas de Replay, Final, etc.)
│   ├── compilado/              # Executáveis já compilados do jogo
│   │   ├── win/                # Executável para Windows Desktop
│   │   └── linux/              # Executável para Linux Desktop
│   ├── scripts/                # Scripts em GDScript com a lógica da aplicação
│   │   ├── a_estrela.gd        # Implementação do Algoritmo A* e suas 3 heurísticas
│   │   ├── estado.gd           # Representação dos estados da busca e cálculo de heurísticas
│   │   ├── ambiente.gd         # Leitura da matriz do mapa e integração do A*
│   │   ├── data_stats.gd       # Coleta de métricas e estatísticas de execução
│   │   ├── game/               # Controle da mecânica do jogo e navegação do jogador/replay
│   │   └── utils/              # Estruturas auxiliares (ex: Fila de Prioridade)
│   ├── GameData.gd             # Singleton para armazenamento global de estatísticas da partida
│   └── project.godot           # Arquivo de configuração principal da Godot Engine
│
├── relatorio/                  # Relatório técnico/científico em LaTeX
│   ├── main.pdf                # Relatório final já compilado em PDF
│   ├── main.tex                # Arquivo principal do documento LaTeX
│   ├── references.bib          # Referências bibliográficas (BibTeX)
│   ├── faeng.cls               # Classe LaTeX personalizada da FAENG/UFMT
│   ├── figuras/                # Imagens e gráficos utilizados no relatório
│   └── sessoes/                # Seções textuais do relatório
│       ├── 1-introducao.tex    # Contextualização, tabela de custos e objetivos
│       ├── 2-metodologia.tex    # Modelagem teórica, heurísticas e implementação
│       ├── 3-resultados.tex     # Análise comparativa (Humano vs A*)
│       └── 4-conclusao.tex      # Considerações finais e trabalhos futuros
│
└── README.md                   # Documentação de apresentação do repositório
```

---

## 🎮 Regras e Mecânica do Jogo

O ambiente de navegação consiste em uma malha (*grid*) de 6x6 na qual cada célula possui um tipo de terreno associado a um custo de energia específico:

| Tipo de Terreno | Descrição | Custo de Energia |
| :--- | :--- | :---: |
| 🌿 **Grama** | Superfície plana e de fácil locomoção | **1** |
| ⛰️ **Morro** | Elevação que exige maior esforço | **2** |
| 🌊 **Água** | Superfície densa e de movimentação lenta | **3** |
| 🧱 **Parede** | Obstáculo intransponível | **$\infty$** |

### Algoritmo A* e Heurísticas Utilizadas
O agente inteligente calcula a rota ideal utilizando o algoritmo A* ($f(n) = g(n) + h(n)$) configurado com três abordagens heurísticas para comparação:
1. **Manhattan:** $h(n) = |x_1 - x_2| + |y_1 - y_2|$
2. **Euclidiana:** $h(n) = \sqrt{(x_1 - x_2)^2 + (y_1 - y_2)^2}$
3. **Chebyshev:** $h(n) = \max(|x_1 - x_2|, |y_1 - y_2|)$

---

## 🚀 Como Executar o Projeto

### 1. Executando o Jogo (Godot Engine)

#### Opção A: Executáveis Pré-compilados (Sem necessidade do Godot)
Caso prefira rodar diretamente sem instalar a Godot Engine, o projeto já possui os executáveis compilados na pasta `godot/compilado/`:
- **Windows:** Acesse `godot/compilado/win/` e execute o arquivo `.exe`.
- **Linux:** Acesse `godot/compilado/linux/` e execute o arquivo correspondente.

#### Opção B: Executando via Godot Engine (Código-Fonte)
1. Baixe e instale a **Godot Engine** v4.3 ou superior em [godotengine.org](https://godotengine.org/).
2. Abra o **Godot Engine**.
3. Clique no botão **Importar** (*Import*).
4. Navegue até a pasta `godot/` deste repositório e selecione o arquivo `project.godot`.
5. Após o projeto carregar no editor, pressione **F5** (ou o botão de Play no canto superior direito) para executar o jogo.

#### Controles do Jogador
- **W** — Mover para Frente / Cima
- **S** — Mover para Trás / Baixo
- **A** — Mover para a Esquerda
- **D** — Mover para a Direita

---

### 2. Relatório do Projeto (LaTeX)

#### Opção A: PDF Pré-compilado
O relatório técnico já se encontra compilado e pronto para leitura no caminho:
- `relatorio/main.pdf`

#### Opção B: Compilando o Código-Fonte LaTeX
##### Pré-requisitos
- Uma distribuição LaTeX instalada (ex: [TeX Live](https://www.tug.org/texlive/), [MiKTeX](https://miktex.org/) ou [MacTeX](https://www.tug.org/mactex/)).
- Editor de preferência (ex: **VS Code** com extensão *LaTeX Workshop*, **Texmaker**, ou envio dos arquivos da pasta `relatorio/` para o **Overleaf**).

##### Passo a Passo (Linha de Comando)
1. Acesse o diretório do relatório:
   ```bash
   cd relatorio
   ```
2. Compile o documento utilizando `latexmk` ou `pdflatex`:
   ```bash
   latexmk -pdf main.tex
   ```
   *ou*
   ```bash
   pdflatex main.tex
   bibtex main
   pdflatex main.tex
   pdflatex main.tex
   ```
3. O arquivo final compilado será gerado em `relatorio/main.pdf`.

---

## 🛠️ Tecnologias Utilizadas

- **Engine de Jogos:** [Godot Engine 4](https://godotengine.org/) (GDScript)
- **Linguagem de Documentação:** [LaTeX](https://www.latex-project.org/) (Modelo abnTeX2 / FAENG UFMT)
- **Controle de Versão:** Git & GitHub
