[Totlabels, Totfeatures] = libsvmread('data.txt');
classi = svmtrain(Totlabels, Totfeatures, '-s 0 -t 0 -c 5');
pos = find(Totlabels == 1);
neg = find(Totlabels == -1);
svmdata = load('svmData.txt');
w = classi.SVs' * classi.sv_coef;
b = -classi.rho;
if (classi.Label(1) == -1)
    w = -w; b = -b;
end
plot(svmdata(pos, 2), svmdata(pos,3), '+r')
hold on
plot(svmdata(neg, 2), svmdata(neg,3), 'xg')
xp = linspace(min(Totfeatures(:,1)), max(Totfeatures(:,1)), 100);
yp = - (w(1)*xp + b)/w(2);
plot(xp, yp, '-b');
