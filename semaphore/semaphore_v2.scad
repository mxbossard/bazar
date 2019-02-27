$fn = 200;

// Mode 1 => 3D
// Mode 2 => 2D
mode = 1;

// bearing_arrangement 1 => bearing inside indicator
// bearing_arrangement 2 => bearing inside regulator
bearing_arrangement = 2;

gap = 5;

// slack config for 3d printing
//loose_slack = 0.3;
//tight_slack = 0.1;

// slack config for laser cut
loose_slack = 0;
tight_slack = -0.1;

regulateur_length = 277; // Test à 277 pour des poulies à 28 dents. Originalement 276mm
regulateur_width = 21;
regulateur_thickness = 5;
regulateur_oblong_holes_width = 8; // Width of indicator mounting holes in regulator.
regulateur_oblong_holes_shift = 0; // Indicator mounting holes shift 

indicateur_length = 120;
indicateur_width = 18;
indicateur_thickness = 5;

bearing_diameter_slack = 2 * tight_slack;
bearing_diameter = 13 + bearing_diameter_slack;
bearing_hold_diameter = bearing_diameter - 2;
bearing_embedment = 20;

screw_diameter_slack = 2 * loose_slack;
screw_diameter = 4 + screw_diameter_slack;
driving_hole_diameter = 3.2;
driving_hole_pitch = 7;
mark_hole_diameter = 1;

// Rectangular windows in the middle of pieces
window_width = 3;
window_spacing = 9;

regulator_windowing_margin = 25;
regulator_windowing_length = 90;
regulator_window_border = 5;

indicator_windowing_margin = 20;
indicator_windowing_length = 90;
indicator_window_border = 3.5;

module regulateur_3d() {
    difference() {
        union() {
            translate([regulateur_width/2, 0, 0])
                cube([regulateur_length - regulateur_width,regulateur_width,regulateur_thickness]);
            
            translate([regulateur_width/2, regulateur_width/2, 0])
                cylinder(d=regulateur_width, h=regulateur_thickness);
            
            translate([regulateur_length -regulateur_width/2, regulateur_width/2, 0]) 
                cylinder(d=regulateur_width, h=regulateur_thickness);

        }

        if (bearing_arrangement == 1) {
            // Left hole
            translate([regulateur_width/2, regulateur_width/2, -1]) {
                translate([regulateur_oblong_holes_width/2 + regulateur_oblong_holes_shift, 0, 0])
                    cylinder(d=screw_diameter, h=regulateur_thickness+2);
                translate([-regulateur_oblong_holes_width/2 + regulateur_oblong_holes_shift, 0, 0])
                    cylinder(d=screw_diameter, h=regulateur_thickness+2);
                translate([-regulateur_oblong_holes_width/2 + regulateur_oblong_holes_shift, -screw_diameter/2, 0])
                    cube([regulateur_oblong_holes_width, screw_diameter, regulateur_thickness + 2]);
            }
            
            
            // Right hole
            translate([regulateur_length - regulateur_width/2, regulateur_width/2, -1]) {
                translate([regulateur_oblong_holes_width/2 + regulateur_oblong_holes_shift, 0, 0])
                    cylinder(d=screw_diameter, h=regulateur_thickness+2);
                translate([-regulateur_oblong_holes_width/2 + regulateur_oblong_holes_shift, 0, 0])
                    cylinder(d=screw_diameter, h=regulateur_thickness+2);
                translate([-regulateur_oblong_holes_width/2 + regulateur_oblong_holes_shift, -screw_diameter/2, 0])
                    cube([regulateur_oblong_holes_width, screw_diameter, regulateur_thickness + 2]);            
            }
        }
        
        if (bearing_arrangement == 2) {
            // Left Hole
            translate([regulateur_width/2, regulateur_width/2, -1]) {
                cylinder(d=bearing_hold_diameter, h=indicateur_width+1);
            }
            translate([regulateur_width/2, regulateur_width/2, indicateur_thickness - bearing_embedment]) {
                cylinder(d=bearing_diameter, h=bearing_embedment+1);
            }
            
            // Right Hole
            translate([regulateur_length - regulateur_width/2, regulateur_width/2, -1]) {
                cylinder(d=bearing_hold_diameter, h=indicateur_width+1);
            }
            translate([regulateur_length - regulateur_width/2, regulateur_width/2, indicateur_thickness - bearing_embedment]) {
                cylinder(d=bearing_diameter, h=bearing_embedment+1);
            }
        }
        
        // Center hole
        translate([regulateur_length/2,regulateur_width/2, -1]) {
            cylinder(d=screw_diameter, h=regulateur_width+2);
        }
        

        // Left windows
        //windowing_lstart = regulateur_width/2 + regulateur_oblong_holes_width/2 + regulateur_oblong_holes_shift + screw_diameter/2 + windowing_margin;
        windowing_lstart = regulator_windowing_margin;
        //windowing_lend = regulateur_length/2 - screw_diameter/2 - windowing_margin;
        windowing_lend = regulator_windowing_margin + regulator_windowing_length;
        windowing_center_shift = 0;
        for ( i = [windowing_lstart : window_width + window_spacing : windowing_lend] ) {
            translate([i + windowing_center_shift, regulator_window_border, -1])
                cube([window_width, regulateur_width - 2*regulator_window_border, regulateur_thickness+2]);
        }
        
        // Right windows
        //windowing_rstart = regulateur_length - regulateur_width/2 - regulateur_oblong_holes_width/2 - regulateur_oblong_holes_shift - screw_diameter/2 - windowing_margin;
        windowing_rstart = regulateur_length - regulator_windowing_margin;
        //windowing_rend = regulateur_length/2 + screw_diameter/2 + windowing_margin;
        windowing_rend = regulateur_length - regulator_windowing_margin - regulator_windowing_length;
        windowing_center_shift = 0;
        for ( j = [windowing_rstart : -window_width - window_spacing : windowing_rend] ) {
            translate([j - window_width - windowing_center_shift, regulator_window_border, -1])
                cube([window_width, regulateur_width - 2*regulator_window_border, regulateur_thickness+2]);
        }
            
    }
}

