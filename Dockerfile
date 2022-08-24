FROM python:3.11-rc-bullseye AS builder

WORKDIR /app

ENV PATH="/venv/bin:$PATH"

RUN rm -rf /var/lib/apt/lists/*

RUN python3 -m venv /venv

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

######
FROM python:3.11-rc-slim-bullseye AS app

ENV PATH="/venv/bin:$PATH"

COPY ./app /app

WORKDIR /app

RUN rm -rf /var/lib/apt/lists/*

COPY --from=builder /venv /venv

CMD ["gunicorn", "--bind", "0.0.0.0:80", "main:app"]
