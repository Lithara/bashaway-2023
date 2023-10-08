docker pull mongo:latest

if [ ! "$(docker ps -a | grep bashaway-2k23-cluttered)" ]; then
    docker run -d --name bashaway-2k23-cluttered -p 27207:27017 mongo
fi

# Data will be populated into the above database instance once the tests are run.

# Write your code here

# MongoDB connection information
mongo_host="localhost"  # Replace with your MongoDB host
mongo_port="27017"      # Replace with your MongoDB port
mongo_db="bashaway-2k23-cluttered"

# List all collections except "settings" and drop them
collections=$(mongo --host $mongo_host --port $mongo_port --eval "db.getCollectionNames()" --quiet $mongo_db | jq -r '.[]')
for collection in $collections; do
  if [ "$collection" != "settings" ]; then
    echo "Dropping collection: $collection"
    mongo --host $mongo_host --port $mongo_port --eval "db.${collection}.drop()" $mongo_db
  fi
done

echo "Database cleansing complete."