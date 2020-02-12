FROM ubuntu

WORKDIR iplbot

# copiar dados essenciais
COPY images images/
COPY videos videos/
COPY README.md .
COPY practice_version practice_version/

WORKDIR practice_version

# preparar ambiente
RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y apt-utils
RUN apt-get install -y python3-dev python3-pip 
RUN apt-get install -y virtualenv
RUN virtualenv --python='/usr/bin/python3.6' ENV
#RUN source ENV/bin/activate
RUN apt-get clean
RUN pip3 install -U "pip<20" setuptools
RUN pip3 install rasa-x --extra-index-url https://pypi.rasa.com/simple

#Nao funcionou pq na instalacao do miniconda solicita o y(es)
#RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
#RUN yes|sh Miniconda3-latest-Linux-x86_64.sh
#RUN conda create -n rasa python=3.6
#RUN conda activate rasa

RUN pip3 install -r requirements.txt
RUN pip3 install -y tornado
RUN pip3 install -U spacy
RUN python3 -m spacy download en

#? pesquisar
#EXPOSE 5005   #rasa shell
#EXPOSE 5055   #action server

#treinar o rasa
CMD ["make", "train-nlu"]
CMD ["make", "train-core"]

#colocar o action-server em 2o plano
#verificar jobs: use comando "jobs"
#enviar comando para 1o plano = fg %1 por exemplo
#enviar comando para 2o plano = bg %1 por exemplo
CMD ["make", "action-server", "&"] 

#chamar o cmdline - conversa como iplbot-rasa
CMD ["make", "cmdline"]    

#####################################

#RUN apt-get install -y apache2-utils
#RUN apt-get clean
#EXPOSE 80
#CMD ["apache2ctl","-D", "FOREGROUND"]

#ENTRYPOINT ["/iplbot"]

#CMD ["ls","-la"]
#CMD ["echo","Terminou"]