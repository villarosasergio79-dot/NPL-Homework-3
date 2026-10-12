close

a = 1/4;

s = sqrt(1 - 4*a);

pf_p = (1 + s)/2;

lambda_1_p = (s + sqrt(s^2 + 4*s))/2;
lambda_2_p = (s - sqrt(s^2 + 4*s))/2;

x1 = pf_p-0.5:0.1:pf_p+0.5;
x2 = pf_p-0.1:0.1:pf_p+0.1;

v1_p = 1/(1 + lambda_1_p)*x1 + pf_p*(1 - 1/(1 + lambda_1_p)); 
v2_p = 1/(1 + lambda_2_p)*x2 + pf_p*(1 - 1/(1 + lambda_2_p));

[x, y] = meshgrid(pf_p-1:0.1:pf_p+1, pf_p-1:0.1:pf_p+1);
u = x.^2 - y + a;
v = x - y;

figure(Color="w");
ax = axes(Color="w", XColor="k", YColor="k", GridColor="k");
hold(ax, "on");

plot(x1, v1_p, 'r', 'linewidth', 2);
plot(x2, v2_p, 'g', 'linewidth', 2);
plot(pf_p, pf_p, 'o', 'MarkerFaceColor',"r");

l = streamslice(x, y, u, v, 1.8);
set(l, 'Color', 'b')

axis(ax, "equal")

grid(ax, "on")