module indicateur_3d() {
    difference() {
        union() {
            translate([indicateur_width/2, 0, 0])
                cube([indicateur_length - indicateur_width/2,indicateur_width,indicateur_thickness]);
            
            translate([indicateur_width/2, indicateur_width/2, 0])
                cylinder(d=indicateur_width, h=indicateur_thickness);
        }
    
        if (bearing_arrangement == 1) {
            // Hole
            translate([indicateur_width/2, indicateur_width/2, -1]) {
                cylinder(d=bearing_hold_diameter, h=indicateur_width+1);
            }
            translate([indicateur_width/2, indicateur_width/2, indicateur_thickness - bearing_embedment]) {
                cylinder(d=bearing_diameter, h=bearing_embedment+1);
            }
        }
        
        if (bearing_arrangement == 2) {
            // Hole
            translate([indicateur_width/2, indicateur_width/2, -1]) {
                cylinder(d=screw_diameter, h=indicateur_thickness+2);
            }
        }
        
        // Windows
        //windowing_start = indicateur_width/2 + bearing_hold_diameter/2 + windowing_margin;
        windowing_start = indicator_windowing_margin;
        windowing_end = indicator_windowing_margin + indicator_windowing_length;
        windowing_center_shift = 0;
        for ( i = [windowing_start : window_width + window_spacing : windowing_end] ) {
            translate([i + windowing_center_shift, indicator_window_border, -1])
                cube([window_width, indicateur_width - 2*indicator_window_border, regulateur_thickness+2]);
        }
    }
}

module 3d() {
    indicateur_3d();
    translate([gap + indicateur_length, 0])
        indicateur_3d();

    translate([0,gap + indicateur_width]) {
        regulateur_3d();
    
        translate([0,gap + regulateur_width])
            regulateur_3d();
    }
}

if( mode == 1 ) {
    3d();
}

if( mode == 2 ) {
    projection(cut=false)
        3d();
}
   

if( mode == 3 ) {
    // Test 3D
    
    bearings_gap = 1;
    difference() {
        cube([2*regulateur_width, regulateur_width,regulateur_thickness]);
        
        translate([regulateur_width, regulateur_width/2, 0]) {
            // Translate to hole center
            // traversing hole
            translate([0, 0, -1])
                cylinder(d=bearing_hold_diameter, h=regulateur_thickness+2);
            
            translate([0, 0, -1])
                cylinder(d=bearing_diameter, h=(regulateur_thickness - bearings_gap)/2 + 1);
            
            translate([0, 0, (regulateur_thickness - bearings_gap)/2 + bearings_gap])
                cylinder(d=bearing_diameter, h=regulateur_thickness);
        }
    }
}

if( mode == 4 ) {
    
    rondelle(screw_diameter, screw_diameter+2, 1);
}
