require 'CHaserConnect.rb' # CHaserConnect.rbを読み込む
require 'Stargazer.rb' # Stargazer.rbを読み込む
require 'Everquestor.rb' # Everquestor.rbを読み込む


position = [0, 0] # スポーン位置からの相対位置
map = Clotho.new # マップを初期化

# サーバに接続
target = CHaserConnect.new("Requiem") # この名前を4文字までで変更する

values = Array.new(10) # 書き換えない

loop do # ここからループ

#---------ここから---------
  values = target.getReady
  if values[0] == 0
    break
  end

  #----- ここまで -----
end

target.close # ソケットを閉じる
