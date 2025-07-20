from flask import Flask
from prometheus_client import start_http_server, Counter

app = Flask(__name__)
request_count = Counter('request_count', 'Total number of requests')

@app.route('/')
def hello():
    request_count.inc()
    return "Hello, World!"

if __name__ == '__main__':
    start_http_server(8000)  # Endpoint de métricas
    app.run(host='0.0.0.0', port=5000)