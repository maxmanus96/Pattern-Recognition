%H�SEY�N H�RKAN KARAMAN 1030516163 1.��retim A grubu
%SEM�H CAN BOZOK 1030516177 1.��retim A Grubu
%TIMAN AHMAT DJEROU 1030516145 1.��retim A Grubu
function [AttributesTest, ClassificationsTest] = Untitled7()

C = dlmread('test_class.txt');
D = dlmread('test_data.txt');
E = [D C];

Dimensions=size(E);
ClassificationsTest = E(:,Dimensions(2));
AttributesTest = [];

for i=2:Dimensions(2)-1
    AttributesTest = [AttributesTest E(:,i)];
end