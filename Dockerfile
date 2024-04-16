FROM python:3.9.19

RUN pip install django python-dotenv psycopg2-binary

RUN groupadd -g 1000 kostif
RUN useradd --uid 1000 --gid 1000 kostif

USER kostif

COPY --chown=kostif:kostif elevate /app 

WORKDIR /app/elevate

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]