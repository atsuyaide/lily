# Lily

Lily は PowerShell をベースとした軽量な CLI ツールです.
PowerShell を利用するため基本機能を利用するために別のソフトウェアをインストールする必要はありません.

日々行っている作業(特定の Web ページやフォルダを開くなど)をコマンドで代替し, あなたがマウスを操作するよりも圧倒的に高速にその作業が完了できます.
また, もしもあなたが簡単なプログラミングをできるなら, Lily にコマンドを追加することでより強力なツールとなるでしょう.

## Setup

Lily のセットアップはとても簡単です.
このリポジトリをダウンロードし, `setup.ps1` を実行するだけで完了します.

1. ソースファイルをすべて[ダウンロード](https://github.com/atsuyaide/lily/archive/refs/heads/main.zip)し, Zip ファイルを展開します.
2. プロジェクトフォルダ内に `setup.ps1` を実行します.
   1. ファイルエクスプローラーを利用している場合はファイルを選択し右クリック.
   2. `PowerShell で実行` をクリックします.
3. `setup.ps1` と同じフォルダに `Lily.lnk` が作成されます.

`Lily.lnk` は起動用ショートカットで, ダブルクリックすることで Lily を起動できます.

Lily が起動できたら, `google`と入力し実行してください.
Microsoft Edge で Google 検索のページが起動したはずです!!

このように Lily ではコマンドで特定の Web ページやフォルダを簡単に開くことができます.
また設定ファイルを書き換えることで利用する Web ブラウザを変更したり, 開くことのできる Web ページを簡単に追加することもできます.

## Lily の内部構造

このセクションでは Lily を構成する内部構造を説明します.

Lily は `main.ps1` を PowerShell が読み込ませるというシンプルな構造で成り立っています.
下記では `main.ps1` 内部では環境変数や設定ファイルについて説明します.
このセクションを理解することで Lily を柔軟なカスタマイズが可能になります.

### 環境変数

| 変数名              | 説明                                                          |
| :------------------ | :------------------------------------------------------------ |
| $Env:\_ROOT         | Lily のソースファイルがあるフォルダ                           |
| $Env:\_SRC          | Lily 実行可能なコマンドの保存場所                             |
| $Env:\_VERSION      | Lily のバージョン                                             |
| $Env:HOME           | Home directory. 各種設定ファイルはここに配置される            |
| $Env:InitDir        | Lily 起動時の初期ディレクトリ. デフォルトは`$Env:USERPROFILE` |
| $Env:DefaultBrowser | EXE ファイルパス. デフォルトは Microsoft Edge                 |

### 設定ファイル

| ファイル名     | 説明                                                          |
| :------------- | :------------------------------------------------------------ |
| `.lilyrc`      | 起動時に読み込まれる設定ファイル(PowerShell の構文で記載可能) |
| `alias.txt`    | 起動時に読み込まれるエイリアスファイル                        |
| `bookmark.txt` | `binit` コマンドで開くページの一覧                            |

`.lilyrc` と `alias.txt` は Lily は起動時に `$Env:_ROOT` -> `$Env:USERPROFILE` 配下を順番に, `bookmark.txt` はどちらかのみを読み込みます.
読み込む優先度は `$Env:USEPROFILE` -> `$Env:_ROOT` の順番です.

### コマンドとエイリアス

Lily ではデフォルトの PowerShell 関連のコマンドに加えて様々なコマンド(例: `manual`, `google`, `lily`, ...)を実行可能です.
これらの Lily 特有の機能はコマンドとエイリアスに分類できます.
`manual` コマンドではコマンドとエイリアスに分けて一覧を表示します.

| 種類    | 説明                                                                                                        |
| :------ | :---------------------------------------------------------------------------------------------------------- |
| Command | 実態は `.ps1` ファイルです. `$Env:_SRC` に `.ps1` ファイルを配置することで Lily から呼び出し可能になります. |
| Alias   | 実態は doskey のマクロ設定です. `alias.txt` を読み込ませることで Lily から呼び出し可能になっています.       |

## Tutorial

Lily は環境変数や設定ファイルを編集することで柔軟なカスタマイズが可能です.

まずは事前準備として `lily init` を実行してください.
ファイルを保存するか聞かれるため, 上書きしたくない事情がなければ全て Enter で完了してください.

### 起動時の設定を追加する

Lily も多くのシェル同様ホームディレクトリに `.*rc` を配置することで起動時に自動的に読み込みます.

例えば, `$Env:HOME\.lilyrc`に

```PowerShell
$Env:InitDir="$Env:USERPROFILE\Desktop"
$Env:DefaultBrowser="C:\path\to\Chrome.exe" # NOTE: Specify the path to the Chrome.exe
```

と書き込むことで以下の変更が発生します.

- 起動時の初期ディレクトリをデスクトップに
- デフォルトのブラウザを Chrome に

Lily を再起動し初期ディレクトリが変わっていることを確認してください.

### 機能を追加する

機能を追加する方法には, コマンド登録かエイリアス登録かの二種類があります.

どちらでも簡単に Lily から呼び出し可能になりますが, それぞれの機能差分は以下の表です.
実現したい機能に応じて適切な方法を選択してください.

|         |               Easiness               |     Arguments      |      Pipeline      | Complex processing |
| :------ | :----------------------------------: | :----------------: | :----------------: | :----------------: |
| Command |          :heavy_check_mark:          | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |
| Alias   | :heavy_check_mark::heavy_check_mark: | :heavy_check_mark: |                    |                    |

例として, `github` で GitHub をブラウザで開くコマンドを追加してみましょう.

**Command を利用する場合**

`$Env:_ROOT\src` に `github.ps1` を追加します.
`github.ps1` の中身は以下です.

```PowerShell
<#
    .SYNOPSIS
      Open Github page
#>
bopen "https://github.com/"
```

冒頭 4 行はコマンドの説明文で, 記載している場合 `manual` コマンド実行時に自動で読み込まれます.

```PowerShell
>> manual
==== Commands ====
...
github
 Open Github page
...
```

**Alias を利用する場合**

`$Env:HOME\alias.txt` に以下を追加し, `ainit` を実行または Lily を再起動します.

```text
github=bopen "https://github.com/";#=# Open GitHub page
```

`;#=# ` 以降はコマンドの説明文で, 記載している場合 `manual` コマンド実行時に自動で読み込まれます.

```PowerShell
>> manual
...
==== Aliases ====
...
github
 Open Github page
...
```

### 他ソフトウェア(Git, Python, ...)を利用可能にする

この内容はより高度な機能を追加する方法です.
内容に応じて別のソフトウェアをインストールする必要がありますが, Lily で Python などを使えるようにすれば実現可能な範囲が飛躍的に広がります.

**Python を利用可能にする**

ここでは Miniconda(もしくは Anaconda)を利用する場合の設定を例示します.
まずは Miniconda をインストールしてください.
インストール先はどこでも構いません.

Minioconda は PowerShell 用の hook ファイルを用意しています!!
`.lilyrc` に読み込むように設定しましょう.

`$Env:USERPROFILE` に Miniconda をインストールしている場合の設定は以下です.

```PowerShell
. "$Env:USERPROFILE\miniconda3\shell\condabin\conda-hook.ps1"
conda activate "$Env:USERPROFILE\miniconda3"
```

Lily を再起動すると Python と `conda` コマンドが利用可能になります.

**git, grep, awk などを利用可能にする**

ここでは[Git for Windows](https://gitforwindows.org/)の力を借ります.
まずはインストールを完了させてください.
インストール先はどこでも構いません.

`C:\Program Files` に Git for Windows をインストールしている場合の設定は以下です.

```PowerShell
$Env:PATH="C:\Program Files\Git\bin;C:\Program Files\Git\usr\bin;" + $Env:PATH
```

Lily を再起動すると Git for windows に標準搭載されているコマンドが利用可能になります.
