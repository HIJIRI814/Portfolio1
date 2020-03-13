# 名前の入力フォーム
def input_name
  p '名前か会社名を入力してください'
  @name =gets.chomp
  check_input_name(@name)
end

# 名前が空欄ではないかチェック
def check_input_name(name)
  if name.empty?
    p '空欄では登録できません'
    input_name
  end
end

# 登録前の確認
def confirmation(msg1,msg2)
  p '以下の内容で登録します（１：はい ２：いいえ）'
  p @name
  select = gets.to_i
  case select
  when 1
    p msg1
  when 2
    p msg2
    name_register
  else
      p '１か２を選択してください'
      confirmation(msg1,msg2)
  end
end

# ファイルへ書き込む
def file_write
  open("namelist.txt", mode = "a") do |f|
    f.puts @name
    f.puts("--------------------------------------------")
  end
end

# 登録を続けるかの確認
def exit_confirmation(msg1,msg2)
  p '登録を続けますか？１：はい ２：いいえ'
  select = gets.to_i
  case select
  when 1
    p msg1
    name_register
  when 2
    p msg2
  else
      p '１か２を選択してください'
      exit_confirmation(msg1,msg2)
  end
end


# 動作用
def name_register
  input_name
  confirmation('登録完了','最初から入力し直してください')
  file_write
  exit_confirmation('登録へ戻ります','お疲れさまでした')
end

name_register