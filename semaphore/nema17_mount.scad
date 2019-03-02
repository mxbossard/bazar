$fn=100;

loose_slack = 0.3;
tight_slack = 0.1;

mount_thickness = 5;
mount_depth = 50;
mount_base_height = 0;
mount_fixation_side_width = 15;
mount_fixation_hole_diameter = 4;


nema_width = 42.3;
nema_height = 42.3;
nema_fixation_center_to_center_length = 31;
nema_fixation_hole_diameter = 3;

// calculated
mount_width = nema_width + 2*mount_thickness + 2*mount_fixation_side_width + 2*loose_slack;
mount_height = nema_height + mount_base_height + 2*loose_slack;
nema_hole_to_border_length = (nema_width - nema_fixation_center_to_center_length) / 2;

module nema17_mount() {
    difference() {
        union() {
            // Base
            cube([mount_width, mount_depth, mount_base_height]);
            translate([0, 0, mount_base_height])
                cube([mount_fixation_side_width + mount_thickness, mount_depth, mount_thickness]);
            translate([mount_width - mount_fixation_side_width - mount_thickness, 0, mount_base_height])
                cube([mount_fixation_side_width + mount_thickness, mount_depth, mount_thickness]);
            
            // Front holder
            translate([mount_fixation_side_width, 0, 0])
                cube([nema_width + 2*mount_thickness + 2*loose_slack, mount_thickness, mount_height]);
        }
        
        // Nema fixation holes
        translate([mount_width/2 - nema_fixation_center_to_center_length/2, -1, mount_height - nema_hole_to_border_length]) {
            nema17_fixation_hole();
            translate([0, 0, -nema_fixation_center_to_center_length])
                nema17_fixation_hole();
            translate([nema_fixation_center_to_center_length, 0, 0])
                nema17_fixation_hole();
            translate([nema_fixation_center_to_center_length, 0, -nema_fixation_center_to_center_length])
                nema17_fixation_hole();
        }
        
        // Base fixation holes
        translate([mount_fixation_side_width/2, 0, 0])
            base_fixation_hole();
        translate([mount_width - mount_fixation_side_width/2, 0, 0])
            base_fixation_hole();
    }
    
    // Enforcement
    translate([mount_fixation_side_width + mount_thickness, 0, 0])
        mount_enforcement();
    
    translate([mount_width - mount_fixation_side_width, 0, 0])
        mount_enforcement();
    
}

module mount_enforcement() {
    mirror([0,1,0])
    rotate([-90, 0, 0])
    rotate([180, 90, 0])
        linear_extrude(height = mount_thickness)
            polygon(points = [[mount_thickness, mount_base_height + mount_thickness], [mount_depth, mount_base_height + mount_thickness], [mount_thickness, mount_height]]);
}

module nema17_fixation_hole() {
    rotate([-90, 0, 0])
        cylinder(d=nema_fixation_hole_diameter+2*loose_slack, h=mount_depth+2);
}

module base_fixation_hole() {
    hull() {
        translate([0, mount_fixation_side_width/2, -1])
            cylinder(d=mount_fixation_hole_diameter + 2*loose_slack, h=mount_height+2);
        
        translate([0, mount_depth - mount_fixation_side_width/2, -1])
            cylinder(d=mount_fixation_hole_diameter + 2*loose_slack, h=mount_height+2);
    }
}


nema17_mount();