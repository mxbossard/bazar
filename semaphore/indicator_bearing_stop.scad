$fn=100;

// slack config for 3d printing
loose_slack = 0.3;
tight_slack = 0.1;

// ----- Config semaphore -----
regulateur_width = 21;
regulateur_thickness = 5;

bearing_diameter_slack = 0.4;
bearing_diameter = 13 + bearing_diameter_slack;
bearing_hold_diameter = bearing_diameter - 2;

// ----- config of this piece -----
piece_thickness = 1;
piece_width =  30;
piece_fixation_hole_diameter = 2;
piece_fixation_hole_width = 6;
piece_fixation_hole_side_shift = 4;
bearing_hold_chamfer = 2;


// ----- calculated -----
piece_thickness_slacked = piece_thickness + tight_slack;
piece_height = regulateur_width + 2*piece_thickness_slacked;
piece_depth = regulateur_thickness + 2*piece_thickness_slacked;
regulator_width_slacked = regulateur_width + 2*tight_slack;
regulator_thickness_slacked = regulateur_thickness + 2*tight_slack;
piece_bearing_center_shift = piece_width - regulateur_width/2;
piece_fixation_hole_diameter_slacked = piece_fixation_hole_diameter + 2*loose_slack;

module piece_mask() {
    cube([piece_bearing_center_shift , piece_depth, piece_height]);
    translate([piece_bearing_center_shift, 0, piece_height/2])
        rotate([-90, 0, 0])
            cylinder(d=regulateur_width, h=piece_depth);
}

module piece() {
    intersection() {
        difference() {
            // External
            cube([piece_width, piece_depth, piece_height]);
            
            // Inside
            translate([-1, piece_thickness, piece_thickness])
                cube([piece_width + 2, regulator_thickness_slacked, regulator_width_slacked]);
            
            // Bearing stop hole
            translate([piece_bearing_center_shift, -1, piece_height/2])
                rotate([-90, 0, 0])
                    cylinder(d=bearing_hold_diameter, h=regulateur_thickness + 2*piece_thickness + 2);
            
            // Bearing stop chamfer 1
            translate([piece_bearing_center_shift, -1, piece_height/2])
                rotate([-90, 0, 0])
                    cylinder(d1=bearing_hold_diameter + 2*bearing_hold_chamfer, d2=0, h=bearing_hold_diameter/2);
            
            // Bearing stop chamfer 2
            translate([piece_bearing_center_shift, piece_depth - bearing_hold_diameter/2 + 1, piece_height/2])
                rotate([-90, 0, 0])
                    cylinder(d2=bearing_hold_diameter + 2*bearing_hold_chamfer, d1=0, h=bearing_hold_diameter/2);
                    
            // Fixation hole
            translate([piece_fixation_hole_side_shift, -1, piece_height/2])
                rotate([-90, 0, 0])
            
                    for(i = [0 : 0.1 : piece_fixation_hole_width - piece_fixation_hole_diameter_slacked]) {
                        translate([i, 0, 0])
                            cylinder(d=piece_fixation_hole_diameter_slacked + 2*loose_slack, h=regulateur_thickness + 2*piece_thickness + 2);
                    }
        }
        
        // Rounding
        piece_mask();
    }
}

rotate([0, -90, 0])
    piece();