#!/bin/bash
# Adicione um novo remote; pode chamá-lo de "smartdev-fork-iplbot":

git remote add smartdev-fork-iplbot https://github.com/smartdev-br/IPLBot-chatbot-with-RASA.git

# Obtenha todos os branches deste novo remote,
# como o smartdev-fork-iplbot/master por exemplo:

git fetch smartdev-fork-iplbot

# Certifique-se de que você está no branch master:

git checkout master

# Reescreva o seu branch master, de forma que os seus commits
# que não estão no projeto original apareçam, e que os seus
# commits fiquem no topo da lista:

#git rebase smartdev-fork-iplbot/master

# Se você não quiser reescrever o histórico do seu branch master
# (talvez porque alguém já o tenha clonado) então você deve
# substituir o último comando por um

git merge smartdev-fork-iplbot/master

# No entanto, para fazer com que futuros pull requests fiquem o mais
# limpos possível, é uma boa ideia fazer o rebase.

# Se você fez o rebase do seu branch a partir de smartdev-fork-iplbot/master, talvez
# você precise forçar um push para o seu próprio repositório do Github.
# Você pode fazer isso com:

#git push -f origin master

# VocÊ vai precisar fazer isso com o -f apenas na primeira vez que você
# faz um rebase.
