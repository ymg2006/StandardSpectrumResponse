function plotRange(HighRisk)
if ~exist('HighRisk','var')
      HighRisk = 0;
 end

 MaxTime = 5; %seconds

fplot(Albedo(1,HighRisk), [0 MaxTime], 'Color', 'red');
hold on;
fplot(Albedo(2,HighRisk), [0 MaxTime], 'Color', 'blue');
hold on;
fplot(Albedo(3,HighRisk), [0 MaxTime], 'Color', '#EDB120');
hold on;
fplot(Albedo(4,HighRisk), [0 MaxTime], 'Color', 'black');

if (HighRisk)
    t = title('خطر نسبی زیاد و خیلی زیاد');
else
    t = title('خطر نسبی کم و متوسط');
end
set(t,'FontName','Microsoft Uighur', 'FontSize', 15);

grid on
grid minor

ax = gca;
ax.XAxis.MinorTickValues = 0:0.05:MaxTime;
ax.YAxis.MinorTickValues = 0:0.05:MaxTime;
ax.GridAlpha = 1;
ax.MinorGridAlpha = 0.9;

ax.YLim = [0, round(ax.YLim(2)/0.5)*0.5];

xlabel('B');
ylabel('T');

legend({'I','II', 'III', 'IV'},'Location','northeast');
end