# run using
#
# 	./code/make/make

#.PHONY: all # declare all as a phony target, meaning there is no file named all # looks like this has no influence, >  File 'all' does not exist is always logged

all: ./data/output/output.json ./data/output/ab ./data/output/d ./data/output/e

./data/output/output.json: ./data/input/input.json
	./code/bash/compute-output.sh
# cp --verbose ./data/input/input.json ./data/output/output.json


./data/input/input.json:
	./code/bash/fetch-input-json.sh

# multiple dependencies
./data/output/ab: ./data/input/a ./data/input/b
	./code/bash/compute/combine-a-b.sh

# multiple targets/multiple outputs demo: https://www.gnu.org/software/automake/manual/html_node/Multiple-Outputs.html
./data/output/d ./data/output/e:
	./code/bash/compute/create-d-e.sh
./data/output/d: ./data/output/e
