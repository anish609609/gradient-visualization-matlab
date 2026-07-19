

%% ==========================================================
%% FUNCTION : f(x,y)=x^2+y^2
%% ==========================================================

[x,y] = meshgrid(linspace(-3,3,100));

z = x.^2 + y.^2;

%% ==========================================================
%% FIGURE 1 : SURFACE
%% ==========================================================

figure

surf(x,y,z)

shading interp
grid on

xlabel('x')
ylabel('y')
zlabel('f(x,y)')

title('f(x,y)=x^2+y^2')

view(45,30)

%% ==========================================================
%% FIGURE 2 : GRADIENT FIELD
%% ==========================================================

figure

[xg,yg] = meshgrid(-3:0.5:3,-3:0.5:3);

Fx = 2*xg;
Fy = 2*yg;

quiver(xg,yg,Fx,Fy,0,...
    'LineWidth',1.5)

grid on
axis equal

xlabel('x')
ylabel('y')

title('\nabla f=(2x,2y)')

%% ==========================================================
%% FIGURE 3 : GRADIENTS ON SURFACE
%% ==========================================================

figure

surf(x,y,z)

shading interp
hold on
grid on

[xp,yp] = meshgrid(-2.5:0.5:2.5,...
    -2.5:0.5:2.5);

zp = xp.^2 + yp.^2;

Fx = 2*xp;
Fy = 2*yp;

scale = 0.15;

quiver3(xp,yp,zp,...
    scale*Fx,...
    scale*Fy,...
    zeros(size(Fx)),...
    0,...
    'k',...
    'LineWidth',1.2)

xlabel('x')
ylabel('y')
zlabel('f(x,y)')

title('Gradient vectors on surface')

view(45,30)