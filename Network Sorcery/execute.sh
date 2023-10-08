pnpm i -g pm2

pm2 delete network-sorcery

pm2 start src/server.js --name network-sorcery -f

# Write your code here

# Check if socat is installed
if ! command -v socat &> /dev/null; then
    echo "socat is not installed. Please install it before running this script."
    exit 1
fi

# Start socat to listen on port 80 and forward requests to localhost:3000
socat TCP-LISTEN:80,fork,reuseaddr EXEC:"echo -ne 'HTTP/1.1 301 Moved Permanently\r\nLocation: http://localhost:3000\r\n\r\n'",su=nobody
