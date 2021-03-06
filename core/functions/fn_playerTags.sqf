    /*
        File: fn_playerTags.sqf
        Author: Bryan "Tonic" Boardwine
        
        Description:
        Adds the tags above other players heads when close and have visible range.
    */
    private["_visible","_position","_nearUnits","_vis","_pos","_near","_name","_icon","_width","_height"];
    _nearUnits = (visiblePosition player) nearEntities ["Man",20];
    {
        if(player distance _x < 20 && isPlayer _x && _x != player) then {
            _visible = lineIntersects [eyePos player, eyePos _x,player, _x];
            if(!_visible) then {
                _position = visiblePosition _x;
                _position set[2,(getPosATL _x select 2) + 2.2];
                
					_width = 0;
                    _height = 0;
                    switch (_x getVariable["coplevel", 0]) do
                    
                    {
						case (1) : {_name = format["Recrue %1", name _x];_icon = "images\icon_recruit.paa";};
						case (2) : {_name = format["Policier %1", name _x];_icon = "images\icon_officer.paa";};
						case (3) : {_name = format["Brigadier %1", name _x];_icon = "images\icon_detective.paa";};					
						case (4) : {_name = format["Major %1", name _x];_icon = "images\icon_sergeant.paa";};
						case (5) : {_name = format["Lieutenant %1", name _x];_icon = "images\icon_lieutenant.paa";};
						case (6) : {_name = format["Capitaine %1", name _x];_icon = "images\icon_captain.paa";};
						case (7) : {_name = format["Colonel %1", name _x];_icon = "images\icon_deputychief.paa";};
						case (8) : {_name = format["Admin %1", name _x];_icon = "images\icon_chief.paa";};
                       
                        
                        


                        default {_name = name _x; _icon = ""; _width = 0; _height = 0;}
                    };
                    if (_x getVariable["coplevel", 0] > 0) then
                    {
                        _icon = [((_x getVariable["coplevel", 0]) - 1),"texture"] call BIS_fnc_rankParams;
                    };
                    
                
                
                
                drawIcon3D [_icon,[1,1,1,1],_position,_width,_height,0,_name,0,0.04];
                
            };
        };
    } foreach _nearUnits;