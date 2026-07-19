

%% ==========================================================
%% FUNCTION : f(x,y) = x^2
%% ==========================================================

[x,y] = meshgrid(linspace(-3,3,100));

z = x.^2;

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

title('Surface : f(x,y)=x^2')

view(45,30)

%% ==========================================================
%% FIGURE 2 : COMPLETE GRADIENT FIELD
%% ==========================================================

figure('Position',[150 150 900 700])

[xg,yg] = meshgrid(-3:0.5:3,-3:0.5:3);

% Gradient components
Fx = 2*xg;
Fy = zeros(size(yg));

quiver(xg,yg,Fx,Fy,0,...
       'LineWidth',1.5)

grid on
axis equal

xlabel('x')
ylabel('y')

title('Gradient Field : \nabla f = (2x,0)')

xlim([-10 10])
ylim([-4 4])

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

title('Gradient Vectors on f(x,y)=x^2')

%% Dense grid of points

[xp,yp] = meshgrid(-2.5:0.5:2.5,...
                   -2.5:0.5:2.5);

zp = xp.^2;

%% Gradient

Fx = 2*xp;
Fy = zeros(size(xp));

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