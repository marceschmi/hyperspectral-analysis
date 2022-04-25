%--------------------------------------------------------------------------
% Copyright (c) 2022 Marcel Schmidt
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU Affero General Public License as published
% by the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU Affero General Public License for more details.
%
% You should have received a copy of the GNU Affero General Public License
% along with this program.  If not, see <https://www.gnu.org/licenses/>.
%--------------------------------------------------------------------------
function fit_objekt = create_fit_objekt(grade,typ,parameter)
switch typ
    case 3
        fit_mode = 'gauss';
    case 4
        fit_mode = 'pseudo-voigt';
end
 
switch grade
    case 1
        switch fit_mode
            case 'gauss'
                fitType = fittype('gauss1');
                [a1,x0_1,w1] = deal(parameter(1),parameter(2),parameter(3));
                fit_objekt = cfit(fitType,a1,x0_1,w1);
            case 'pseudo-voigt'
                fitType = fittype(@(a1,x0_1,w1,n1,x) a1.*(n1.*exp(-log(2).*((x-x0_1)./w1).^2)+(1-n1)./(1+((x-x0_1)./w1).^2)));
                [a1,x0_1,w1,n1] = deal(parameter(1),parameter(2),parameter(3),parameter(4));
                fit_objekt = cfit(fitType,a1,x0_1,w1,n1);
        end
    case 2
        switch fit_mode
            case 'gauss'
                fitType = fittype('gauss2');
                [a1,x0_1,w1,a2,x0_2,w2] = deal(parameter(1),parameter(2),parameter(3),...
                    parameter(4),parameter(5),parameter(6));
                fit_objekt = cfit(fitType,a1,x0_1,w1,a2,x0_2,w2);
            case 'pseudo-voigt'
                fitType = fittype(@(a1,x0_1,w1,n1,a2,x0_2,w2,n2,x) a1.*(n1.*exp(-log(2).*((x-x0_1)./w1).^2)+(1-n1)./(1+((x-x0_1)./w1).^2))...
                    +a2.*(n2.*exp(-log(2).*((x-x0_2)./w2).^2)+(1-n2)./(1+((x-x0_2)./w2).^2)));
                [a1,x0_1,w1,n1,a2,x0_2,w2,n2] = deal(parameter(1),parameter(2),parameter(3),parameter(4),...
                    parameter(5),parameter(6),parameter(7),parameter(8));
                fit_objekt = cfit(fitType,a1,x0_1,w1,n1,a2,x0_2,w2,n2);
        end
    case 3
        switch fit_mode
            case 'gauss'
                fitType = fittype('gauss3');
                [a1,x0_1,w1,a2,x0_2,w2,a3,x0_3,w3] = deal(parameter(1),parameter(2),parameter(3),...
                    parameter(4),parameter(5),parameter(6),...
                    parameter(7),parameter(8),parameter(9));
                fit_objekt = cfit(fitType,a1,x0_1,w1,a2,x0_2,w2,a3,x0_3,w3);
            case 'pseudo-voigt'
                fitType = fittype(@(a1,x0_1,w1,n1,a2,x0_2,w2,n2,a3,x0_3,w3,n3,x) a1.*(n1.*exp(-log(2).*((x-x0_1)./w1).^2)+(1-n1)./(1+((x-x0_1)./w1).^2))...
                    +a2.*(n2.*exp(-log(2).*((x-x0_2)./w2).^2)+(1-n2)./(1+((x-x0_2)./w2).^2))...
                    +a3.*(n3.*exp(-log(2).*((x-x0_3)./w3).^2)+(1-n3)./(1+((x-x0_3)./w3).^2)));
                [a1,x0_1,w1,n1,a2,x0_2,w2,n2,a3,x0_3,w3,n3] = deal(parameter(1),parameter(2),parameter(3),parameter(4),...
                    parameter(5),parameter(6),parameter(7),parameter(8),...
                    parameter(9),parameter(10),parameter(11),parameter(12));
                fit_objekt = cfit(fitType,a1,x0_1,w1,n1,a2,x0_2,w2,n2,a3,x0_3,w3,n3);
        end
    case 4
        switch fit_mode
            case 'gauss'
                fitType = fittype('gauss4');
                [a1,x0_1,w1,a2,x0_2,w2,a3,x0_3,w3,a4,x0_4,w4] = deal(parameter(1),parameter(2),parameter(3),...
                    parameter(4),parameter(5),parameter(6),...
                    parameter(7),parameter(8),parameter(9),...
                    parameter(10),parameter(11),parameter(12));
                fit_objekt = cfit(fitType,a1,x0_1,w1,a2,x0_2,w2,a3,x0_3,w3,a4,x0_4,w4);
            case 'pseudo-voigt'
                fitType = fittype(@(a1,x0_1,w1,n1,a2,x0_2,w2,n2,a3,x0_3,w3,n3,a4,x0_4,w4,n4,x) a1.*(n1.*exp(-log(2).*((x-x0_1)./w1).^2)+(1-n1)./(1+((x-x0_1)./w1).^2))...
                    +a2.*(n2.*exp(-log(2).*((x-x0_2)./w2).^2)+(1-n2)./(1+((x-x0_2)./w2).^2))...
                    +a3.*(n3.*exp(-log(2).*((x-x0_3)./w3).^2)+(1-n3)./(1+((x-x0_3)./w3).^2))...
                    +a4.*(n4.*exp(-log(2).*((x-x0_4)./w4).^2)+(1-n4)./(1+((x-x0_4)./w4).^2)));
                [a1,x0_1,w1,n1,a2,x0_2,w2,n2,a3,x0_3,w3,n3,a4,x0_4,w4,n4] = deal(parameter(1),parameter(2),parameter(3),parameter(4),...
                    parameter(5),parameter(6),parameter(7),parameter(8),...
                    parameter(9),parameter(10),parameter(11),parameter(12),...
                    parameter(13),parameter(14),parameter(15),parameter(16));
                fit_objekt = cfit(fitType,a1,x0_1,w1,n1,a2,x0_2,w2,n2,a3,x0_3,w3,n3,a4,x0_4,w4,n4);
        end
    case 5
        switch fit_mode
            case 'gauss'
                fitType = fittype('gauss5');
                [a1,x0_1,w1,a2,x0_2,w2,a3,x0_3,w3,a4,x0_4,w4,a5,x0_5,w5] = deal(parameter(1),parameter(2),parameter(3),...
                    parameter(4),parameter(5),parameter(6),...
                    parameter(7),parameter(8),parameter(9),...
                    parameter(10),parameter(11),parameter(12),...
                    parameter(13),parameter(14),parameter(15));
                fit_objekt = cfit(fitType,a1,x0_1,w1,a2,x0_2,w2,a3,x0_3,w3,a4,x0_4,w4,a5,x0_5,w5);
            case 'pseudo-voigt'
                fitType = fittype(@(a1,x0_1,w1,n1,a2,x0_2,w2,n2,a3,x0_3,w3,n3,a4,x0_4,w4,n4,a5,x0_5,w5,n5,x) a1.*(n1.*exp(-log(2).*((x-x0_1)./w1).^2)+(1-n1)./(1+((x-x0_1)./w1).^2))...
                    +a2.*(n2.*exp(-log(2).*((x-x0_2)./w2).^2)+(1-n2)./(1+((x-x0_2)./w2).^2))...
                    +a3.*(n3.*exp(-log(2).*((x-x0_3)./w3).^2)+(1-n3)./(1+((x-x0_3)./w3).^2))...
                    +a4.*(n4.*exp(-log(2).*((x-x0_4)./w4).^2)+(1-n4)./(1+((x-x0_4)./w4).^2))...
                    +a5.*(n5.*exp(-log(2).*((x-x0_5)./w5).^2)+(1-n5)./(1+((x-x0_5)./w5).^2)));
                [a1,x0_1,w1,n1,a2,x0_2,w2,n2,a3,x0_3,w3,n3,a4,x0_4,w4,n4,a5,x0_5,w5,n5] = deal(parameter(1),parameter(2),parameter(3),parameter(4),...
                    parameter(5),parameter(6),parameter(7),parameter(8),...
                    parameter(9),parameter(10),parameter(11),parameter(12),...
                    parameter(13),parameter(14),parameter(15),parameter(16),...
                    parameter(17),parameter(18),parameter(19),parameter(20));
                fit_objekt = cfit(fitType,a1,x0_1,w1,n1,a2,x0_2,w2,n2,a3,x0_3,w3,n3,a4,x0_4,w4,n4,a5,x0_5,w5,n5);
        end
    case 6
        switch fit_mode
            case 'gauss'
                fitType = fittype('gauss6');
                [a1,x0_1,w1,a2,x0_2,w2,a3,x0_3,w3,a4,x0_4,w4,a5,x0_5,w5,a6,x0_6,w6] = deal(parameter(1),parameter(2),parameter(3),...
                    parameter(4),parameter(5),parameter(6),...
                    parameter(7),parameter(8),parameter(9),...
                    parameter(10),parameter(11),parameter(12),...
                    parameter(13),parameter(14),parameter(15),...
                    parameter(16),parameter(17),parameter(18));
                fit_objekt = cfit(fitType,a1,x0_1,w1,a2,x0_2,w2,a3,x0_3,w3,a4,x0_4,w4,a5,x0_5,w5,a6,x0_6,w6);
            case 'pseudo-voigt'
                fitType = fittype(@(a1,x0_1,w1,n1,a2,x0_2,w2,n2,a3,x0_3,w3,n3,a4,x0_4,w4,n4,a5,x0_5,w5,n5,a6,x0_6,w6,n6,x) a1.*(n1.*exp(-log(2).*((x-x0_1)./w1).^2)+(1-n1)./(1+((x-x0_1)./w1).^2))...
                    +a2.*(n2.*exp(-log(2).*((x-x0_2)./w2).^2)+(1-n2)./(1+((x-x0_2)./w2).^2))...
                    +a3.*(n3.*exp(-log(2).*((x-x0_3)./w3).^2)+(1-n3)./(1+((x-x0_3)./w3).^2))...
                    +a4.*(n4.*exp(-log(2).*((x-x0_4)./w4).^2)+(1-n4)./(1+((x-x0_4)./w4).^2))...
                    +a5.*(n5.*exp(-log(2).*((x-x0_5)./w5).^2)+(1-n5)./(1+((x-x0_5)./w5).^2))...
                    +a6.*(n6.*exp(-log(2).*((x-x0_6)./w6).^2)+(1-n6)./(1+((x-x0_6)./w6).^2)));
                [a1,x0_1,w1,n1,a2,x0_2,w2,n2,a3,x0_3,w3,n3,a4,x0_4,w4,n4,a5,x0_5,w5,n5,a6,x0_6,w6,n6] = deal(parameter(1),parameter(2),parameter(3),parameter(4),...
                    parameter(5),parameter(6),parameter(7),parameter(8),...
                    parameter(9),parameter(10),parameter(11),parameter(12),...
                    parameter(13),parameter(14),parameter(15),parameter(16),...
                    parameter(17),parameter(18),parameter(19),parameter(20),...
                    parameter(21),parameter(22),parameter(23),parameter(24));
                fit_objekt = cfit(fitType,a1,x0_1,w1,n1,a2,x0_2,w2,n2,a3,x0_3,w3,n3,a4,x0_4,w4,n4,a5,x0_5,w5,n5,a6,x0_6,w6,n6);
        end
    case 7
        switch fit_mode
            case 'gauss'
                fitType = fittype('gauss7');
                [a1,x0_1,w1,a2,x0_2,w2,a3,x0_3,w3,a4,x0_4,w4,a5,x0_5,w5,a6,x0_6,w6,a7,x0_7,w7] = deal(parameter(1),parameter(2),parameter(3),...
                    parameter(4),parameter(5),parameter(6),...
                    parameter(7),parameter(8),parameter(9),...
                    parameter(10),parameter(11),parameter(12),...
                    parameter(13),parameter(14),parameter(15),...
                    parameter(16),parameter(17),parameter(18),...
                    parameter(19),parameter(20),parameter(21));
                fit_objekt = cfit(fitType,a1,x0_1,w1,a2,x0_2,w2,a3,x0_3,w3,a4,x0_4,w4,a5,x0_5,w5,a6,x0_6,w6,a7,x0_7,w7);
            case 'pseudo-voigt'
                fitType = fittype(@(a1,x0_1,w1,n1,a2,x0_2,w2,n2,a3,x0_3,w3,n3,a4,x0_4,w4,n4,a5,x0_5,w5,n5,a6,x0_6,w6,n6,a7,x0_7,w7,n7,x) a1.*(n1.*exp(-log(2).*((x-x0_1)./w1).^2)+(1-n1)./(1+((x-x0_1)./w1).^2))...
                    +a2.*(n2.*exp(-log(2).*((x-x0_2)./w2).^2)+(1-n2)./(1+((x-x0_2)./w2).^2))...
                    +a3.*(n3.*exp(-log(2).*((x-x0_3)./w3).^2)+(1-n3)./(1+((x-x0_3)./w3).^2))...
                    +a4.*(n4.*exp(-log(2).*((x-x0_4)./w4).^2)+(1-n4)./(1+((x-x0_4)./w4).^2))...
                    +a5.*(n5.*exp(-log(2).*((x-x0_5)./w5).^2)+(1-n5)./(1+((x-x0_5)./w5).^2))...
                    +a6.*(n6.*exp(-log(2).*((x-x0_6)./w6).^2)+(1-n6)./(1+((x-x0_6)./w6).^2))...
                    +a7.*(n7.*exp(-log(2).*((x-x0_7)./w7).^2)+(1-n7)./(1+((x-x0_7)./w7).^2)));
                [a1,x0_1,w1,n1,a2,x0_2,w2,n2,a3,x0_3,w3,n3,a4,x0_4,w4,n4,a5,x0_5,w5,n5,a6,x0_6,w6,n6,a7,x0_7,w7,n7] = deal(parameter(1),parameter(2),parameter(3),parameter(4),...
                    parameter(5),parameter(6),parameter(7),parameter(8),...
                    parameter(9),parameter(10),parameter(11),parameter(12),...
                    parameter(13),parameter(14),parameter(15),parameter(16),...
                    parameter(17),parameter(18),parameter(19),parameter(20),...
                    parameter(21),parameter(22),parameter(23),parameter(24),...
                    parameter(25),parameter(26),parameter(27),parameter(28));
                fit_objekt = cfit(fitType,a1,x0_1,w1,n1,a2,x0_2,w2,n2,a3,x0_3,w3,n3,a4,x0_4,w4,n4,a5,x0_5,w5,n5,a6,x0_6,w6,n6,a7,x0_7,w7,n7);
        end
    case 8
        switch fit_mode
            case 'gauss'
                fitType = fittype('gauss8');
                [a1,x0_1,w1,a2,x0_2,w2,a3,x0_3,w3,a4,x0_4,w4,a5,x0_5,w5,a6,x0_6,w6,a7,x0_7,w7,a8,x0_8,w8] = deal(parameter(1),parameter(2),parameter(3),...
                    parameter(4),parameter(5),parameter(6),...
                    parameter(7),parameter(8),parameter(9),...
                    parameter(10),parameter(11),parameter(12),...
                    parameter(13),parameter(14),parameter(15),...
                    parameter(16),parameter(17),parameter(18),...
                    parameter(19),parameter(20),parameter(21),...
                    parameter(22),parameter(23),parameter(24));
                fit_objekt = cfit(fitType,a1,x0_1,w1,a2,x0_2,w2,a3,x0_3,w3,a4,x0_4,w4,a5,x0_5,w5,a6,x0_6,w6,a7,x0_7,w7,a8,x0_8,w8);
            case 'pseudo-voigt'
                fitType = fittype(@(a1,x0_1,w1,n1,a2,x0_2,w2,n2,a3,x0_3,w3,n3,a4,x0_4,w4,n4,a5,x0_5,w5,n5,a6,x0_6,w6,n6,a7,x0_7,w7,n7,a8,x0_8,w8,n8,x) a1.*(n1.*exp(-log(2).*((x-x0_1)./w1).^2)+(1-n1)./(1+((x-x0_1)./w1).^2))...
                    +a2.*(n2.*exp(-log(2).*((x-x0_2)./w2).^2)+(1-n2)./(1+((x-x0_2)./w2).^2))...
                    +a3.*(n3.*exp(-log(2).*((x-x0_3)./w3).^2)+(1-n3)./(1+((x-x0_3)./w3).^2))...
                    +a4.*(n4.*exp(-log(2).*((x-x0_4)./w4).^2)+(1-n4)./(1+((x-x0_4)./w4).^2))...
                    +a5.*(n5.*exp(-log(2).*((x-x0_5)./w5).^2)+(1-n5)./(1+((x-x0_5)./w5).^2))...
                    +a6.*(n6.*exp(-log(2).*((x-x0_6)./w6).^2)+(1-n6)./(1+((x-x0_6)./w6).^2))...
                    +a7.*(n7.*exp(-log(2).*((x-x0_7)./w7).^2)+(1-n7)./(1+((x-x0_7)./w7).^2))...
                    +a8.*(n8.*exp(-log(2).*((x-x0_8)./w8).^2)+(1-n8)./(1+((x-x0_8)./w8).^2)));
                [a1,x0_1,w1,n1,a2,x0_2,w2,n2,a3,x0_3,w3,n3,a4,x0_4,w4,n4,a5,x0_5,w5,n5,a6,x0_6,w6,n6,a7,x0_7,w7,n7,a8,x0_8,w8,n8] = deal(parameter(1),parameter(2),parameter(3),parameter(4),...
                    parameter(5),parameter(6),parameter(7),parameter(8),...
                    parameter(9),parameter(10),parameter(11),parameter(12),...
                    parameter(13),parameter(14),parameter(15),parameter(16),...
                    parameter(17),parameter(18),parameter(19),parameter(20),...
                    parameter(21),parameter(22),parameter(23),parameter(24),...
                    parameter(25),parameter(26),parameter(27),parameter(28),...
                    parameter(29),parameter(30),parameter(31),parameter(32));
                fit_objekt = cfit(fitType,a1,x0_1,w1,n1,a2,x0_2,w2,n2,a3,x0_3,w3,n3,a4,x0_4,w4,n4,a5,x0_5,w5,n5,a6,x0_6,w6,n6,a7,x0_7,w7,n7,a8,x0_8,w8,n8);
        end
end
end

