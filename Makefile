VENV := ../august
VENV_PYTHON = $(VENV)/bin/python3
VENV_PIP = $(VENV)/bin/pip

.PHONY: build
build: requirements.txt
	@python3 -m venv $(VENV)
	@$(VENV_PIP) install -r requirements.txt

.PHONY: run
run: build 
	@$(VENV_PYTHON) explain.py --explain_method LERG_S --model_dir models/checkpoint-16000 --data_path data/results_w_ques.json

.PHONY: eval
eval: build 
	@$(VENV_PYTHON) eval.py --explain_method LERG_S --time_stamp 08192023_105120 --model_dir models/checkpoint-16000 --data_path data/results_w_ques.json --plot