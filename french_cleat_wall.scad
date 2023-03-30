// Sizes in cm

wall_height = 150;
wall_width = 250;
wall_heith_first_cleat = 20;

planche_width = 18.5;
nCut = 4;
cutWidth = 0.3;

cleat_width = (planche_width - 0.3 * (nCut-1)) / nCut;
cleat_thickness = 2;
cleat_length = 250;
cleat_angle = 45; // In degree
cleat_semi_delta = cleat_thickness/2;
cleat_interval = (cleat_width + cleat_semi_delta) * 2 + 2;

echo("Cleat width (min, max): ", cleat_width - cleat_semi_delta, cleat_width + cleat_semi_delta );
echo("Void width: ", cleat_interval - cleat_width - cleat_semi_delta);
echo("Cleat interval: ", cleat_interval);

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