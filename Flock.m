classdef Flock
    %FLOCK Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        boids
        lattice_size
        step_counter=1;
    end
    
    methods
        
        function obj = Flock(boids,lattice_size)
            obj.boids=boids;
            obj.lattice_size=lattice_size;
        end
        
        function run(obj, plane)
            while true
                obj = flock(obj);
                obj = update_boids(obj);
                obj = borders(obj);
                [obj,plane] = render(obj,plane);
            end
        end
        
        function obj = update_boids(obj)
            for i=1:length(obj.boids)
                obj.boids(i)=obj.boids(i).update();
            end
        end
        
        function obj = flock(obj)
            for i=1:length(obj.boids)
                obj.boids(i)=obj.boids(i).flock(obj.boids);
            end
        end
        
        
        function [obj,plane] = render(obj,plane)
            obj.step_counter=obj.step_counter+1;
            fprintf('Rendering %s \n',num2str(obj.step_counter))
           
            for i=1:length(obj.boids)
                delete(plane.boids_figure_handles(i));
                theta = atan2(norm(cross([obj.boids(i).velocity 0],[1 0 0])),dot([obj.boids(i).velocity 0],[1 0 0]));
                x = [obj.boids(i).position(1)-2.5 obj.boids(i).position(1)+2.5 obj.boids(i).position(1)-2.5 obj.boids(i).position(1)-2.5];
                y = [obj.boids(i).position(2)-1.5 obj.boids(i).position(2) obj.boids(i).position(2)+1.5 obj.boids(i).position(2)+1.5];
                plane.boids_figure_handles(i) =  patch(x,y,'k');
                rotate(plane.boids_figure_handles(i), [0 0 1], rad2deg(theta), [obj.boids(i).position(1) obj.boids(i).position(2) 0]);
            end
            drawnow;
        end
        
        function obj = borders(obj)
            for i=1:length(obj.boids)
                obj.boids(i) = obj.boids(i).borders(obj.lattice_size);
            end
        end
        
        %           void render() {
        %     // Draw a triangle rotated in the direction of velocity
        %     float theta = velocity.heading2D() + radians(90);
        %     // heading2D() above is now heading() but leaving old syntax until Processing.js catches up
        %
        %     fill(200, 100);
        %     stroke(255);
        %     pushMatrix();
        %     translate(position.x, position.y);
        %     rotate(theta);
        %     beginShape(TRIANGLES);
        %     vertex(0, -r*2);
        %     vertex(-r, r*2);
        %     vertex(r, r*2);
        %     endShape();
        %     popMatrix();
        %   }
        
    end
    
end

