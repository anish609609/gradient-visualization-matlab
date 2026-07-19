% 1. Define the x and y grid
[X, Y] = meshgrid(-5:0.5:5, -5:0.5:5);   % Slightly coarser grid for arrows

% 2. Calculate the cubic functions
Z1 = X.^3;
Z2 = Y.^3;

%% -------- FIGURE 1: f(x,y) = x^3 --------
figure(1);
surf(X,Y,Z1);
colormap(parula);
shading interp;
hold on;

% Gradient: [3x^2, 0]
dfdx = 3*X.^2;
dfdy = zeros(size(X));

% Normalize arrows (optional, for better visualization)
mag = sqrt(dfdx.^2 + dfdy.^2);
dfdx = dfdx ./ (mag + eps);
dfdy = dfdy ./ (mag + eps);

% Overlay gradient vectors
quiver3(X,Y,Z1,dfdx,dfdy,zeros(size(Z1)),0.5,'k','LineWidth',1.2);

xlabel('X Axis (The Cubic S-Curve Changes Here)');
ylabel('Y Axis (Flat / Stays Constant)');
zlabel('Z Axis (Z = X^3)');
title('Surface Plot of f(x,y)=x^3 with Gradient Vectors');
grid on;
view(3);

%% -------- FIGURE 2: f(x,y) = y^3 --------
figure(2);
surf(X,Y,Z2);
colormap(hot);
shading interp;
hold on;

% Gradient: [0, 3y^2]
dfdx = zeros(size(X));
dfdy = 3*Y.^2;

% Normalize arrows
mag = sqrt(dfdx.^2 + dfdy.^2);
dfdx = dfdx ./ (mag + eps);
dfdy = dfdy ./ (mag + eps);

% Overlay gradient vectors
quiver3(X,Y,Z2,dfdx,dfdy,zeros(size(Z2)),0.5,'k','LineWidth',1.2);

xlabel('X Axis (Flat / Stays Constant)');
ylabel('Y Axis (The Cubic S-Curve Changes Here)');
zlabel('Z Axis (Z = Y^3)');
title('Surface Plot of f(x,y)=y^3 with Gradient Vectors');
grid on;
view(3);