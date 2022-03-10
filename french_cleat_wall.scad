// Sizes in cm

wall_height = 150;
wall_width = 250;
wall_heith_first_cleat = 20;

cleat_width = 9.8/2;
cleat_thickness = 2;
cleat_length = 250;
cleat_angle = 45; // In degree
cleat_semi_delta = cleat_thickness/2;
cleat_interval = (cleat_width + cleat_semi_delta) * 2 + 1.5;


module wall() {
    color("LightGrey", 1.0) {
        square([wall_width, wall_height]);
    };
}

module cleat() {
    translate([0, 0, 0.5])
    rotate([90,90,90]) {
        linear_extrude(cleat_length) {
            polygon(points=[[0,0],[-cleat_thickness,0],[-cleat_thickness,cleat_width + cleat_semi_delta],[0,cleat_width - cleat_semi_delta]]);
    }
}
}

wall();

for(y = [wall_heith_first_cleat : cleat_interval : wall_height-cleat_width*3]) {
    translate([0, y, 0])
        cleat();
}