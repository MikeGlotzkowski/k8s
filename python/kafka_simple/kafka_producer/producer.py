from kafka import KafkaProducer
import logging
import sys
import time
from random import randrange

topic = "my_favorite_topic"
server = "kafka-0.kafka-headless.default.svc.cluster.local:9092"

logger = logging.getLogger()
logger.setLevel(logging.DEBUG)

handler = logging.StreamHandler(sys.stdout)
handler.setLevel(logging.INFO)
formatter = logging.Formatter("%(asctime)s - %(name)s - %(levelname)s - %(message)s")
handler.setFormatter(formatter)
logger.addHandler(handler)


producer = KafkaProducer(bootstrap_servers=server)

running = True
while running:
    rnd = randrange(10)
    msg = "sleeping for {0}".format(str(rnd))
    logger.info(msg)
    producer.send(topic, str.encode(msg))
    time.sleep(rnd)