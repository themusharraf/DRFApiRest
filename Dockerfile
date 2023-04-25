FROM python:3.11.0-alpine

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

WORKDIR /app
COPY . /app

RUN --mount=type=cache,id=custom-pip,target=/root/.cache/pip pip install -r /app/requirements.txt

RUN python manage.py collectstatic --noinput

#FROM python:3.11.0-alpine

# har doim cache dan olsih uchun
#ENV PYTHTONUNBUFFERED=1
#ENV PYTHONDONTWRITEBYTECODE=1
#
#WORKDIR /app
#COPY . /app
#
#
## har doim cache dan olsih uchun
#RUN --mount=type=cache,id=custom-pip,target=/root/.cache/pip pip install -r /app/req.txt
#
#EXPOSE 8000
#CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

# docker build -t django_image .
# docker run -p 8001:8000 --name django_container -d django_image
# docker exec -it django_container python3 manage.py makemigrations
# docker exec -it django_container python3 manage.py migrate

# docker rmi django_image         imageni o'chirish uchun
# docker image rm django_image    2 usuli
# docker ps                       docker contaner view
# docker container ls             docker contaner view
# docker pull name                docker texlogi yuklash uchun dockerga


# docker da psotgres db ochish
#docker run --name p5_db -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=1 -d -p 5432:5432 postgres:alpine
# docker exec -it -u postgres admin_db psql
# docker exec -it p5_db psql -U postgres

# docker run --name p8_db -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=1 -d -p 5432:5432 postgres:alpine
# docker exec -it -u postgres p8_db psql


# docker-compose -f docker-compose.yml build
# docker-compose build .             project yangilansa qilish kerak nuqtasiz
# docker-compose build --no-cache
# docker-compose up                  project start
# docker-compose down -v             all project containers remove uchun
# docker-compose down

# dockerfile, docker-compose,docker-swarm