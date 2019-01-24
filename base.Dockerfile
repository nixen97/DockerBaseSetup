FROM python:3.6.8

# Install requirements
RUN pip install --upgrade pip
COPY ./requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

CMD ["python"]