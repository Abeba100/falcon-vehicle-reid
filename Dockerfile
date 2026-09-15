FROM python:3.12-slim

WORKDIR /opt/falcon
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY app ./app
RUN mkdir -p /opt/falcon/data

ENV PORT=8000
ENV HOST=0.0.0.0
ENV FALCON_DATA_DIR=/opt/falcon/data
ENV FALCON_REVIEW_THRESHOLD=0.86
ENV FALCON_HIGH_THRESHOLD=0.94
EXPOSE 8000

CMD ["python", "-m", "app.server"]
