# Set the Kafka broker address and port
KAFKA_BROKER="localhost:9092"

# Set the Kafka topic to consume messages from
KAFKA_TOPIC="SOS"

# Configure Kafka properties
KAFKA_PROPERTIES="--bootstrap-server $KAFKA_BROKER --topic $KAFKA_TOPIC --from-beginning"

# Function to consume messages and print them
consume_messages() {
  kafka-console-consumer $KAFKA_PROPERTIES
}

# Main function
main() {
  echo "Connecting to Kafka broker on $KAFKA_BROKER..."
  consume_messages
}

# Run the main function
main
