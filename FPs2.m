close

a = 1/4;

s = sqrt(1 - 4*a);

pf_p = (1 + s)/2;
pf_m = (1 - s)/2;

lambda_1_p = (s + sqrt(s^2 + 4*s))/2;
lambda_2_p = (s - sqrt(s^2 + 4*s))/2;

x1 = pf_p-0.5:0.1:pf_p+0.5;
x2 = pf_p-0.1:0.1:pf_p+0.1;

v1_p = 1/(1 + lambda_1_p)*x1 + pf_p*(1 - 1/(1 + lambda_1_p)); 
v2_p = 1/(1 + lambda_2_p)*x2 + pf_p*(1 - 1/(1 + lambda_2_p));

[x, y] = meshgrid(-3:0.1:3, -4:0.1:4);

u = x.^2 - y + a;
v = x - y;

z = -4:0.1:4;

nlx = z.^2 + a;
nly = z;
figure(Color="w");
ax = axes(Color="w", XColor="k", YColor="k", GridColor="k");
hold(ax, "on");

xline(0, 'Color', '#555555');
yline(0, 'Color', '#555555');
l = streamslice(x, y, u, v, 2 );
set(l, 'Color', 'b')
plot(z, nlx, 'Color', '#ff8c00', ...
    'LineStyle', '--', ...
    'linewidth', 1);
plot(z, nly, 'Color', '#ff00ff', 'LineStyle', '--');
plot(x1, v1_p, 'r', 'linewidth', 0.8);
plot(x2, v2_p, 'g', 'linewidth', 0.8);

plot(pf_p, pf_p, 'o', 'MarkerSize', 3,...
    'MarkerEdgeColor', 'r',...
    'MarkerFaceColor',"r");
plot(pf_m, pf_m, 'o', 'MarkerSize', 3,...
    'MarkerEdgeColor', 'r',...
    'MarkerFaceColor',"r");


axis(ax, "equal")
axis([-3 3 -2.5 3.5])

grid(ax, "on")
