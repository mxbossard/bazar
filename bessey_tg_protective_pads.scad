c_height = 7.2;
c_radius = 17;
c_internal_radius = 15;
c_width = 1;

r_width = 33;
r_length = 40;
r_height = 7;
r_side_arrow = 8.5;
r_side_width = 4.2;
r_bottom_thickness = 2.2;
r_side_thickness = 1;
r_top_thickness = 2;
r_internal_angle_length = 8;
r_internal_angle_width = 5;
// Calculation of radius from arrow & width
r_side_radius = pow(r_width,2)/(8*r_side_arrow)+r_side_arrow/2;

module circlePad() {
    rotate_extrude($fn=200)
    polygon([[0,0],[c_radius,0],[c_radius,c_height],[c_internal_radius,c_height-2*c_width],[c_radius-c_width,c_height-2*c_width],[c_radius-c_width,c_width],[0,c_width]]);
}

module rectanglePadBase() {
    intersection() {
        union() {
            translate([r_side_radius-r_side_arrow, r_width/2, 0])
            cylinder(r_height, r_side_radius, r_side_radius);

            translate([r_length+r_side_arrow-r_side_radius, r_width/2, 0])
            cylinder(r_height, r_side_radius, r_side_radius);
        };

        translate([-r_side_arrow,0,0])
            cube([r_length+2*r_side_arrow,r_width,r_height]);
    };
}

module suspendedChemfer() {
    //color("red")
    translate([3/2*r_length,0,r_height-r_top_thickness])
    rotate([0,-90,0])
    linear_extrude(r_length*2)
    polygon([[0,0],[0,r_side_width],[r_top_thickness,r_side_width-r_top_thickness],[r_top_thickness,0]]);
}

module rectanglePad() {
    difference() {
        
        rectanglePadBase();

        union() {
            translate([0,0,r_bottom_thickness])
            linear_extrude(r_height)
            union() {
                polygon([[r_length,r_side_thickness],[r_length+r_internal_angle_length*(r_width-2*r_side_width)/2/r_internal_angle_width,r_width/2],[r_length,r_width-r_side_thickness]]);
                polygon([[0,r_side_thickness],[-r_internal_angle_length*(r_width-2*r_side_width)/2/r_internal_angle_width,r_width/2],[0,r_width-r_side_thickness]]);
                translate([0,r_side_thickness,0])
                    square([r_length, r_width-2*r_side_thickness]);
            }
        }
    }
    
    // Suspended chamfer
    suspendedChemfer();
    translate([0,r_width,0])
    mirror([0,1,0])
    suspendedChemfer();
}

translate([r_length/2,r_width + 30,0])
circlePad();

intersection() {
    rectanglePadBase();
    rectanglePad();
}
