# run using
#
# 	./code/make/make

all: ./data/output/output.json

./data/output/output.json: ./data/input/input.json
	./code/bash/compute-output.sh
# cp --verbose ./data/input/input.json ./data/output/output.json


./data/input/input.json:
	./code/bash/fetch-input-json.sh
