A = readtable('Automobiles1.xlsx')
A.Properties.VariableNames = {'symboling' 'normalized_losses' 'make' 'fuel_type' 'aspiration' 'num_of_doors' 'body_style' 'drive_wheels' 'engine_location' 'wheel_base' 'length' 'width' 'height' 'curb_weight' 'engine_type' 'num_of_cylinders' 'engine_size' 'fuel_system' 'bore' 'stroke' 'compression_ratio' 'horsepower' 'peak_rpm' 'city_mpg' 'highway_mpg' 'price'}

%cleaning data
%removing unwanted columns
A.symboling = []
A.normalized_losses = []
A.aspiration = []
A.drive_wheels = []
A.wheel_base = []
A.curb_weight = []
A.engine_type = []
A.fuel_system = []
A.bore = []
A.stroke = []
A.compression_ratio = []
A.city_mpg = []
A.highway_mpg = []
A.fuel_type = []
A.num_of_doors = []
A.engine_location = []
A.num_of_cylinders = []
A.peak_rpm = []

%removing unknown data rows
strcmp(A.horsepower, '?')
strcmp(A.peak_rpm, '?')
strcmp(A.price, '?')

A(strcmp(A.horsepower, '?'), :) = []
A(strcmp(A.peak_rpm, '?'),:) = []
A(strcmp(A.price, '?'),:) = []

%Comparing the number of particular body styles to ascertain popularity
sdncount = 0
hbcount = 0
cvtcount = 0
wagcount = 0
htcount = 0

B1 = string(A.body_style)

for i = 1:length(B1)
    if B1(i) == "sedan"
        sdncount = sdncount + 1
    else if B1(i) == "hatchback"
            hbcount = hbcount + 1
        else if B1(i) == "convertible"
                cvtcount = cvtcount + 1
            else if B1(i) == "wagon"
                    wagcount = wagcount + 1
                else
                    htcount = htcount + 1
                end
            end
        end
    end
end

bs_counts = [sdncount hbcount cvtcount wagcount htcount]

%pie chart of body styles by count
pbs = pie(bs_counts)
pText = findobj(pbs,'Type','text')
percentValues = get(pText,'String')
txt = {'Sedan: ';'Hatchback: ';'Convertible: ';'Wagon: ';'Hardtop: '}
combinedtxt = strcat(txt,percentValues)
labels = combinedtxt
pbs = pie(bs_counts, labels)

title('Body Styles')

%changing prices to double
A.price = str2double(A.price)

%analysis of prices
min(A.price)
max(A.price)
mean(A.price)
histogram(A.price)
title('Prices')

%analysis of engine sizes
min(A.engine_size)
max(A.engine_size)
mean(A.engine_size)
histogram(A.engine_size)
title('Engine Sizes')

%checking for correlation between engine size and price
corrcoef(A.engine_size, A.price)

%plot to show correlation between engine size and price
plot(A.engine_size, A.price,  'linestyle', 'none', 'marker', '.')
xlabel('Engine Size')
ylabel('Price')
title('Engine Sizes and Prices')

%analysis of height, width and length
min(A.height)
max(A.height)
mean(A.height)
histogram(A.height)
title('Car Heights')

min(A.width)
max(A.width)
mean(A.width)
histogram(A.width)
title('Car Widths')

min(A.length)
max(A.length)
mean(A.length)
histogram(A.length)
title('Car Lengths')

%checking for correlation between height, width, and length
corrcoef(A.height, A.width)
corrcoef(A.height, A.length)
corrcoef(A.width, A.length) 

%plot to show correlation between width and length
plot(A.width, A.length, 'linestyle', 'none', 'marker', '.')
xlabel('Width')
ylabel('Length')
title('Width and Length')

%analysis of horsepower
A.horsepower = str2double(A.horsepower) %changing horsepower from cell to double
min(A.horsepower)
max(A.horsepower)
mean(A.horsepower)
histogram(A.horsepower)
title('Horsepower')

%checking correlation between horsepower and engine size
corrcoef(A.horsepower, A.engine_size)

%plot to show correlation between horsepower and engine size
plot(A.horsepower, A.engine_size, 'linestyle', 'none', 'marker', '+')
xlabel('Horsepower')
ylabel('Engine Size')
title('Horsepower and Engine Size')

