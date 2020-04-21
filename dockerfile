FROM php:7.3-apache
RUN apt-get update && apt-get install -y supervisor
RUN apt-get update && apt-get -y install cron
RUN mkdir -p /var/log/supervisor
COPY . .
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
	
# test crons added via crontab

RUN echo "*/1 * * * * php ditesh.php" | crontab -
RUN echo "*/1 * * * * php sagar.php" | crontab -


CMD ["/usr/bin/supervisord"]



