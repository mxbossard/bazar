$fn=100;

base_mode = 1; // Base fixation is inside the mount
//base_mode = 2; // Base fixation is outside the mount


loose_slack = 0.3;
tight_slack = 0.1;

mount_thickness = 5;
mount_depth = 40;
mount_base_height = 0;
mount_fixation_side_width = 15;
mount_fixation_hole_diameter = 4;
mount_inside_clearance_hole = 8;


nema_width = 42.3;
nema_height = 42.3;
nema_shaft_diameter = 25;
nema_fixation_center_to_center_length = 31;
nema_fixation_hole_diameter = 3;

// calculated

mount_inside_width = nema_width + 2*mount_thickness + 2*loose_slack;
mount_outside_width = mount_inside_width + 2*mount_fixation_side_width;
mount_height = nema_height + mount_base_height + 1*loose_slack;
nema_hole_to_border_length = (nema_width - nema_fixation_center_to_center_length) / 2;

module nema17_mount() {
    difference() {
        union() {
            // Base inside
            if ( base_mode == 1 ) {
                cube([mount_inside_width, mount_depth, mount_base_height]);
                translate([0, 0, mount_base_height])
                    cube([mount_fixation_side_width + mount_thickness, mount_depth, mount_thickness]);
                translate([mount_inside_width - mount_fixation_side_width - mount_thickness, 0, mount_base_height])
                    cube([mount_fixation_side_width + mount_thickness, mount_depth, mount_thickness]);
            }
            
            // Base "outside"
            if ( base_mode == 2 ) {
                translate([-mount_fixation_side_width, 0, 0]) {
                    cube([mount_outside_width, mount_depth, mount_base_height]);
                    translate([0, 0, mount_base_height])
                        cube([mount_fixation_side_width + mount_thickness, mount_depth, mount_thickness]);
                    translate([mount_outside_width - mount_fixation_side_width - mount_thickness, 0, mount_base_height])
                        cube([mount_fixation_side_width + mount_thickness, mount_depth, mount_thickness]);
                }
            }
            
            // Front holder
            cube([nema_width + 2*mount_thickness + 2*loose_slack, mount_thickness, mount_height]);
        }
        
        translate([mount_thickness, mount_thickness, -1])
        cube([mount_inside_width - 2*mount_thickness, mount_inside_clearance_hole, mount_thickness+2]);
        
        // Shaft hole
        translate([mount_thickness + nema_width/2, -1, mount_height - nema_height/2])
            rotate([-90, 0, 0])
                cylinder(d=nema_shaft_diameter, h=mount_depth+2);
        
        // Nema fixation holes
        translate([mount_thickness + nema_width/2 - nema_fixation_center_to_center_length/2, -1, mount_height - nema_hole_to_border_length]) {
            nema17_fixation_hole();
            translate([0, 0, -nema_fixation_center_to_center_length])
                nema17_fixation_hole();
            translate([nema_fixation_center_to_center_length, 0, 0])
                nema17_fixation_hole();
            translate([nema_fixation_center_to_center_length, 0, -nema_fixation_center_to_center_length])
                nema17_fixation_hole();
        }
        
        // Base fixation holes
        if ( base_mode == 1 ) {
            translate([mount_thickness + mount_fixation_side_width/2, mount_thickness + mount_inside_clearance_hole+ mount_fixation_hole_diameter, 0])
                base_fixation_hole(mount_depth - mount_thickness - 2*mount_fixation_hole_diameter - mount_inside_clearance_hole);
            translate([mount_inside_width - mount_thickness - mount_fixation_side_width/2, mount_thickness + mount_inside_clearance_hole + mount_fixation_hole_diameter, 0])
                base_fixation_hole(mount_depth - mount_thickness - 2*mount_fixation_hole_diameter - mount_inside_clearance_hole);
        }
        
        if ( base_mode == 2 ) {
            translate([-mount_fixation_side_width/2, mount_fixation_hole_diameter, 0])
                base_fixation_hole(mount_depth - 2*mount_fixation_hole_diameter);
            translate([mount_inside_width + mount_fixation_side_width/2, mount_fixation_hole_diameter, 0])
                base_fixation_hole(mount_depth - 2*mount_fixation_hole_diameter);
        }
    }
    
    // Enforcement
    mount_enforcement();
    
    translate([mount_inside_width - mount_thickness, 0, 0])
        mount_enforcement();
    
}

module mount_enforcement() {
    translate([mount_thickness, 0, 0])
    mirror([0,1,0])
    rotate([-90, 0, 0])
    rotate([180, 90, 0])
        linear_extrude(height = mount_thickness)
            polygon(points = [[mount_thickness, mount_base_height + mount_thickness], [mount_depth, mount_base_height + mount_thickness], [mount_thickness, mount_height]]);
}

module nema17_fixation_hole() {
    rotate([-90, 0, 0])
        cylinder(d=nema_fixation_hole_diameter+2*loose_slack, h=mount_thickness+2);
}

module base_fixation_hole(length = 10) {
    hull() {
        translate([0, mount_fixation_hole_diameter/2, -1]) {
            cylinder(d=mount_fixation_hole_diameter + 2*loose_slack, h=mount_height+2);
        
            translate([0, length - mount_fixation_hole_diameter, 0])
                cylinder(d=mount_fixation_hole_diameter + 2*loose_slack, h=mount_height+2);
        }
    }
}


nema17_mount();