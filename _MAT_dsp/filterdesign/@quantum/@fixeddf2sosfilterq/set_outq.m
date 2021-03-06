function set_outq(q, accWL, accFL)
%SET_OUTQ Specify output word and fraction length for the mexfunction.

% This should be a private method.

%   Author(s): V. Pellissier
%   Copyright 1999-2004 The MathWorks, Inc.

outWL = q.privoutwl;
if strcmpi(q.privOutputMode, 'AvoidOverflow') || strcmpi(q.privOutputMode, 'BestPrecision'),
    bits2add = 2;
    ideal_numaccWL = q.privstatewl + q.privcoeffwl + bits2add;
    ideal_numaccFL = q.privstatefl + q.privcoefffl;
    outFL = outWL - (min(accWL-accFL,ideal_numaccWL-ideal_numaccFL));
else
    outFL = q.privoutfl;
end
if ~isempty(outFL),
    q.privoutfl = outFL;
end

% [EOF]
