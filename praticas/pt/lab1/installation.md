# Instalação OCaml

Esta ficha prática tem como objetivo instalar e configurar todo o software
necessário para o desenvolvimento de código OCaml na Unidade Curricular de
**Linguagens e Ambientes de Programação**.

Todo o processo de instalação descrito nesta ficha, assim como o desenvolvimento
na Unidade Curricular de **Linguagens e Ambientes de Programação**, será feito
tendo como base um Sistema Operativo da família Unix. A secção [Sistema de
Desenvolvimento Unix](#sistema-de-desenvolvimento-unix) apresenta como instalar
um sistema Unix numa máquina que execute sobre o sistema Windows ou Mac.

No final desta ficha, deverá ter instalado na sua máquina as seguintes
plataformas:

- Um sistema de desenvolvimento baseado em Unix
- OPAM, o gestor de pacotes da linguagem OCaml
- Um *switch* OPAM, com uma versão específica do compilador e alguns pacotes
- O editor de código Visual Studio Code, com o *plugin* OCaml

Todo o processo de instalação se baseia fortemente na utilização do terminal
(*consola*).

## Sistema de Desenvolvimento Unix
> [!IMPORTANT] 
> Esta é uma óptima oportunidade para realizar uma actualização do seu Sistema
> Operativo. Em geral, é boa prática manter o Sistema Operativo e o software
> instalado actualizados, sobretudo antes de proceder à instalação de um conjunto
> consequente de novos programas.

## Linux

Se já possui um sistema Linux funcional, pode avançar para a secção [Instalação
OPAM](#instalação-opam).

### Mac

Como gestor de pacotes num sistema MacOS, deverá optar entre o [Homebrew][homebrew] ou o
[MacPorts][macports]. Com o propósito de instalar o software requerido para esta
Unidade Curricular, acreditamos que o Homebrew oferece um processo de instalação
mais simples e amigável. Por isso, se ainda não é um utilizador de MacPorts,
recomendamos que instale o Homebrew e siga todas as instruções apresentadas para
esta plataforma. **Nota importante:** não deve nunca tentar instalar em
simultâneo o Homebrew e o MacPorts! Estes dois gestores de pacotes não são
pensados para coexistir.

[homebrew]: https://brew.sh/
[macports]: https://www.macports.org/install.php

### Windows

A utilização de um ambiente Unix dentro do Sistema Operativo Windows é possível
graças ao *Windows Subsystem for Linux* (WSL). Em qualquer versão recente do
Windows, o WSL é relativamente simples de instalar.
> [!TIP]
> A utilização do WSL poderá requerer a mudança da configuração da sua
máquina. Se surgir, durante a instalação do WSL, o erro sobre "virtual machine"
então é sinal que deverá permitir a virtualização através da BIOS da sua
máquina. A configuração da BIOS depende de cada frabricante e modelo de
computador. Uma pesquisa por `enable virtualization [manufacturer] [model]`
deverá devolver resultados suficientes para resolver a questão.

> [!WARNING] 
> Caso não consiga ou escolha não utilizar o WSL, é possível instalar nativamente
um ambiente para desenvolvimento de Ocaml no Windows 11, **porém** não irá
conseguir fazer uso dos Jupyter Notebooks que serão usados nas aulas práticas,
deste modo esta alternativa **não é recomendada e deverá apenas ser usada
como último recurso**. Avance para a secção de [instalação](#instalação-opam) e siga as instruções
denotadas como **(Nativo)** ao invés de **(WSL)** para instalar nativamente o ambiente
de desenvolvimento no Windows. 


A instalação do WSL completa-se da seguinte forma:

- Abra o Windows PowerShell como Administrador. Para tal, carregue em *Start* e
  escreva *PowerShell*. Carregue em "Correr como Administrador" e clique "Sim"
  para aceitar modificações.

- Execute `wsl --install`. Por outro lado, se já tiver um sistema WSL instalado,
  mas a não a distribuição Ubuntu, execute `wsl --install -d Ubuntu`. Assim que
  o download da distribuição Ubuntu estiver concluído, é expectável que lhe seja
  pedido para reiniciar a máquina. A instalação continuará automaticamente após
  reiniciar.

- Durante a instalação ser-lhe-á pedido que introduza as credenciais do novo
  utilizador o sistema Unix, isto é, um nome de utilizador e uma
  password. Qualquer par de credenciais serve nesta fase, já que não têm
  qualquer influência nas credenciais Windows. Não utilize espaços na sua
  password e memorize-a.
> [!WARNING]
> Se não lhe forem pedidas quaisquer credenciais, então algo correu mal durante a
instalação. Não avance para lá deste ponto! Desinstale a distribuição Ubuntu e
recomece novamente o processo.


<!-- TODO: incluir instruções para versões antigas de Windows -->

**Configuração Ubuntu.** Para executar as instruções seguintes assumimos que
instalou a versão 22.04 do Ubuntu, a versão por omissão no WSL. À partida,
qualquer versão mais recente desta distribuição também lhe permitirá seguir sem
problemas o restante desta secção.

> [!WARNING]
> A partir deste ponto, certifique-se de que todos os comandos sejam executados 
dentro do WSL (Windows Subsystem for Linux). Para garantir que está no ambiente
correto:

Abra a aplicação Ubuntu. Esta aplicação poderá já estar a executar, caso tenha
acabado de instalar o WSL. Deverá ser-lhe apresentado o *Bash prompt*, uma
consola com o seguinte aspecto:

```console
user@machine:~$
```
> [!WARNING]
> Se o prompt tiver o aspecto `root@...#` então algo correu mal. Verifica se de
facto criou um nome de utilizador e password no passo anterior. Se sim, o seu
utilizador a apresentar no prompt deveria ser o mesmo que escolhe anteriormente
e não `root`. Não avance para lá deste ponto! O mais fácil será reinstalar a
distribuição Ubunutu.


Nas versões mais recentes do Windows, a combinação `Ctrl+Shift+C` permite copiar
texto a partir do terminal, enquanto que a combinação `Ctrl+Shift+V` permite
colá-lo. É obrigatório incluir a tecla `Shift`, caso contrário não irá obter o
efeito desejado.

Por forma a actualizar o gestor *Aptitude* (gestor de software da distribuição
Ubuntu), execute o seguinte comando:

```console
sudo apt update
```

Deverá introduzir a password que escolheu nos passos anteriores. O prefixo
`sudo` remete para a execução do comando `apt update` em modo administrador ou,
na terminologia Unix, *super utilizador*.

> [!WARNING]
> *With great power, comes great responsibility*. Executar comandos como super
utilizador permite um controlo quase total do sistema, e portanto potencialmente
perigoso. Não deve, por isso, executar todos os comandos em modo `sudo`, mas
apenas quando tal for estritamente necessário.

De seguida, execute o seguinte comando para proceder à actualização do software
instalado:

```{console}
sudo apt upgrade -y
```

Finalmente, proceda à instalação de alguns pacotes úteis:

```{console}
sudo apt install -y zip unzip build-essential
```

## Instalação OPAM

**Linux.** Siga as [instruções][opam-install] referentes à distribuição que está a utilizar.

**Mac.** Se estiver a utilizar Homebrew, execute o seguinte comando:

```console
brew install opam
```

Se estiver a utilizar MacPorts, execute o seguinte comando:

```console
sudo port install opam
```

[opam-install]: https://opam.ocaml.org/doc/Install.html

**Windows (WSL).** Execute o seguinte comando a partir do Ubuntu:

```console
sudo apt install opam
```

**Windows (Nativo).** Deverá abrir o PowerShell e executar o seguinte comando:
```console
winget install Git.Git OCaml.opam 
```
e reinicie o PowerShell.
## Inicialização do OPAM

> [!WARNING]
> Não deverá nunca utilizar o OPAM em modo super utilizador. Por outras
palavras, não utilize o prefixo `sudo` em nenhum comando `opam`.

**Linux, Mac, Windows (WLS) e Windows (Nativo).** Execute:

```console
opam init --bare -a -y
```

(É normal que obtenha um aviso sobre o ficheiro `.profile` não se encontrar
corretamente referenciado no ficheiro `.bashrc`. Não precisa de fazer qualquer
intervenção neste ponto.)

## Criar um *Switch* OPAM

> [!WARNING]
> Mesmo que, porventura, já tenha instalado o OPAM e criado algum *switch*, para o
propósito da Unidade Curricular de **Linguagens e Ambientes de Programação**
deve criar um novo *switch* de raiz. Em geral, é boa prática de utilização do
OPAM criar *switches* novos para modularizar projetos ou ambientes de
desenvolvimento com propósitos muito específicos.


Um *switch* é a unidade do OPAM que permite dar um nome a uma instalação
específica de uma versão do compilador OCaml e de um conjunto de pacotes de
software associados. Pode conter vários switches criados, cada um apresentando
uma versão específica do compilador, ou um conjunto de pacotes para um fim muito
específico (por exemplo, um projeto pessoal em que esteja a trabalhar). Pode
altenar (*switch*, daí o nome) livremente entre os diferentes switches que tiver
criados na sua máquina.

Para criar um switch para **LAP**, deve executar o seguinte comando:

```console
opam switch create lap2025 ocaml-base-compiler.4.14.0
```

Este comando irá criar um switch com o nome *lap2025* cuja versão subjacente do
compilador OCaml é a 4.14.0.

> [!TIP]
>  Se o anterior comando falhar com o erro de que a versão 4.14.0 não está
disponível, então provavelmente instalou uma versão antiga do OPAM. Actualize o
OPAM com o comando `opam update`.

**Linux, Mac e Windows (WSL)**
De seguida, ser-lhe-á pedido que execute o seguinte comando:

```console
eval $(opam env)
```

Poderá fazê-lo, mas o mais importante neste ponto é que saia da sessão do seu
Sistema Operativo (ou simplesmente reinicie a máquina). 

**Windows (Nativo)**
Execute o seguinte comando e de seguida saia da sessão do seu
Sistema Operativo (ou simplesmente reinicie a máquina):

```console
"`n(& opam env --shell=powershell) | Invoke-Expression" | Add-Content -Path $PROFILE
```
---

Abra novamente o terminal e execute o seguinte comando:

```console
opam switch list
```

O resultado deve ter o seguinte aspecto:

```console
#     switch                         compiler                       description
->    lap2025                        ocaml-base-compiler.4.14.0      lap2025
```

Poderá conter outras linhas, caso tenha já feito desenvolvimento OCaml
anteriormente. Deverá prestar particular atenção aos seguintes pontos:

- **Não é suposto** obter o aviso "The environment is not in sync with the
  current switch. You should run `eval $(opam env)`". Em baixo indicamos como
  resolver este problema, caso o observe.

- Deve ser apresentada a seta `->` na primeira coluna à esquerda do switch
  `lap2025`.

- O switch deve apresentar o nome correcto, assim como a versão 4.14.0 do
  compilador.

> [!WARNING]
> Caso o passo anterior lhe peça para executar o comando `eval $(opam env)`, então
algo correu mal no passo de inicialização do OPAM (comando `opam init`). Pode
tentar executar `opam init --reinit` para resolver o problema. Além disso, é
mesmo necessário que realize o passo de sair da sessão do Sistema Operativo, ou
simplesmente reiniciar a máquina.

Para instalar os pacotes OPAM que precisamos para LAP, deve executar o
seguinte comando:

```console
opam install -y utop odoc ounit2 qcheck bisect_ppx menhir ocaml-lsp-server ocamlformat
```

Toda a linha anterior deve ser introduzida na consola, por isso deve ter a
certeza que a copia na sua integralidade. É expectável que lhe seja apresentado
algum *output* sobre configuração de editores de texto. Pode ignorar estas
indicações.

Neste momento, já está em condições de lançar o programa `utop`, o *OCaml
Universal Toplevel*:

```console
utop
```

Como primeira experiência muito básica, introduza o número `42` seguido dos
símbolos `;;` (dois "ponto e vírgula). De seguida, prima a tecla `Enter`. Deverá
obter o seguinte resultado:

```ocaml
# 42;;
- : int = 42
```

O símbolo `#` indica o prompt (*i.e.,* onde escrever) no `utop`. Depois desta
experiência simples, saia do `utop`, introduzindo o seguinte comando:

```ocaml
# #quit;;
```

Note o símbolo `#` junto à palavra `quit`. Pode também optar por utilizar a
combinação `Ctrl+D`.

## Visual Studio Code

Como veículo de edição de código OCaml para LAP, aconselhamos vivamente a
utilização do **Visual Studio Code** (VS Code).

> [!IMPORTANT]
> Apesar da utilização do VS Code, existem vários outros editores que são
excelentes escolhas no que toca a edição de código OCaml. Destes, destacamos o
`emacs` e o `vim` como os mais clássicos e até mais utilizados no meio
industrial e académico para desenvolvimento OCaml. No entanto, qualquer um
destes editores apresenta uma curva de aprendizagem que poderá ser
desaconselhada para iniciantes.
> Por outro lado, desaconselhamos fortemente a edição de OCaml no Eclipse. O
plugin disponível não é activamente mantido e apenas funciona com versões
antigas do compilador OCaml.

Em primeiro lugar, deverá proceder ao download e posterior instalação do [VS
Code][vscode]. Depois de lançar o VS Code deve abrir o painel de extensões,
utilizando uma das seguintes opções:

- Utilizar o menu "View &rarr; Extensions";

- Clicar no ícone de extensões na barra à esquerda. Este ícone tem o aspecto de
  quatro pequenos quadrados.

> [!TIP]
> Em vários momentos deverá utilizar a *Command Palette*. Para tal, navega pelo
menu `View &rarr; Command Palette`. Poderá também utilizar o atalho de
combinação de teclas, que deverá encontrar junto às palavras "Command Palette"
no menu `View`.

De seguida, siga as seguintes instruções se estiver a utilizar Windows ou Mac:

- **Windows (WSL):** instale a extensão "WSL".

- **Mac:** abra a *Command Palette* e escreva `shell command` para encontrar o
  comando "Shell Command: Install 'code' command in PATH". Execute este comando.

Em terceiro lugar, independentemente do Sistema Operativo utilizado, feche
qualquer terminal aberto (ou simplesmente saia da sessão ou reinicie a máquina)
de forma a que as novas configurações sejam efetivadas. Tal permitirá, mais
tarde, lançar o VS Code a partir de um terminal.

Quarto, e **apenas para os utilizadores Windows (WSL)**, abra a *Command Palette* e
execute o comando `WSL: Connect to WSL`. Este comando irá instalar software
adicional. Assim que a execução do comando terminar, deverá observar um
indicador com a mensagem "WSL: Ubuntu" em baixo à esquerda da janela do VS
Code. Se apenas observar um ícone com o aspecto <sub>&gt;</sub><sup>&lt;</sup>
clique neste e escolha "Connect to WSL" a partir da *Command Palette* que surge.

Quinto, abra novamente o painel de extensões do VS Code. Procure e instale a
extensão **"OCaml Platform"**, desenvolvida por **OCaml Labs**. Não instale
qualquer outra extensão, mesmo que faça referência à linguagem OCaml.

> [!WARNING]
> Se, após instalação da extensão "OCaml Platform", observar um erro referente à
falta do pacote `ocaml-lsp-server`, então algo correu na instalação deste pacote
através do OPAM. Verifique que de facto instalou este pacote através do comando
`opam install`, tal como referido na secção "Criar um *Switch* OPAM".

[vscode]: https://code.visualstudio.com/

## Verificar a Instalação do VS Code

Esta secção apresenta uma série de verificações que podemos realizar para
garantir que a instalação do VS Code e da extensão OCaml foram bem sucedidas.

- Reinicie a máquina mais uma vez

> [!TIP]
> Na verdade, num sistema de desenvolvimento Unix não temos real necessidade de
reiniciar tantas vezes a máquina para que os efeitos de instalação de software
se verifiquem. No entanto, este passo tem o potencial de detecar precocemente
diferentes fontes de erro e por merece o esforço adicional.

- Abra uma nova consola Unix. No **Windows (WSL):** trata-se da consola do Ubuntu
  dentro do sistema WSL, e não da PowerShell ou Cmd.

- Navegue até uma diretoria à sua escolha, preferencialmente uma subdiretoria da
  sua pasta HOME. Para criar uma subdiretoria `lap2025`, onde poderá armazenar
  todo o desenvolvimento feito nesta Unidade Curricular, pode utilizar os
  seguintes comandos:

  ```console
  mkdir ~/lap2025
  cd ~/lap2025
  ```

  Nesta diretoria lance o VS Code, utilizando o seguinte comando:

  ```console
  code .
  ```

  Navegue pelo menu `File &rarr; New File`. Guarde o ficheiro com o nome
  `test.ml`. Neste momento, no VS Code, deverá surgir um ícone laranja com o um
  camelo branco.

- Escreva o seguinte pedaço de código OCaml, seguido da tecla `Enter`:

  ```ocaml
  let x : int = 42
  ```

  Mesmo durante a escrita do código, o VS Code deverá colocar automaticamente a
  sintaxe, sugerir formas de completar o código, assim como adicionar um pequeno
  ícone acima da linha. Experimente mudar a palavra `int` para `string`. Uma
  pequena linha ondulada deverá surgir em baixo de `42`. Poderá utilizar o rato
  para verificar a mensagem de erro associada. Pode também utilizar o menu "View
  &rarr; Problems" para verificar este mesmo erro. Agora, coloca aspas em torno
  de `42` para converter este inteiro numa string. O erro deverá agora
  desaparecer.

**Se não conseguiu observar este comportamento,** existe algum problema com a
sua instalação. Poderá tentar uma das seguintes opções:

- Na mesma consola que utilizou para lançar o VS Code, verifique que consegue
  completar as instruções de verificação para a instalação do *switch*
  OPAM. Consegue lançar o `utop`? O *switch* correto é aquele que está activo?
  Se nenhuma destas situações se verificar, então é exactamente este o problema
  que precisa de resolver.

- Se estiver no WSL e o VS Code apresentar apenas coloração de sintaxe e
  observar o erro sobre "Sandbox initialization failed", então verifique que o
  indicador "WSL" está visível à esquerda em baixo da janela do VS Code. Se não
  for caso, verifique que de facto instalou a extensão "WSL" descrita
  anteriormente e que de facto está a executar o VS Code a partir do Ubuntu e
  nunca a partir da PowerShell ou da interface Windows. Verifique também que a
  extensão "OCaml Platform" está corretamente instalada.

## Configuração de Edição OCaml em VS Code

Seguindo boas práticas de apresentação de código, recomendamos alterar algumas
das configurações presentes por omissão no editor VS Code. Comece por abrir o
ficheiro JSON navegando pelo menu "View &rarr; Command Palette". De seguida,
escreva "user setting json". Finalmente, seleccione `Open User Settings
(JSON)`. Apresentamos de seguida as configurações recomendadas para LAP, que
sugerimos que cole na janela apresentada:

```json
{
    "editor.tabSize": 2,
    "editor.rulers": [ 80 ],
    "editor.formatOnSave": true
}
```

Com a configuração apresentada, todas as linhas de código OCaml que iremos
escrever ao longo da Unidade Curricular nunca terão mais que 80
caracteres. Obedecemos, assim, à famosa regra das [**80 colunas**][columns].

[columns]: https://medium.com/@carlo.michaelis/the-80-120-column-soft-margin-rule-979526742197

## Instalação da Extensão Jupyter Notebook

Durante boa parte das aulas práticas de LAP utilizaremos o sistema Jupyter
Notebook como ferramenta de apoio à resolução de exercícios. A utilização de
Jupyter Notebook facilita a execução de código dentro do pŕoprio VS Code.

Comece por instalar o `jupyter` no seu computador:

- Em Linux (Debian) ou Windows no WSL:

```console
sudo apt install jupyter
```

- Em MAC:

```console
brew install jupyter
```

De seguida, deverá instalar o jupyter kernel de `ocaml`:

```console
opam install jupyter
```

Depois deste comando executar com sucesso, deverá associar o kernel instalado
com a instalação de jupyter:

```console
ocaml-jupyter-opam-genspec
jupyter kernelspec install --name ocaml-jupyter "$(opam var share)/jupyter"
```

É possível que o último comando, `jupyter kernelspec install`, exija privilégios
de super utilizador para executar corretamente. Nesse caso, deve utilizar o
prefixo `sudo`:

```console
sudo jupyter kernelspec install --name ocaml-jupyter "$(opam var share)/jupyter"
```

Finalmente, deverá instalar a extensão `Jupyter` dentro do VS Code. Dentro do
notebook deverá conseguir selecionar o kernel de OCaml previamente instalado. Se
todos estes passos forem bem sucessidos, deverá ser capaz de explorar o [Jupyter
Notebook desta primeira semana][kick-the-tires] de aulas práticas.

[kick-the-tires]: kick_the_tires.ipynb

