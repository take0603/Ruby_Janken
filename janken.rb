#じゃんけん部分全体
def janken
  puts "じゃんけん..."
  puts "0(グー) 1(チョキ) 2(パー) 3(戦わない)"
  player_hand = janken_selectNum()
  opponent_hand = rand(3)
  janken_result = janken_judge(player_hand, opponent_hand)
end

#じゃんけん -数字の入力を受け取るメソッド
def janken_selectNum
  choice_num = gets.chomp
  player_hand = choice_num.to_i

  if choice_num =~ /[^0-3]/ || choice_num.empty? || choice_num.length != 1
    puts "0~3までの数字を入力してください"
    return janken_selectNum()
  end

  if choice_num == "3" #3:戦わないを選択
    puts "対戦を終了します"
    return exit
  end

  return player_hand
end

#じゃんけん -勝敗を決めるメソッド
def janken_judge(player_hand,opponent_hand)
  hands = ["グー", "チョキ", "パー"]
  puts "ホイ!"
  puts "--------------"
  puts "あなた：#{hands[player_hand]}を出しました"
  puts "相手：#{hands[opponent_hand]}を出しました"
  puts "--------------"

  if player_hand == opponent_hand
    puts "あいこで..."
    return "draw"
  elsif player_hand == 0 && opponent_hand == 1 || player_hand == 1 && opponent_hand == 2 || player_hand == 2 && opponent_hand == 0
    return "win"
  else
    return "lose"
  end
end



#あっち向いてホイ部分全体
def acchimuite()
  puts "あっち向いて〜"
  puts "0(上) 1(下) 2(左) 3(右)"
  player_hand = acchimuite_selectNum()
  opponent_hand = rand(4)
  acchimuite_judge(player_hand, opponent_hand)
end

#あっち向いてホイ -数字の入力を受け取るメソッド
def acchimuite_selectNum
  choice_num = gets.chomp
  player_hand = choice_num.to_i

  if choice_num =~ /[^0-3]/ || choice_num.empty? || choice_num.length != 1 #0~3以外を入力
    puts "0~3までの数字を入力してください"
    return acchimuite_selectNum()
  end
  
  return player_hand
end

#あっち向いてホイ -決着がついたかを判別するメソッド
def acchimuite_judge(player_hand, opponent_hand)
  hands = ["上", "下", "左", "右"]
  puts "ホイ!"
  puts "--------------"
  puts "あなた：#{hands[player_hand]}"
  puts "相手：#{hands[opponent_hand]}"

  if player_hand == opponent_hand 
    return "finish"
  else
    return true
  end
end

#勝敗がつくまでじゃんけんを繰り返す
next_game = true
while next_game == true do
  janken_result = janken()
  if janken_result == "draw"
    next
  end
  
  acchimuite_result = acchimuite()
  if acchimuite_result == "finish"#あっち向いてホイが決着した場合、じゃんけんの勝敗と比較してあなたの勝敗を表示
    case janken_result
    when "win"
      puts "あなたの勝ち"
    when "lose"
      puts "あなたの負け"
    end
    break
  end
end