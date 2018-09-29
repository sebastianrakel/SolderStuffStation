include <solder_stuff_station.scad>;

module PumpHolder(pump_height=40, pump_width=25) {
     difference() {
          SmallBlock(pump_height + 3);
          translate([small_block_width/2, small_block_length/2, 3]) cylinder(h=pump_height, d=pump_width);
     }    
}

PumpHolder();
