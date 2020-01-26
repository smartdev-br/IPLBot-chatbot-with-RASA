.PHONY: clean train-nlu train-core cmdline server

TEST_PATH=./

help:
	@echo "    clean"
	@echo "        Remove python artifacts and build artifacts."
	@echo "    train-nlu"
	@echo "        Trains a new nlu model using the projects Rasa NLU config"
	@echo "    train-core"
	@echo "        Trains a new dialogue model using the story training data"
	@echo "    action-server"
	@echo "        Starts the server for custom action."
	@echo "    cmdline"
	@echo "       This will load the assistant in your terminal for you to chat."

	@echo "    graph"
	@echo "       This will generates a graph based on stories generated"
	@echo "    ngrok-slack"
	@echo "       This will starts ngrok on action-server port (slack api connection)"
	@echo "    deploy-rasa-chatbot"
	@echo "       This will deploy Rasa chatbot"
	@echo "    ngrok-rasa"
	@echo "       This will starts ngrok on Rasa server port"


clean:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f  {} +
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info
	rm -rf docs/_build

train-nlu:
	python -m rasa_nlu.train -c nlu_config.yml --data data/nlu_data.md -o models --fixed_model_name nlu --project current --verbose
	
train-core:
	python -m rasa_core.train -d domain.yml -s data/stories.md -o models/current/dialogue -c policies.yml

cmdline:
	python -m rasa_core.run -d models/current/dialogue -u models/current/nlu --endpoints endpoints.yml
	
action-server:
	python -m rasa_core_sdk.endpoint --actions actions
	
graph:
	python -m rasa_core.visualize -d domain.yml -s data/stories.md -o graph.html

ngrok-slack:
	./ngrok http 5055
	# ./ngrok http -subdomain=slack-connect 5055

deploy-rasa-chatbot:
	python -m rasa_core.run -d models/current/dialogue -u models/current/nlu --port 5002 --connector slack --credentials slack_credentials.yml --endpoints endpoints.yml

ngrok-rasa:
	# ./ngrok http 5002
	./ngrok http 5002 --region jp
	# ./ngrok http -subdomain=rasa-connect 5055