%checking correlation between horsepower and price
corrcoef(A.horsepower, A.price)

%plot to show correlation between horsepower and price
plot(A.horsepower, A.price, 'linestyle', 'none', 'marker', '*')
xlabel('Horsepower')
ylabel('Price')
title('Horsepower and Price')

%organising brands by price
B2 = string(A.make)

volprice = []
vkwprice = []
toyprice = []
subprice = []
saabprice = []
porprice = []
plyprice = []
peugprice = []
nisprice = []
mitprice = []
merprice = []
mazprice = []
jagprice = []
isuprice = []
honprice = []
dodprice = []
chevprice = []
bmwprice = []
audiprice = []
arprice = []

for i = 1:length(A.make)
if B2(i) == "volvo"
volprice = [volprice, A.price(i)] 
else if B2(i) == "volkswagen"
vkwprice = [vkwprice, A.price(i)]
else if B2(i) == "toyota"
toyprice = [toyprice, A.price(i)]
else if B2(i) == "subaru"
subprice = [subprice, A.price(i)]
else if B2(i) == "saab"
saabprice = [saabprice, A.price(i)]
else if B2(i) == "porsche"
porprice = [porprice, A.price(i)]
else if B2(i) == "plymouth"
plyprice = [plyprice, A.price(i)]
else if B2(i) == "peugot"
peugprice = [peugprice, A.price(i)]
else if B2(i) == "nissan"
nisprice = [nisprice, A.price(i)]
else if B2(i) == "mitsubishi"
mitprice = [mitprice, A.price(i)]
else if B2(i) == "mercedes-benz"
merprice = [merprice, A.price(i)]
else if B2(i) == "mazda"
mazprice = [mazprice, A.price(i)]
else if B2(i) == "jaguar"
jagprice = [jagprice, A.price(i)]
else if B2(i) == "isuzu"
isuprice = [isuprice, A.price(i)]
else if B2(i) == "honda"
honprice = [honprice, A.price(i)]
else if B2(i) == "dodge"
dodprice = [dodprice, A.price(i)]
else if B2(i) == "chevrolet"
chevprice = [chevprice, A.price(i)]
else if B2(i) == "bmw"
bmwprice = [bmwprice, A.price(i)]
else if B2(i) == "audi"
audiprice = [audiprice, A.price(i)]
    else
arprice = [arprice, A.price(i)]
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end


%finding the average price of each brand
volmean = mean(volprice) 
vkwmean = mean(vkwprice)
toymean = mean(toyprice)
submean = mean(subprice)
saabmean = mean(saabprice)
pormean = mean(porprice) 
plymean = mean(plyprice)
peugmean = mean(peugprice)
nismean = mean(nisprice) 
mitmean = mean(mitprice) 
mermean = mean(merprice)
mazmean = mean(mazprice) 
jagmean = mean(jagprice) 
isumean = mean(isuprice)
honmean = mean(honprice)
dodmean = mean(dodprice)
chevmean = mean(chevprice) 
bmwmean = mean(bmwprice) 
audimean = mean(audiprice) 
armean = mean(arprice)

car_make_means = [volmean, vkwmean, toymean, submean, saabmean, pormean, plymean, peugmean, nismean, mitmean, mermean, mazmean, jagmean, isumean, honmean, dodmean, chevmean, bmwmean, audimean, armean]
min(car_make_means)  %chevrolet mean
max(car_make_means)  %jaguar mean

makes =  ["volvo", "volkswagen", "toyota", "subaru", "saab", "porsche", "plymouth", "peugot", "nissan", "mitsubishi", "mercedes", "mazda", "jaguar", "isuzu", "honda", "dodge", "chevrolet", "bmw", "audi", "alfa-romero" ]'
make_means = car_make_means'
MT = table(makes, make_means)

%plot to compare average prices of cars by brand
bar(car_make_means)
ylabel('Mean Price')
Xticklabel = { 'volvo', 'volkswagen', 'toyota', 'subaru', 'saab', 'porsche', 'plymouth', 'peugot', 'nissan', 'mitsubishi', 'mercedes', 'mazda', 'jaguar', 'isuzu', 'honda', 'dodge', 'chevrolet', 'bmw', 'audi', 'alfa-romero' }
set(gca,'XtickLabel',Xticklabel)
xlabel('Brands')
title('Car Brands by Mean Price')









