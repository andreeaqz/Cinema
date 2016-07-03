every 2.minutes do
	rake "updaterunningfilms:update"
	command "touch /home/tvb/Code/cinematograf/TUDOR.txt"
	runner "Film.addfilm", :environment => 'development'
end