%H�SEY�N H�RKAN KARAMAN 1030516163 1.��retim A grubu
%SEM�H CAN BOZOK 1030516177 1.��retim A Grubu
%TIMAN AHMAT DJEROU 1030516145 1.��retim A Grubu
function [Attributes, Classifications] = Untitled6()
C = dlmread('train_class.txt');
D = dlmread('train_data.txt');
E = [D C];

Dimensions=size(E);
Classifications = E(:,Dimensions(2));
Attributes = [];

for i=2:Dimensions(2)-1
    Attributes = [Attributes E(:,i)];
end


