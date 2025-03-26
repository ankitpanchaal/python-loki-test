from fastapi import FastAPI
import logging

app = FastAPI()

# Configure logging
logging.basicConfig(level=logging.INFO)

@app.get("/health")
def health_check():
    logging.info("Health check OK")
    return {"status": "healthy"}
