$fn = 100;

//entretoise_ep = 1;
entretoise_diam_int = 4.8;
//entretoise_diam_ext = entretoise_diam_int + 2*entretoise_ep;
entretoise_diam_ext = 8;
entretoise_long = 7;

difference() {
    cylinder(d=entretoise_diam_ext, h=entretoise_long);
    
    translate([0,0,-1])
        cylinder(d=entretoise_diam_int, h=entretoise_long + 2);
}