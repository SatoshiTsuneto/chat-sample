# ruby 2.4.1 create 2017.08.26
require 'socket'

# get my ip address
def my_address
 udp = UDPSocket.new
 udp.connect("128.0.0.0", 7)
 adrs = Socket.unpack_sockaddr_in(udp.getsockname)[1]
 udp.close
 adrs
end

send_msg = ["こんにちは", "ありがとう", "すごいね", "さようなら", "そうだね", "おめでとう", "もう一度お願いします"]
port = 20000

#main
puts "サーバのIPアドレス：#{my_address}\nポート番号：#{port}"

connect = TCPServer.open(port)
sock = connect.accept
connect.close

puts '通信を開始します'
File.open('./.receive_message.log', "a") do |file|
  while receive_msg = sock.gets
    puts '受信したデータ：', receive_msg
    file.puts receive_msg
    sock.puts send_msg[rand((send_msg.length - 1))]
  end
  #ここを抜けると自動的にFILE.CLOSEされる
end
puts '通信を終了します'
sock.close
