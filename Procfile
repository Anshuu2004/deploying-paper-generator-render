web: gunicorn run:app \
    -w 1 \
    -k gthread \
    --threads 4 \
    -b 0.0.0.0:8080 \
    --timeout 600 \
    --preload
