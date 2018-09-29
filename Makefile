OPENSCAD = openscad
SCAD = $(filter-out solder_stuff_station.scad, $(wildcard *.scad))
STL = $(SCAD:.scad=.stl)
PNG = $(SCAD:.scad=.png)

all: stl images

stl: $(STL)

images: $(PNG)

%.stl: %.scad | output
	$(OPENSCAD) -o output/$@ $^

output:
	mkdir -p output/

%.png: %.scad | png
	$(OPENSCAD) --render -o images/$@ $^

png:
	mkdir -p images/

clean:
	rm -Rf output/ images/
