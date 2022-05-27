wide = 50;
// cutout_dim = wide/2;
hole_height = 8.5;
m2_insert_d = 3;
m2_insert_blind_hole_depth = 5;
cut_angle = 45;

$fn=50;

razor();
difference(){
    body();
    cutout();

    //section off bottom
    translate([0, 0, -2*wide + wide/6])
    cube(4*wide, center=true);

    // translate([0, (2.354)*wide, 0])
    translate([0, (2*wide + wide * sqrt(2) / 4), 0])
    cube(4*wide, center=true);
}

module razor(){
    // color("silver", 0.5)
    rotate([cut_angle, 0, 0])
    translate([0, hole_height, wide/2])
    %cube([40, 20, 1], center=true);
}

module body(){
    rotate([45, 0, 0])
    difference(){
        cube(wide, center=true);
        translate([0, hole_height, wide / 2])
        m2_insert_hole();
        translate([0, wide / 2, hole_height])
        rotate([90, 0, 0])
        m2_insert_hole();

    }

    module m2_insert_hole(){
        cylinder(d=m2_insert_d, h=m2_insert_blind_hole_depth*2, center=true);
    }
}

module cutout(){
    rotate([0, 45, 0])
    union(){
        cube([wide / 2, 3 * wide, wide / 2], center=true);
        translate([-wide / 4, 0, wide / 4])
        rotate([0, 45, 0])
        cube([1, 3 * wide, 1], center=true);
    }
}