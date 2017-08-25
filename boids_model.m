% simple boids simulation
boids_count=75;
boids=Boid.empty;
for i=1:boids_count
   boids(i)=Boid(rand*640/3,rand*360/3);
end



flock=Flock(boids,[640/3 360/3]);
f = figure;
plane = Plane(f,[640/3 360/3],boids);
flock.run(plane);

