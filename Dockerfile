FROM python:3.9.13-alpine3.16
RUN apk add --update build-base bash bash-completion libffi-dev tzdata git postgresql-client postgresql-dev

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN mkdir $HOME/.ssh
RUN touch $HOME/.bashrc

RUN echo "alias ll='ls -alF'" >> $HOME/.bashrc
RUN echo "alias la='ls -A'" >> $HOME/.bashrc
RUN echo "alias l='ls -CF'" >> $HOME/.bashrc
RUN echo "alias q='exit'" >> $HOME/.bashrc
RUN echo "alias c='clear'" >> $HOME/.bashrc

COPY requirements.txt /app/
RUN pip install -r requirements.txt
COPY . /app/

CMD [ "bash" ]