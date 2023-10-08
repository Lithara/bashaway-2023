# Redis credentials
username="default"
password="5ax4*1$2"
port="6380"

# Function to generate a random string
generate_random_string() {
  tr -dc 'a-zA-Z0-9' < /dev/urandom | fold -w 10 | head -n 1
}

# Connect to Redis and set the special key
redis-cli -h localhost -p "$port" -a "$password" SET "bashaway-2k23" "$(date +%s%3N)"

# Inject 500 random keys and values
for i in {1..500}; do
  key=$(generate_random_string)
  value=$(generate_random_string)
  redis-cli -h localhost -p "$port" -a "$password" SET "$key" "$value"
done

echo "Mission accomplished!"
