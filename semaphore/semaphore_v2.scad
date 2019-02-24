$fn = 200;

// Mode 1 => 3D
// Mode 2 => 2D
// Mode 3 => Tests 3D
// Mode 4 => Rondelle
mode = 1;

gap = 5;

regulateur_length = 276;
regulateur_width = 21;
regulateur_thickness = 5;
regulateur_oblong_holes_width = 8; // Width of indicator mounting holes in regulator.
regulateur_oblong_holes_shift = 0; // Indicator mounting holes shift 

indicateur_length = 120;
indicateur_width = 18;
indicateur_thickness = 5;

bearing_diameter = 13.4;
bearing_hold_diameter = bearing_diameter - 2;
bearing_width = 5.8;

screw_diameter = 4.6;
driving_hole_diameter = 3.2;
driving_hole_pitch = 7;
mark_hole_diameter = 1;
clamping_hole_diameter = 3;
clamping_hole_pitch = 10; // pitch between clamping holes
clamping_hole_shift = 14; // disatance between clamping holes and bearing

        
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

module regulateur_2d() {
    difference() {
        // Body
        union() {
            translate([regulateur_width/2, 0])
                square([regulateur_length - regulateur_width,regulateur_width]);
            
            translate([regulateur_width/2, regulateur_width/2])
                circle(d=regulateur_width);
            
            translate([regulateur_length -regulateur_width/2, regulateur_width/2]) 
                circle(d=regulateur_width);

        }

        // Right hole
        translate([regulateur_width/2,regulateur_width/2]) {
            // Need CNC
            circle(d=mark_hole_diameter);
        }
        
        // Left hole
        translate([regulateur_length - regulateur_width/2,regulateur_width/2]) {
            // Need CNC
            circle(d=mark_hole_diameter);
        }
        
        // Center hole
        translate([regulateur_length/2,regulateur_width/2]) {
            circle(d=screw_diameter);
            transmission_holes_2d();
        }
    }
}

module regulateur_end_3d() {
    // Piece which encapsulate a bearing at each end of the regulator.
    
    difference() {
        union() {
            translate([regulateur_width/2, regulateur_width/2])
                cylinder(d=regulateur_width, h=regulateur_thickness);
            
            translate([regulateur_width/2, 0])
                cube([regulateur_width,regulateur_width, regulateur_thickness]);
        }
        
        translate([regulateur_width/2, regulateur_width/2, -1])
            cylinder(d=bearing_hold_diameter, h=regulateur_thickness+2);
        
        translate([regulateur_width/2, regulateur_width/2, bearing_width/2])
            cylinder(d=bearing_diameter, h=bearing_width/2 + 1);
        
        translate([regulateur_width/2, regulateur_width/2, -1])
            clamping_holes_3d(regulateur_thickness);
    }
        
}

module regulateur_end_2d() {
    // Piece at which encapsulate a bearing at each end of the regulator.
    
    difference() {
        union() {
            translate([regulateur_width/2, regulateur_width/2])
                circle(d=regulateur_width);
            
            translate([regulateur_width/2, 0])
                square([regulateur_width,regulateur_width]);
        }
        
        // Hole
        translate([regulateur_width/2, regulateur_width/2])
            // Need CNC
            circle(d=mark_hole_diameter);
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
        translate([indicateur_width/2, indicateur_width/2, bearing_width/2]) {
            cylinder(d=bearing_diameter, h=bearing_width/2+1);
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

module indicateur_2d() {
    difference() {
        // Body
        union() {
            translate([indicateur_width/2, 0])
               square([indicateur_length - indicateur_width/2,indicateur_width]);
                    
            translate([indicateur_width/2, indicateur_width/2])
               circle(d=indicateur_width);
        }
    
        translate([indicateur_width/2, indicateur_width/2]) {
            // Need CNC
            circle(d=mark_hole_diameter);
            transmission_holes_2d();
        }
    }

}

module transmission_holes_2d() {
    translate([driving_hole_pitch,0])
        circle(d=driving_hole_diameter);
    translate([-driving_hole_pitch,0])
        circle(d=driving_hole_diameter);
}

module transmission_holes_3d(thickness) {
    translate([driving_hole_pitch,0])
        cylinder(d=driving_hole_diameter, h=thickness+2);
    translate([-driving_hole_pitch,0])
        cylinder(d=driving_hole_diameter, h=thickness+2);
}

module clamping_holes_3d(thickness) {
    translate([clamping_hole_shift,clamping_hole_pitch/2])
        cylinder(d=clamping_hole_diameter, h=thickness+2);
    translate([clamping_hole_shift,-clamping_hole_pitch/2])
        cylinder(d=clamping_hole_diameter, h=thickness+2);
}

module rondelle(diamInt, diamExt, thickness) {
    difference() {
        cylinder(d=diamExt, h=thickness);
        translate([0,0,-1])
            cylinder(d=diamInt, h=thickness + 2);
    }
} 

/*
translate([0,1*(gap + regulateur_width),0])
    regulateur_3d();

translate([0,0*(gap + regulateur_width),0])
    indicateur_3d();

translate([gap + indicateur_length,0*(gap + regulateur_width),0])
    indicateur_3d();
*/

if( mode == 1 ) {
    // 3D
//    regulateur_end_3d();
//    translate([gap + 3/2* regulateur_width, 0])
//        regulateur_end_3d();

    translate([0, gap + regulateur_width]) {

        indicateur_3d();
        translate([gap + indicateur_length, 0])
            indicateur_3d();

        translate([0,gap + indicateur_width])
            regulateur_3d();

    }
}

if( mode == 2 ) {
    // 2D
//    regulateur_end_2d();
//    translate([gap + 3/2* regulateur_width, 0])
//        regulateur_end_2d();

    translate([0, gap + regulateur_width]) {

        indicateur_2d();
        translate([gap + indicateur_length, 0])
            indicateur_2d();

        translate([0,gap + indicateur_width])
            regulateur_2d();

    }
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
