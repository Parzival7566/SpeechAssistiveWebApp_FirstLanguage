# app/Dockerfile

FROM python:3.9-slim

EXPOSE 8501

WORKDIR /app
COPY requirements.txt /app

RUN apt-get update && apt-get install -y \
    build-essential \
    software-properties-common \
    portaudio19-dev \
    python-all-dev \
    && rm -rf /var/lib/apt/lists/* && \
    pip3 install --no-cache-dir -r requirements.txt

COPY . .

ENTRYPOINT ["streamlit", "run", "FLASR.py", "--server.port=8501", "--server.address=0.0.0.0"]