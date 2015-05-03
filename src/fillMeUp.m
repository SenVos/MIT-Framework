function [filled_variable] = fillMeUp(toBeFilled, filler)

if ~isempty(toBeFilled)
    filled_variable = toBeFilled;
else
    filled_variable = filler;
end