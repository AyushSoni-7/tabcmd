FROM ubuntu:latest
RUN apt-get update -y
RUN apt-get update && apt-get install -y python3 
RUN apt-get update && apt-get install -y python3-pip
COPY . /app
WORKDIR /app
RUN pip3 install -r requirements.txt

FROM openjdk:8
ADD https://downloads.tableau.com/esdalt/2018.2.3/tableau-tabcmd-2018-2-3_all.deb /tableau-tabcmd-2018-2-3_all.deb
RUN apt-get install ./tableau-tabcmd-2018-2-3_all.deb
RUN ./opt/tableau/tabcmd/bin/tabcmd --accepteula > /dev/null
RUN ./opt/tableau/tabcmd/bin/tabcmd version

CMD python app.py
