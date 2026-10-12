close

a=1/4;

s = sqrt(1 - 4*a);
pf_m = (1 - s)/2;

lambda_1_m = (-s + sqrt(s^2 - 4*s))/2;
lambda_2_m = (-s - sqrt(s^2 - 4*s))/2;

x1 = pf_m-0.1:0.1:pf_m+0.1;
x2 = pf_m-0.5:0.1:pf_m+0.5;

v1_m = 1/(1 + lambda_1_m)*x1 + pf_m*(1 - 1/(1 + lambda_1_m)); 
v2_m = 1/(1 + lambda_2_m)*x2 + pf_m*(1 - 1/(1 + lambda_2_m));

[x, y] = meshgrid(pf_m-1:0.1:pf_m+1, pf_m-1:0.1:pf_m+1);
u = x.^2 - y + a;
v = x - y;

figure(Color="w");
ax = axes(Color="w", XColor="k", YColor="k", GridColor="k");
hold(ax, "on");

l = streamslice(x, y, u, v, 2.5);
%plot(x1, v1_m, 'Color', "#ff00ff", 'linewidth', 2);
%plot(x2, v2_m, 'g', 'linewidth', 2);
plot(pf_m, pf_m, 'o', MarkerFaceColor="r");


set(l, 'Color', 'b')
axis(ax, "equal")
axis(ax, "tight")
grid(ax, "on")