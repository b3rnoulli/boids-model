# boids
Boids - MATLAB

Boids is an artificial life program, developed by Craig Reynolds in 1986, which simulates the flocking behaviour of birds. 
His paper on this topic was published in 1987 in the proceedings of the ACM SIGGRAPH conference. The name "boid" corresponds to a 
shortened version of "bird-oid object", which refers to a bird-like object:

Rules applied in simple Boids
As with most artificial life simulations, Boids is an example of emergent behavior; that is, the complexity of Boids arises from the interaction of individual agents (the boids, in this case) adhering to a set of simple rules. The rules applied in the simplest Boids world are as follows:

* separation: steer to avoid crowding local flockmates
* alignment: steer towards the average heading of local flockmates
* cohesion: steer to move toward the average position (center of mass) of local flockmates

__Example simulation result for 75 boids:__

*Initial state
![alt tag](https://raw.github.com/b3rnoulli/boids/master/images/boids_initial.png)
*After 20 time steps
![alt tag](https://raw.github.com/b3rnoulli/boids/master/images/boids_20_step.png)
*After 100 time steps
![alt tag](https://raw.github.com/b3rnoulli/boids/master/images/boids_100_step.png)

For more information on Boid, please see:\
[1] Reynolds, Craig (1987). "Flocks, herds and schools: A distributed behavioral model.". SIGGRAPH '87: Proceedings of the 14th annual conference on Computer graphics and interactive techniques. Association for Computing Machinery

