#FROM rasa/rasa-x
#FROM ubuntu
FROM alpine

WORKDIR iplbot

# copiar dados essenciais
COPY images images/
COPY videos videos/
COPY README.md .
COPY practice_version practice_version/

RUN cd practice_version

# ambiente
RUN apt-get update
RUN apt-get install -y wget
RUN apt-get clean
RUN pip install --update "pip<20" setuptools
RUN pip install rasa-x --extra-index-url https://pypi.rasa.com/simple

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh
RUN conda create -n rasa python=3.6
RUN conda activate rasa

RUN pip install -r requirements.txt
RUN pip install --update spacy
RUN python -m spacy download en


#####################################

#RUN apt-get install -y apache2-utils
#RUN apt-get clean
#EXPOSE 80
#CMD ["apache2ctl","-D", "FOREGROUND"]

#ENTRYPOINT ["/iplbot"]

#CMD ["ls","-la"]
#CMD ["echo","Terminou"]