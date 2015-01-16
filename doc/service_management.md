## Managing kafka and zookeeper services

### kafka-web-console

		vagrant ssh zookeeper
		sudo su playframework
		cd ~/kafka-web-console
		play start
		[ctrl]-d
		[ctrl]-d

### zookeeper

		vagrant ssh zookeeper
		sudo service zookeeper-server restart
		[ctrl]-d

### kafka broker

		vagrant ssh kafka-broker
		sudo service kafka restart
		[ctrl]-d
