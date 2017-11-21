select * FROM mqtt_logger where mqtt_logger.topic = 'dailytask' ORDER BY logtime DESC;

update mqtt_logger set payload = replace(payload, '*', '')	where mqtt_logger.topic = 'dailytask'

delete from mqtt_logger where topic = 'dailytask';