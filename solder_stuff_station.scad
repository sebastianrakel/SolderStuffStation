$fn = 100;

small_block_width = 30;
small_block_length = 30;

module connector() {
     linear_extrude(10) {
          polygon([[0, 0], [5, 0], [3.5, 2], [1.5, 2]]);
     }
}

module Block(width, length, height, with_right, with_left, with_up, with_down) {

     difference() {
          cube([width, length, height]);
          //nut
          if(with_down) translate([(width/2) + 2.5, 2, 0]) rotate([0, 0, 180]) connector();
          if(with_left) translate([2, (length/2) - 2.5, 0]) rotate([0, 0, 90]) connector();
     }

     //feather
     if(with_up) translate([(width/2) + 2.5, length + 2, 0]) rotate([0, 0, 180]) connector();
     if(with_right) translate([width + 2, (length/2) - 2.5, 0]) rotate([0, 0, 90]) connector();
}

module SmallBlock(height, with_right=true, with_left=true, with_up=true, with_down=true) {
     Block(small_block_width, small_block_length, height, with_right, with_left, with_up, with_down);
}

module GreatBlock(height) {
     SmallBlock(height, with_right=false, with_up=false);
     translate([small_block_width, 0, 0]) SmallBlock(height, with_left=false, with_up=false);
     translate([small_block_width, small_block_length, 0]) SmallBlock(height, with_left=false, with_down=false);
     translate([0, small_block_length, 0]) SmallBlock(height, with_down=false, with_right=false);
}

