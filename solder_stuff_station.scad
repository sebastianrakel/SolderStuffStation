$fn = 100;

block_side_length = 30;

module connector() {
     linear_extrude(10) {
          polygon([[0, 0], [5, 0], [3.5, 2], [1.5, 2]]);
     }
}

module Block(width_scale=1, length_scale=1, height=10) {
     difference() {     
          cube([width_scale * block_side_length, length_scale * block_side_length, height]);

          // Groove X
          for(pos = [1:width_scale]) {
               translate([((pos - 1) * block_side_length) + 17.5, 2, 0]) rotate([0, 0, 180]) connector();
          }

          // Groove Y
          for(pos = [1:length_scale]) {
               translate([2, ((pos - 1) * block_side_length) + 12.5, 0]) rotate([0, 0, 90]) connector();
          }
     }
     
     // Tounge X
     for(pos = [1:width_scale]) {
          translate([((pos - 1) * block_side_length) + 17.5,
                     block_side_length * length_scale + 2, 0]) rotate([0, 0, 180]) connector();
     }

     // Tounge Y
     for(pos = [1:length_scale]) {
          translate([block_side_length * width_scale + 2,
                     ((pos - 1) * block_side_length) + 12.5, 0]) rotate([0, 0, 90]) connector();
     }
}

module GreatBlock() {
     Block(2, 2);
}

function BlockLength(scale=1) = block_side_length * scale;
// GreatBlock(1, 1);
//Block(3,2);
