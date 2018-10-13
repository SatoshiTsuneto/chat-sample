# ruby 2.4.1 create 2017.08.26

require 'socket'

print 'サーバのIPアドレスを入力：'
host = gets.chomp
print '接続するポートを入力：'
port = gets.to_i
sock = TCPSocket.open(host, port)

puts "\n@チャットを開始します。\n"
puts "メッセージを入力してください。※チャットを終了するにはexitと入力してください。\n"
print "you："
while send_msg = STDIN.gets.chomp
  if send_msg == 'exit'
    print 'server：さようなら'
    puts "\n@チャットを終了します。\n"
    break
  end
  sock.puts send_msg
  receive_msg = sock.gets
  print 'server：', receive_msg
  print 'you：'
end
sock.close

