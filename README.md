# DivineWeavers (神の糸)

## About

これは、[KPC-U16 CHaser](https://github.com/KPC-U16/PortableEditor-Pub)のエージェントプログラムです。  
this is agent program for [KPC-U16 CHaser](https://github.com/KPC-U16/PortableEditor-Pub).

## Naming Reason

DivineWeaversという名前は、神の糸という意味です。  
DivineWeavers means "神の糸" in Japanese.

このプログラムのクラス名は、Clotho, Lachesis, Atroposという運命を司る三女神の名前になっています。  
Clotho, Lachesis, Atropos are the names of the three Fates in Greek mythology.

彼女らは、人間の運命を糸で紡ぐという役割を持っています。  
They have a role to spin the fate of human beings with thread.

## Structure of this program

このプログラムは、以下のような構造になっています。  
This program has the following structure.

```text
DivineWeavers
├── Stargazer.rb
│   └── Clotho (マップ生成用クラス)
│       ├── initialize (マップ作成)
│       ├── update (マップ更新 - getReady)
│       ├── lookupdate (マップ更新 - look)
│       └── searchupdate (マップ更新 - search)
│
├── Eterayer.rb
│   ├── Lachesis_c (マップ処理クラス / Clothoからの情報を処理)
│   │   ├── initialize (変数初期化)
│   │   ├── prevmove (前回行動からの引き継ぎ)
│   │   ├── item (探索済み未取得アイテム座標)
│   │   └── nosearched (未探索マスとその座標)
│   │
|   └── Lachesis_a (行動補助クラス / Lachesis_cの処理内容をAtroposに渡す)
│       ├── initialize (変数初期化)
│       ├── priority (優先順位決定)
│       └──  router (ルート探索)
| 
└── Ultimavand.rb
    └── Atropos (行動クラス)
        ├── initialize (変数初期化)
        ├── cds (袋小路確認)
        └── move (移動)
```

## Features

このプログラムは、以下の機能を持っています。  
This program has the following features.

実装済みのものには、✔をつけています。

- 探索済みのマスを記憶する✔
- ランダムウォークではなく、未探索のマスを優先的に探索する
- 優先順位を考慮した移動を行う

## Action priority

このプログラムは、以下の優先順位で行動を決定します。  
This program determines the action in the following priority.

1. 前回行動からの引き継ぎ動作  
  a. 前回行動で袋小路を確認している場合は、その方向へブロックを設置して袋小路を封鎖する  
  b. 前回行動で周囲に敵がいる場合は処理する  
      敵が斜めにいる場合は、上下左右いずれかにブロックを設置して処理する  

2. アイテムの取得  
  a. アイテムがある場合は、その方向へ移動する
   - 直線距離が近いものから取得する。
   - 直線距離は、マンハッタン距離で計算する。(マンハッタン距離 = 縦の距離 + 横の距離)

3. 未探索マスの探索  
  a. 未探索マスがある場合は、その方向へ移動する
    - 前回動作の移動せず探索していない方向を優先する。
    - 前回動作の移動せず探索していない方向がない場合は、更にその前の動作の移動せず探索していない方向を優先する。
    - それもなければマップを処理して、未探索マスがある方向を優先する。
    - 未探索マスが複数ある場合は、直線距離が近いものから探索する。
    - 直線距離は、マンハッタン距離で計算する。(マンハッタン距離 = 縦の距離 + 横の距離)

## How to use

Run.  
That's all.

## License

Copyright (c) 2021, U-16 Programming Contest Kushiro Tournament Executive Committee All rights reserved.
