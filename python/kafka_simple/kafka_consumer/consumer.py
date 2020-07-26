from confluent_kafka import Consumer
import logging
import sys


topic = "my_favorite_topic"
server = "kafka-0.kafka-headless.default.svc.cluster.local:9092"

logger = logging.getLogger()
logger.setLevel(logging.DEBUG)

handler = logging.StreamHandler(sys.stdout)
handler.setLevel(logging.INFO)
formatter = logging.Formatter("%(asctime)s - %(name)s - %(levelname)s - %(message)s")
handler.setFormatter(formatter)
logger.addHandler(handler)

conf = {
    "bootstrap.servers": server,
    "group.id": "python-default",
    "auto.offset.reset": "earliest",
}
consumer = Consumer(conf)
consumer.subscribe([topic])

running = True
while running:
    msg = consumer.poll(timeout=1.0)
    if msg is None:
        continue
    else:
        logger.info("[python consumer says] received message: {0}".format(msg.value().decode("utf-8")))
