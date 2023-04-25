FROM python:3.11.0-alpine

# har doim cache dan olsih uchun
ENV PYTHTONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

WORKDIR /app
COPY . /app


# har doim cache dan olsih uchun
RUN --mount=type=cache,id=custom-pip,target=/root/.cache/pip pip install -r /app/req.txt

EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

# docker build -t django_image .
# docker run -p 8001:8000 --name django_container -d django_image
# docker exec -it django_container python3 manage.py makemigrations
# docker exec -it django_container python3 manage.py migrate

# docker rmi django_image         imageni o'chirish uchun
# docker image rm django_image    2 usuli
# docker ps                       docker contaner view
# docker container ls             docker contaner view