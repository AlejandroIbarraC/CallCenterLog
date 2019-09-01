% ARCHIVO MAPA TEMPORAL

% next/5
% (Place1, Place2, Direction, WhichSide, Distance)
%
% Distance is in metres, e.g.
%
% next(2q29, 2q30, south, right, 10). 
%
% States that walking from room 2q29 southbound about 10 metres, 
% you will find room 2q30 on your right side.
next('exit2', '2q56', east, right, 5).		
next('2q56', 'exit2', west, right, 5). 		
next('exit1', 'area1', west, right, 2).
next('area1', 'exit1', east, right, 2).
next('exit2', 'exit1', west, right, 1).
next('exit1', 'exit2', east, right, 1).
next('area1', 'exit3', west, front, 2).
next('exit3', 'area1', east, left, 2).
next('2q56', '2q4', east, left, 3).
next('2q4', '2q56', west, left, 3).
next('junt2', 'junt1', west, front, 5).
next('junt1', 'junt2', east, right, 5).
next('2q4', 'junt1', east, front, 1).
next('junt1', '2q4', west, right, 1).
next('junt1', '2q5', north, left, 2).
next('2q5', 'junt1', south, front, 2).
next('2q5', '2q6', north, left, 5).
next('2q6', '2q5', south, right, 5).
next('2q6', '2q31', north, right, 4).
next('2q31', '2q6', south, right, 4).		
next('2q31', '2q30', north, right, 5).
next('2q30', '2q31', south, left, 5).
next('2q30', '2q9', north, left, 2).
next('2q9', '2q30', south, left, 2).		
next('2q9', '2q29', north, right, 2).
next('2q29', '2q9', south, right, 2).		
next('2q29', 'exit5', north, left, 1).
next('exit5', '2q29', south, left, 1).		
next('exit5', 'junt3', north, front, 12).
next('junt3', 'exit5', south, right, 12).
next('junt3', '2q23', north, right, 6).
next('2q23', 'junt3', south, front, 6).
next('2q23', '2q21', north, right, 1).
next('2q21', '2q23', south, left, 1).
next('2q21', 'exit6', north, front, 1).
next('exit6', '2q21', south, left, 1).
next('junt3', 'area2', east, right,10).
next('area2', 'junt3', west, front,10).
next('area2', '2q24', east, left,2).
next('2q24', 'area2', west, left,2).		
next('2q24', '2q25', east, left,4).
next('2q25', '2q24', west, right,4).
next('junt2','2q52', south, right,3).
next('2q52', 'junt2', north, front,3).
next('2q52', '2q50', south, right, 6).
next('2q50', '2q52', north, left, 6).
next('2q50', '2q42', south, left, 4).
next('2q42', '2q50', north, left, 4).		
next('2q42', '2q43', south, left, 2).
next('2q43', '2q42', north, right, 2).
next('2q43', '2q49', south, right, 1).
next('2q49', '2q43', north, right, 1).		
next('2q49', 'area3', south, left, 1).
next('area3', '2q49', north, left, 1).
next('area3', '2q46', south, left, 3).
next('2q46', 'area3', north, right, 3).
next('2q46', '2q47', south, left, 2).
next('2q47', '2q46', north, right, 2).
next('2q47', '2q48', south, right, 2).
next('2q48', '2q47', north, right, 2).
next('2q48', 'exit4', south, front, 2).
next('exit4', '2q48', north, left, 2).		

% info/2
% (Place, PlaceInfo)
%
% Stroes metadata about places in Q-block.
info('2q56', reception).
info('2q6', cafe).
info('2q4', toilet).
info('2q5', toilet).
info('2q21', toilet).
info('2q23', toilet).
info('area1', 'vending machine').
info('area3', 'vending machine').
info('area2', lockers).
info('exit1', exit).
info('exit2', exit).
info('exit3', exit).
info('exit4', exit).
info('exit5', exit).
info('exit6', exit).
info('exit1', out).
info('exit2', out).
info('exit3', out).
info('exit4', out).
info('exit5', out).
info('exit6', out).

