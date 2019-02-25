$fn = 200;

// Mode 1 => 3D
// Mode 2 => 2D
// Mode 3 => Tests 3D
// Mode 4 => Rondelle
mode = 2;

gap = 5;

regulateur_length = 276;
regulateur_width = 21;
regulateur_thickness = 5;
regulateur_oblong_holes_width = 8; // Width of indicator mounting holes in regulator.
regulateur_oblong_holes_shift = 0; // Indicator mounting holes shift 

indicateur_length = 120;
indicateur_width = 18;
indicateur_thickness = 5;

bearing_diameter_slack = 0.4;
bearing_diameter = 13 + bearing_diameter_slack;
bearing_hold_diameter = bearing_diameter - 2;
bearing_embedment = 20;

screw_diameter_slack = 0.8;
screw_diameter = 4 + screw_diameter_slack;
driving_hole_diameter = 3.2;
driving_hole_pitch = 7;
mark_hole_diameter = 1;

// Rectangular windows in the middle of pieces
windowing_margin = 10;
window_width = 3;
window_border = 4;
        

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
        
        // Center hole
        translate([regulateur_length/2,regulateur_width/2, -1]) {
            cylinder(d=screw_diameter, h=regulateur_width+2);
        }
        

        // Left windows
        windowing_lstart = regulateur_width/2 + regulateur_oblong_holes_width/2 + regulateur_oblong_holes_shift + screw_diameter/2 + windowing_margin;
        windowing_lend = regulateur_length/2 - screw_diameter/2 - windowing_margin;
        windowing_center_shift = 0;
        for ( i = [windowing_lstart : window_width * 2 : windowing_lend] ) {
            translate([i + windowing_center_shift, window_border, -1])
                cube([window_width, regulateur_width - 2*window_border, regulateur_thickness+2]);
        }
        
        // Right windows
        windowing_rstart = regulateur_length - regulateur_width/2 - regulateur_oblong_holes_width/2 - regulateur_oblong_holes_shift - screw_diameter/2 - windowing_margin;
        windowing_rend = regulateur_length/2 + screw_diameter/2 + windowing_margin;
        windowing_center_shift = 0;
        for ( j = [windowing_rstart : -window_width * 2 : windowing_rend] ) {
            translate([j - window_width - windowing_center_shift, window_border, -1])
                cube([window_width, regulateur_width - 2*window_border, regulateur_thickness+2]);
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
    
        // Hole
        translate([indicateur_width/2, indicateur_width/2, -1]) {
            cylinder(d=bearing_hold_diameter, h=indicateur_width+1);
        }
        translate([indicateur_width/2, indicateur_width/2, indicateur_thickness - bearing_embedment]) {
            cylinder(d=bearing_diameter, h=bearing_embedment+1);
        }
        
        // Windows
        windowing_start = indicateur_width/2 + bearing_hold_diameter/2 + windowing_margin;
        windowing_end = indicateur_length - windowing_margin;
        windowing_center_shift = 0;
        for ( i = [windowing_start : window_width * 2 : windowing_end] ) {
            translate([i + windowing_center_shift, window_border, -1])
                cube([window_width, indicateur_width - 2*window_border, regulateur_thickness+2]);
        }
    }
}

module 3d() {
    indicateur_3d();
    translate([gap + indicateur_length, 0])
        indicateur_3d();

    translate([0,gap + indicateur_width])
        regulateur_3d();

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
