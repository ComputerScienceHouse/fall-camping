FROM ghcr.io/astral-sh/uv:python3.13-alpine
WORKDIR /app
COPY requirements.txt .
RUN uv pip install -r requirements.txt --system
COPY fcwebapp fcwebapp/
COPY config.env.py .
EXPOSE 8000
ENTRYPOINT ["gunicorn", "-b", "0.0.0.0:8000", "fcwebapp:app", "--access-logfile=-"]
