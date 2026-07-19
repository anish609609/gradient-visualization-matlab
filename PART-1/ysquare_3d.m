

%% ==========================================================
%% FUNCTION : f(x,y) = y^2
%% ==========================================================

[x,y] = meshgrid(linspace(-3,3,100));

z = y.^2;

%% ==========================================================
%% FIGURE 1 : SURFACE ONLY
%% ==========================================================

figure('Position',[100 100 900 700])

surf(x,y,z)

shading interp
grid on

xlabel('x')
ylabel('y')
zlabel('f(x,y)')

title('Surface : f(x,y)=y^2')

view(45,30)

%% ==========================================================
%% FIGURE 2 : COMPLETE GRADIENT FIELD
%% Gradient = (0,2y)
%% ==========================================================

figure('Position',[150 150 900 700])

[xg,yg] = meshgrid(-3:0.5:3,-3:0.5:3);

Fx = zeros(size(xg));
Fy = 2*yg;

quiver(xg,yg,Fx,Fy,0,...
    'LineWidth',1.5)

grid on
axis equal

xlabel('x')
ylabel('y')

title('Gradient Field : \nabla f = (0,2y)')

xlim([-4 4])
ylim([-10 10])

%% ==========================================================
%% FIGURE 3 : DENSE GRADIENT VECTORS ON THE SURFACE
%% ==========================================================

figure('Position',[200 200 1000 700])

surf(x,y,z)

shading interp
hold on
grid on

xlabel('x')
ylabel('y')
zlabel('f(x,y)')

title('Gradient Vectors on f(x,y)=y^2')

%% Dense grid of points

[xp,yp] = meshgrid(-2.5:0.5:2.5,...
    -2.5:0.5:2.5);

zp = yp.^2;

%% Gradient

Fx = zeros(size(xp));
Fy = 2*yp;

%% Visual scale

scale = 0.20;

quiver3(xp,yp,zp,...
    scale*Fx,...
    scale*Fy,...
    zeros(size(Fx)),...
    0,...
    'k',...
    'LineWidth',1.5);

view(45,30)