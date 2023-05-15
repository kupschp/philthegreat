from fastapi import FastAPI
import socket
from datetime import datetime

app = FastAPI()

@app.get("/")
def get_hostname_and_timestamp():
    hostname = socket.gethostname()
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    return {"hostname": hostname, "timestamp": timestamp}
