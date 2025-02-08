FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y wget make unzip git default-jre build-essential \
    && apt-get clean

RUN git clone https://github.com/facebookresearch/fastText.git /tmp/fasttext
WORKDIR /tmp/fasttext
RUN make CXXFLAGS="-pthread -std=c++17 -O3 -funroll-loops -DNDEBUG"

RUN wget https://dl.fbaipublicfiles.com/fasttext/supervised-models/lid.176.bin -P /tmp/fasttext

RUN wget https://internal1.languagetool.org/snapshots/LanguageTool-20250206-snapshot.zip -O /tmp/lt.zip
RUN unzip /tmp/lt.zip -d /tmp/languagetool
RUN rm /tmp/lt.zip

COPY server.properties /etc/lt/server.properties

EXPOSE 8080

WORKDIR /tmp/languagetool/LanguageTool-6.6-SNAPSHOT
CMD ["java", "-cp", "languagetool-server.jar", "org.languagetool.server.HTTPServer", "--config", "/etc/lt/server.properties", "--port", "8080", "--allow-origin", "*", "--public"]
