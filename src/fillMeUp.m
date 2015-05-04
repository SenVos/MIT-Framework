function [filled_variable] = fillMeUp(toBeFilled, filler)
% function to fill an empty variable

if ~isempty(toBeFilled)
    % if the variable is not empty it will remain the same
    filled_variable = toBeFilled;
else
    % if the variable is empty it will be "filled" with filler
    filled_variable = filler;
end